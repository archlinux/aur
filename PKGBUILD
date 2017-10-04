# Maintainer: Isabell Cowan <izzi@izzette.com>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>


# enable this if you run out of memory during linking
#_lowmem=true

# enable gtk3 (warning: flash or any other plugin  crashes frequently)
_gtk3=true

# try to build with PGO
# currently broken
#_pgo=false

# globalmenu
# to support globalmenu a patch from ubuntu is applied
# source:
# http://bazaar.launchpad.net/~mozillateam/firefox/firefox-trunk.head
# /view/head:/debian/patches/unity-menubar.patch

_pkgname=firefox
pkgname=$_pkgname-kde-opensuse-beta
pkgver=57.0b5
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://build.opensuse.org/package/show/mozilla:Factory/MozillaFirefox"
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'hicolor-icon-theme'
         'libvpx' 'icu'  'libevent' 'nss>=3.33' 'nspr>=4.17' 'hunspell'
         'sqlite' 'libnotify' 'kmozillahelper' 'ffmpeg' )
if [ $_gtk3 ] ; then
    depends+=('gtk3')
fi

makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake'
             'xorg-server-xvfb' 'libpulse' 'inetutils' 'autoconf2.13' 'rust'
            'cargo' 'clang' 'llvm')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech')
provides=("firefox=${pkgver}")
conflicts=('firefox')
_patchrev=tip
_debianrev=2113
options=('!emptydirs'  'strip')
_patchurl=http://www.rosenauer.org/hg/mozilla/raw-file/$_patchrev
source=("http://archive.mozilla.org/pub/$_pkgname/releases/$pkgver/source/$_pkgname-$pkgver.source.tar.xz"
        mozconfig firefox.desktop vendor.js kde.js firefox-fixed-loading-icon.png
        # Firefox patchset
        browser-kde.xul.diff
        $_patchurl/firefox-branded-icons.patch
        $_patchurl/firefox-kde.patch firefox-kde.patch.diff
        $_patchurl/firefox-no-default-ualocale.patch firefox-no-default-ualocale.patch.diff
        # Gecko/toolkit patchset
        $_patchurl/mozilla-kde.patch mozilla-kde.patch.diff
        $_patchurl/mozilla-nongnome-proxies.patch
        firefox-trunk.debsrc.tar.gz::http://bazaar.launchpad.net/~mozillateam/$_pkgname/$_pkgname-trunk.head/tarball/"$_debianrev"
        add_missing_pgo_rule.patch
        pgo_fix_missing_kdejs.patch
        wifi-disentangle.patch wifi-fix-interface.patch
        firefox-install-dir.patch no-crmf.diff
)



# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4


# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff

prepare() {
  mkdir -p "$srcdir/patched-patches"
  cd "$srcdir/patched-patches"

  msg2 "Patching OpenSUSE Patches"
  for patch in mozilla-kde firefox-kde firefox-no-default-ualocale; do
    cp "$srcdir/$patch.patch" .
    patch -Ni "$srcdir/$patch.patch.diff"
  done

  cd "$srcdir/$_pkgname-$pkgver"

  cp "$srcdir/mozconfig" .mozconfig

  patch -Np1 -i "$srcdir/firefox-install-dir.patch"


  echo -n "$_google_api_key" >google-api-key
  echo "ac_add_options --with-google-api-keyfile=\"$PWD/google-api-key\"" >>.mozconfig

  echo -n "$_google_default_client_id $_google_default_client_secret" >google-oauth-api-key
  echo "ac_add_options --with-google-api-keyfile=\"$PWD/google-oauth-api-key\"" >>.mozconfig

  echo -n "$_mozilla_api_key" >mozilla-api-key
  echo "ac_add_options --with-mozilla-api-keyfile=\"$PWD/mozilla-api-key\"" >>.mozconfig

  msg2 "Patching for KDE"
  patch -Np1 -i "$srcdir/mozilla-nongnome-proxies.patch"

  patch -Np1 -i "$srcdir/patched-patches/mozilla-kde.patch"

  cp \
    browser/base/content/browser.xul \
    browser/base/content/browser-kde.xul
  patch -Np1 -i "$srcdir/browser-kde.xul.diff"

  patch -Np1 -i "$srcdir/patched-patches/firefox-kde.patch"
  patch -Np1 -i "$srcdir/patched-patches/firefox-no-default-ualocale.patch"

  patch -Np1 -i "$srcdir/firefox-branded-icons.patch"

  # add globalmenu support
  patch -Np1 -i "$srcdir/~mozillateam/firefox/firefox-trunk.head/debian/patches/unity-menubar.patch"

  # add missing rule for pgo builds
  patch -Np1 -i "$srcdir"/add_missing_pgo_rule.patch

  # add missing file Makefile for pgo builds
  patch -Np1 -i "$srcdir"/pgo_fix_missing_kdejs.patch

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  # sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' configure

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1371991
  patch -Np1 -i ../no-crmf.diff

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i ../wifi-disentangle.patch
  patch -Np1 -i ../wifi-fix-interface.patch

  # WebRTC build tries to execute "python" and expects Python 2
  mkdir -p "$srcdir/path"
  ln -sf /usr/bin/python2 "$srcdir/path/python"

  # Fix tab loading icon (flickers with libpng 1.6)
  # https://bugzilla.mozilla.org/show_bug.cgi?id=841734
  # TODO: Remove this; Firefox 34 might use CSS animations for the loading icon
  # https://bugzilla.mozilla.org/show_bug.cgi?id=759252
  cp "$srcdir/firefox-fixed-loading-icon.png" \
     browser/themes/linux/tabbrowser/loading.png

  touch sourcestamp.txt

  mkdir -p "$srcdir/build"
  mkdir -p "$srcdir/build/dist/include"
}

build() {
  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  if [[ -n $_lowmem || $CARCH == i686 ]]; then
    LDFLAGS+=" -Xlinker --no-keep-memory"
  fi

  cd "$srcdir"

  if [[ "build/configure.txt" -ot "$_pkgname-$pkgver/sourcestamp.txt" ]]; then
    cd "$srcdir/$_pkgname-$pkgver"

    autoreconf-2.13 -i --force
    autoconf-2.13

    cd "$srcdir/build"

    # _FORTIFY_SOURCE causes configure failures
    CPPFLAGS_ORIGINAL="$CPPFLAGS"
    CPPFLAGS+=" -O2"

    "../$_pkgname-$pkgver"/configure \
      --prefix='/usr' \
      --disable-system-pixman  # With system pixman doesn't work?

    touch configure.txt

    CPPFLAGS="$CPPFLAGS_ORIGINAL"
  fi

  cd "$srcdir/build"

  # some headers are missing for some reason.
  ln -fs \
      "$srcdir/$_pkgname-$pkgver/nsprpub/lib/ds"/* \
      "$srcdir/$_pkgname-$pkgver/nsprpub/pr/include"/* \
      "$srcdir/$_pkgname-$pkgver/config/external/nspr"/* \
      "$srcdir/$_pkgname-$pkgver/gfx/cairo/libpixman/src"/* \
      "$srcdir/$_pkgname-$pkgver/nsprpub/lib/libc/include"/* \
      "dist/include"/

  MAKEARGS=('MOZ_SOURCE_CHANGESET="opensuse-kde-beta"')
  if [[ -n $_pgo ]]; then
    MAKEARGS+=('MOZ_PGO=1')
    MAKECMD=(xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make "${MAKEARGS[@]}")
  else
    MAKECMD=(make "${MAKEARGS[@]}")
  fi

  "${MAKECMD[@]}"
}

package() {
  cd "$srcdir/build"

  [[ "$CARCH" == "i686" ]] && cp "$srcdir/kde.js" dist/bin/defaults/pref
  [[ "$CARCH" == "x86_64" ]] && cp "$srcdir/kde.js" dist/bin/defaults/pref

  make install DESTDIR="$pkgdir" INSTALL_SDK=

  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"
  install -Dm644 "$srcdir/kde.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/kde.js"

  _distini="$pkgdir/usr/lib/firefox/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  cd "$srcdir/$_pkgname-$pkgver"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done

  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/firefox.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"

  install -Dm644 "$srcdir/firefox.desktop" "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"

  #workaround for now
  #https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"
}
sha256sums=('bbe48656693e562b60f643a76a825b84d57581bb83dcb9a3a7fa90ac47455d5d'
            'cf218e2f68556261726168b60be8fc4fa91832a1ed5309880516519f6d832d4b'
            '75c526e9669b91b4fe5dcea650a1e8419220abb2e9564184f0d984c71eae82e8'
            '93c5df00f409988bbfa890ac175103476ead3af68f7501973ee70bd11dc472f8'
            'b8cc5f35ec35fc96ac5c5a2477b36722e373dbb57eba87eb5ad1276e4df7236d'
            '68e3a5b47c6d175cc95b98b069a15205f027cab83af9e075818d38610feb6213'
            '8da046206e98649a371ce8e9b3dffc9532f78e963f764c866bc4e021b8b6fb5a'
            'c85a37e71f2bd511fac88d41ca0618ee375c49fc86bc2beddf6dc17c3f17508d'
            'f672e60e22869381e9c4cdd90353a053a0171778eca40d4664bc733822fd535f'
            'ecb7c3ae3f52ee9b430c1e8e69370b1dedb06674e1fcdc856d60942680bf7b62'
            'b941790009bb9eda46c2d96fb0d1c83b0fe2d1acf74754ab08e6b18c1e0c6b16'
            'f3c50e4ec8d58b23530d87a3162e0b33af58ea73b35dc51bd29b1fad0d26f43f'
            'e25b9fa2e4ac279b5e073286b7dc9956822bf508eccb67eb870921013274a709'
            'd43305705aab0520ac55c94dab4a545e90b15093d7b4c25359f7f145fa3723c4'
            'ef0f90c9134ef05b950f06a3ffbd699c2e5a5f99a4cdf9868e799534d68c204f'
            'beb277cf54a23faf5aab8d2ebea3683d75f60367468dd418e8f62ec834681b0c'
            'f9067f62a25a7a77276e15f91cc9e7ba6576315345cfc6347b1b2e884becdb0c'
            '2797d1e61031d24ee24bf682c9447b3b9c1bca10f8e6cbd597b854af2de1ec54'
            'f068b84ad31556095145d8fefc012dd3d1458948533ed3fff6cbc7250b6e73ed'
            'e98a3453d803cc7ddcb81a7dc83f883230dd8591bdf936fc5a868428979ed1f1'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            'fb85a538044c15471c12cf561d6aa74570f8de7b054a7063ef88ee1bdfc1ccbb')
