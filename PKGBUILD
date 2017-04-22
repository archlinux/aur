# Maintainer: André Silva <emulatorman@riseup.net>
# Contributor: Márcio Silva <coadde@riseup.net>
# Contributor (ConnochaetOS): Henry Jensen <hjensen@connochaetos.org>
# Contributor (Parabola): Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor (Parabola): fauno <fauno@kiwwwi.com.ar>
# Contributor (Parabola): vando <facundo@esdebian.org>
# Contributor (Arch): Jakub Schmidtke <sjakub@gmail.com>
# Contributor (Parabola): Figue <ffigue at gmail>
# Contributor (Parabola): taro-k <taro-k@movasense_com>
# Contributor (Parabola): Michał Masłowski <mtjm@mtjm.eu>
# Contributor (Parabola): Luke R. <g4jc@openmailbox.org>
# Contributor (Parabola): Isaac David <isacdaavid@isacdaavid.info>
# Thank you very much to the older contributors:
# Contributor (Parabola): evr <evanroman at gmail>
# Contributor (Parabola): Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com>

_pgo=false

# We're getting this from Debian Sid
_debname=firefox
_brandingver=52.0
_brandingrel=2
_debver=52.0.2
_debrel=deb1
_debrepo=http://ftp.debian.org/debian/pool/main/
_parabolarepo=https://repo.parabola.nu/other/iceweasel
debfile() { echo $@|sed -r 's@(.).*@\1/&/&@'; }

_pkgname=firefox
pkgname=iceweasel
epoch=1
pkgver=$_debver.$_debrel
pkgrel=1
pkgdesc="A libre version of Debian Iceweasel, the standalone web browser based on Mozilla Firefox (Parabola rebranded)."
arch=(i686 x86_64 armv7h)
license=(MPL GPL LGPL)
depends=(alsa-lib dbus-glib ffmpeg gtk2 gtk3 hunspell icu=58.2 libevent libvpx libxt mime-types mozilla-common nss sqlite startup-notification ttf-font)
makedepends=(autoconf2.13 diffutils gconf imagemagick imake inetutils libidl2 libpulse librsvg-stable libxslt mesa mozilla-searchplugins pkg-config python2 quilt unzip yasm zip)
makedepends_i686=(cargo)
makedepends_x86_64=("${makedepends_i686[@]}")
options=(!emptydirs !makeflags !strip debug)
if $_pgo; then
  makedepends+=(xorg-server-xvfb)
  options+=(!ccache)
fi
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
url="https://wiki.parabola.nu/$pkgname"
replaces=("$pkgname-libre" "$_pkgname")
conflicts=("$pkgname-libre")
source=("$_debrepo/`debfile $_debname`_$_debver.orig.tar.xz"
        "$_debrepo/`debfile $_debname`_$_debver-${_debrel#deb}.debian.tar.xz"
        "$_parabolarepo/${pkgname}_$_brandingver-$_brandingrel.branding.tar.xz"
        "$_parabolarepo/${pkgname}_$_brandingver-$_brandingrel.branding.tar.xz.sig"
        mozconfig
        libre.patch
        remove-default-and-shell-icons-in-packaging-manifest.patch
        gnu_headshadow.png
        drm-free.png
        $pkgname.desktop
        $pkgname-install-dir.patch
        vendor.js
        distribution.ini
        fix-wifi-scanner.diff
        enable-object-directory-paths.patch
        mozilla-1253216.patch
        mozilla-build-arm.patch)
sha256sums=('0408956dfa3ab3728187394f567437f029f73603f1b295e01d5e64a2e4d1bf9e'
            'fe536e8b1c84301c4db505b1ea23926628b42e06122bd844230f1ee52f45fea3'
            '30bce6326cdb9a6247f3325cfe326a51c4592728b254fc44656b96c06248ccd9'
            'SKIP'
            'a0d75304583fab8d5ae830745d32ad9d04ca7098fd7202975f89df813f38479d'
            '67e9430643cbecf69f1946fd84a5dda554fcdf1257896f9f828912b095daa08a'
            '32f1fe3ad4f80d0ae419064db2abe49b97cd7cb18c35d68be1a2befb60172a2a'
            '93e3001ce152e1d142619e215a9ef07dd429943b99d21726c25da9ceb31e31cd'
            '56eba484179c7f498076f8dc603d8795e99dce8c6ea1da9736318c59d666bff6'
            '250f7aaa3c1362f9d2bb2211cd605eab93a5e806e8540f184979d41acf46142a'
            '3aea6676f1e53a09673b6ae219d281fc28054beb6002b09973611c02f827651d'
            '86f12cb438c93a0f019786de8be99bffc5f2f4926342bd567a3e4a1f4cef42ab'
            'd28b14a870aa100273243039d08ab9e64d325c28b6291413441146ebdf5d38ee'
            '9765bca5d63fb5525bbd0520b7ab1d27cabaed697e2fc7791400abc3fa4f13b8'
            'e260e555b261aabab1e48786dd514eeea056e4402af7cfd4dfd1d32858441484'
            'fbb6011501a74a8ea6d01c041870fcefb7ef2859c134aedc676e5f6452833f65'
            '56eecee8162c138c442773d66483886f1242c8dd2b16eed5711ae5e63d9b0e3a')
validpgpkeys=(
              'C92BAA713B8D53D3CAE63FC9E6974752F9704456' # André Silva
              '684D54A189305A9CC95446D36B888913DDB59515' # Márcio Silva
)

prepare() {
  cd "$srcdir/$_pkgname-$_debver"
  mv "$srcdir/debian" .
  mv "$srcdir/$pkgname-$_brandingver/branding" debian
  mv "$srcdir/$pkgname-$_brandingver/patches/iceweasel-branding" debian/patches
  cat "$srcdir/$pkgname-$_brandingver/patches/series" >> debian/patches/series

  export QUILT_PATCHES=debian/patches
  export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
  export QUILT_DIFF_ARGS='--no-timestamps'

  quilt push -av

  # Put gnu_headshadow.png and drm-free.png in the source code
  install -m644 "$srcdir/"{gnu_headshadow,drm-free}.png \
    browser/base/content/abouthome

  # Useless since we are doing it ourselves
  patch -Np1 -i "$srcdir/remove-default-and-shell-icons-in-packaging-manifest.patch"

  # Enable object directory paths for Iceweasel rebranding
  patch -Np1 -i "$srcdir/enable-object-directory-paths.patch"

  # Install to /usr/lib/iceweasel
  patch -Np1 -i "$srcdir/$pkgname-install-dir.patch"

  # Patch and remove anything that's left
  patch -Np1 -i "$srcdir/libre.patch"
  sed -i 's|Adobe Flash|SWF Player|g;
         ' browser/base/content/pageinfo/permissions.js \
           browser/base/content/browser-plugins.js
  sed -i '\|["]displayName["][:] ["]Flash["]| s|Flash|SWF Player|
          \|["]displayName["][:] ["]Shockwave["]| s|Shockwave|DCR Player|
          \|["]displayName["][:] ["]QuickTime["]| s|QuickTime|MOV Player|
          \|installLinux| s|true|false|
         ' browser/base/content/browser-plugins.js

  # Load our build config, disable SafeSearch
  cp "$srcdir/mozconfig" .mozconfig

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i ../fix-wifi-scanner.diff

  mkdir "$srcdir/path"
  ln -s /usr/bin/python2 "$srcdir/path/python"

  # Load our searchplugins
  rm -rv browser/locales/searchplugins
  cp -av /usr/lib/mozilla/searchplugins browser/locales

  # Disable various components at the source level
  sed -i 's|[;]1|;0|' toolkit/components/telemetry/TelemetryStartup.manifest || die "failed break telemetry startup"
  sed -i 's|[;]1|;0|' browser/experiments/Experiments.manifest || die "failed to break ExperimentsService"
  sed -i '/pocket/d' browser/extensions/moz.build || die "failed to wipe pocket"

  # ARM-specific changes:
  if [[ "$CARCH" == arm* ]]; then
      sed -i '/ac_add_options --enable-rust/d' .mozconfig
      echo "ac_add_options --disable-ion" >> .mozconfig
      echo "ac_add_options --disable-elf-hack" >> .mozconfig
      echo "ac_add_options --disable-webrtc" >> .mozconfig

      # Disable gold linker, reduce memory consumption at link time
      sed -i '/ac_add_options --enable-gold/d' .mozconfig
      LDFLAGS+=" -Wl,--no-keep-memory -Wl,--reduce-memory-overheads"
      echo "ac_add_options --disable-tests" >> .mozconfig
      echo "ac_add_options --disable-debug" >> .mozconfig

      patch -p1 -i ../mozilla-1253216.patch
      patch -p1 -i ../mozilla-build-arm.patch
  fi
}

build() {
  cd "$srcdir/$_pkgname-$_debver"

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  export PATH="$srcdir/path:$PATH"

  if $_pgo; then
    # Do PGO
    xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
      make -f client.mk build MOZ_PGO=1
  else
    make -f client.mk build
  fi
}

package() {
  cd "$srcdir/$_pkgname-$_debver"
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"

  _brandingdir=debian/branding
  brandingdir=moz-objdir/$_brandingdir
  icondir="$pkgdir/usr/share/icons/hicolor"
  for i in 16 22 24 32 48 64 128 192 256 384; do
    rsvg-convert -w $i -h $i "$_brandingdir/${pkgname}_icon.svg" \
      -o "$brandingdir/default$i.png"
    install -Dm644 "$brandingdir/default$i.png" \
      "$icondir/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm644 "$_brandingdir/${pkgname}_icon.svg" \
    "$icondir/scalable/apps/$pkgname.svg"

  install -d "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications"

  # Parabola rebranding
  install -m644 "$srcdir/distribution.ini" \
    "$pkgdir/usr/lib/$pkgname/distribution"

  # Use system-provided dictionaries
  rm -rf "$pkgdir/usr/lib/$pkgname/"{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/$pkgname/dictionaries"
  ln -s /usr/share/hyphen   "$pkgdir/usr/lib/$pkgname/hyphenation"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf $pkgname "$pkgdir/usr/lib/$pkgname/$pkgname-bin"
}
