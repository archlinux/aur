# Maintainer: André Silva <emulatorman@riseup.net>
# Contributor: Márcio Silva <coadde@riseup.net>
# Contributor (Parabola): Luke R. <g4jc@openmailbox.org>
# Contributor (Parabola): Isaac David <isacdaavid@isacdaavid.info>

# We're getting this from Debian Sid
_debname=icedove
_brandingver=45.5.0
_brandingrel=2
_debver=45.8.0
_debrel=deb3
_debrepo=http://ftp.debian.org/debian/pool/main/
_coadderepo=https://github.com/coadde/icedove/raw/master/tarballs
debfile() { echo $@|sed -r 's@(.).*@\1/&/&@'; }

_pkgname=thunderbird
pkgname=icedove
epoch=1
pkgver=$_debver.$_debrel
pkgrel=2

pkgdesc="A libre version of Debian Icedove, the standalone mail and news reader based on Mozilla Thunderbird."
arch=(i686 x86_64 armv7h)
license=(MPL GPL LGPL)
depends=(alsa-lib dbus-glib gtk2 hunspell icu=59.1 libevent libvpx libxt mime-types mozilla-common nss sqlite startup-notification ttf-font)
makedepends=(autoconf2.13 diffutils gconf imake inetutils libpulse mesa mozilla-searchplugins pkg-config python2 quilt unzip yasm zip)
options=(!emptydirs !makeflags)
optdepends=('libcanberra: for sound support')
url="https://wiki.parabola.nu/$pkgname"
replaces=("$pkgname-libre" "$_pkgname")
conflicts=("$pkgname-libre" "$_pkgname")
provides=("$_pkgname")
install=$pkgname.install
source=("$_debrepo/`debfile $_debname`_$_debver.orig.tar.xz"
        "$_debrepo/`debfile $_debname`_$_debver-${_debrel#deb}.debian.tar.xz"
        "$_coadderepo/${pkgname}_$_brandingver-$_brandingrel.branding.tar.xz"
        "$_coadderepo/${pkgname}_$_brandingver-$_brandingrel.branding.tar.xz.sig"
        mozconfig
        $pkgname.desktop
        changing-the-default-search-engine.patch
        firefox-gcc-6.0.patch mozilla-1228540.patch mozilla-1228540-1.patch
        vendor.js
        fix-missing-files.patch
        no-neon.patch
        mozilla-1253216.patch)
sha256sums=('49adb7d861bca2cddf20cd27533216e52a0a5a2431bd5663e931d8f60ee7e30f'
            'cd14b9e991acbdf301aa172d7284cc2a8b5734ee478c74025bdbcd1df516da39'
            'c3d021ee2af516fa694c65c54c4b239f4d5aa564590aefea665e20b1828e383d'
            'SKIP'
            'dd721cf5cc2cd07af540ba63eb4860643bd9455ed1d7df28c4d40c7c7065fb58'
            '0b0d25067c64c6b829c84e5259ffca978e3971f85acc8483f47bdbed5b0b5b6a'
            'e1f72c44e31f191271207fc874dcfbf3d504b6b42dc1bb063ba8c7c9ee032130'
            '4d1e1ddabc9e975ed39f49e134559a29e01cd49439e358233f1ede43bf5a52bf'
            '3a3e84c702ee31450a3e84698441aceb11cf44e64c9fedcaddb8cb50db759417'
            'd1ccbaf0973615c57f7893355e5cd3a89efb4e91071d0ec376e429b50cf6ed19'
            '058b58074368b57acf8a6df9a9ffac848b7d7b39f5abd84cb2039bcee42b73e2'
            '294a2cc7b0477ad285af10ac2a04b767cabec07f03b23da23014bda71caea510'
            '59f40d8b2480aa67bf76f4f119826b6828a6a59cc040caf1ab5a6e19eef44c6e'
            '1e7ef08acd46aeacc8cd8b2c89012983fb2c8c18648e0f3e9371b0c76caedbde')
validpgpkeys=(
              'C92BAA713B8D53D3CAE63FC9E6974752F9704456' # André Silva
              '684D54A189305A9CC95446D36B888913DDB59515' # Márcio Silva
)

prepare() {
  cd "$srcdir/$_pkgname-$_debver"
  mv "$srcdir/debian" .
  rm -rv debian/logo
  rm -rv debian/patches/icedove{,-l10n} || true
  sed -i '\|icedove|d' debian/patches/series
  mv "$srcdir/$pkgname-$_brandingver/"{app-icons,icedove{-branding,.xpm},logo,preview.png} debian
  mv "$srcdir/$pkgname-$_brandingver/patches/"{icedove,iceowl} debian/patches
  mv "$srcdir/$pkgname-$_brandingver/patches/debian-hacks/Icedove-branding.patch" debian/patches/debian-hacks
  cat "$srcdir/$pkgname-$_brandingver/patches/series" >> debian/patches/series

  export QUILT_PATCHES=debian/patches
  export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
  export QUILT_DIFF_ARGS='--no-timestamps'

  # Prepare branding for the Icedove packages
  mkdir -v mail/branding/$pkgname

  # Copy needed icons
  cp -va debian/$pkgname-branding/* mail/branding/$pkgname
  for i in 16 22 24 32 48 256; do
    install -Dm644 debian/app-icons/$pkgname$i.png \
      mail/branding/$pkgname/mailicon$i.png
  done
  for i in 48 64; do
    install -Dm644 debian/app-icons/$pkgname$i.png \
      mail/branding/$pkgname/content/icon$i.png
  done
  cp -av debian/preview.png mail/themes/linux/mail/preview.png

  # Useless since we are doing it ourselves
  rm -v debian/patches/debian-hacks/changing-the-default-search-engine.patch || true

  quilt push -av

  # Fix missing files
  patch -Np1 -i "$srcdir/fix-missing-files.patch"

  # Remove url-classifier from package-manifest.in to build and disable Phishing Protection
  sed -i '\|Phishing Protection|d
          \|UrlClassifier|d
          \|URLClassifier|d
          \|url-classifier|d
         ' mail/installer/package-manifest.in

  # Replace common URLs
  sed -i '\|extensions[.]getAddons[.]get[.]url| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|https://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]getAddons[.]search[.]browseURL| s|https://addons[.]mozilla[.]org.\+["][)][;]|https://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]getAddons[.]search[.]url| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|https://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]webservice[.]discoverURL| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|https://directory.fsf.org/wiki/Icedove");|g;
         ' mail/app/profile/all-thunderbird.js

  # Required for GCC 6
  patch -d mozilla -Np1 < ../firefox-gcc-6.0.patch
  patch -d mozilla -Np1 < ../mozilla-1228540.patch
  patch -d mozilla -Np1 < ../mozilla-1228540-1.patch

  cp -v "$srcdir/mozconfig" .mozconfig

  mkdir "$srcdir/path"
  ln -s /usr/bin/python2 "$srcdir/path/python"

  # Change the default search engine using our system-provided searchplugins
  patch -Np1 -i "$srcdir/changing-the-default-search-engine.patch"

  # Load our searchplugins
  rm -rv mail/locales/en-US/searchplugins
  cp -av /usr/lib/mozilla/searchplugins mail/locales/en-US

  # ARM-specific changes:
  if [[ "$CARCH" == arm* ]]; then
    # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=850984
    sed -i 's/\^\[:space:\]\*/^[[:space:]]*/' mozilla/{,js/src/}configure

    patch -Np0 -i ../no-neon.patch
    patch -p2 -d mozilla < ../mozilla-1253216.patch
    sed -i '/ac_add_options --enable-gold/d' .mozconfig
    cat >> .mozconfig <<- EOF
	ac_add_options --disable-elf-hack
	ac_add_options --disable-neon
	ac_add_options --disable-ion
	ac_add_options --disable-webrtc
	ac_add_options --disable-debug
	ac_add_options --disable-debug-symbols
	EOF
  fi
}

build() {
  cd "$srcdir/$_pkgname-$_debver"

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # GCC 6
  CFLAGS+=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"
  CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"

  export PATH="$srcdir/path:$PATH"

  make -f client.mk build
}

package() {
  cd "$srcdir/$_pkgname-$_debver"
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/$pkgname/defaults/preferences/vendor.js"

  # Install Icedove menu icon
  install -Dm644 debian/$pkgname.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"

  # Install Icedove icons
  brandingdir=debian/app-icons
  icondir="$pkgdir/usr/share/icons/hicolor"
  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 "$brandingdir/$pkgname$i.png" \
      "$icondir/${i}x${i}/apps/$pkgname.png"
  done
  install -Dm644 "$brandingdir/${pkgname}big.svg" \
    "$icondir/scalable/apps/$pkgname.svg"

  # Install Icedove desktop
  install -d "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications"

  # Use system-provided dictionaries
  rm -rf "$pkgdir/usr/lib/$pkgname/"{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/$pkgname/dictionaries"
  ln -s /usr/share/hyphen   "$pkgdir/usr/lib/$pkgname/hyphenation"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf $pkgname "$pkgdir/usr/lib/$pkgname/$pkgname-bin"
}
