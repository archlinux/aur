# firefox-esr-privacy
pkgname=firefox-esr-privacy
_basever=45
pkgver=45.0.2
pkgrel=2
pkgdesc="Standalone web browser from mozilla.org"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('gtk2' 'libxt' 'startup-notification' 'dbus-glib' 'alsa-lib' 'desktop-file-utils'
         'hicolor-icon-theme' 'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'xorg-server' 'inetutils')
install=firefox.install
options=('!emptydirs')
conflicts=('firefox')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz
        firefox-install-dir.patch
        firefox-${_basever}-disable-location.services.mozilla.com.patch
        firefox-${_basever}-disable-loop-pocket.patch
        firefox-${_basever}-disable-sponsored-tiles.patch
        firefox-${_basever}-prefs.patch
        firefox-${_basever}-disable-telemetry.patch
        firefox-${_basever}-disable-data-sharing-infobar.patch
        firefox-${_basever}-disable-reader.patch
        firefox.desktop
        firefox-fixed-loading-icon.png
        mozconfig)
sha256sums=('939ac36c4bf30794e76e87903c0e0f5a813807310226c52f0fcd573275067ed3'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '8d9afa1f940a9dac689ead40a57990d1491f34a1787b2222f8f5b5e485d54103'
            '4ffefee2f47e2de114df0d8a0c9a7b964d6e6959ce691e274e259ad8fd85682e'
            '1926a3d3b8996cdbdd8b970a12d9880e3272181fd4b07c2c9277ca7290b159c3'
            '46a5fbd75febff5a901eed2ac711876bcb9e91e68e1812a3069cbb48de0e58b8'
            '5f97739f5962c98c94c0cf7a7361d9dac01be1366773cb2b45d2bd5938569fde'
            '52a94f48e562f98ba0b22b43b1684f6a813872b9c310d6f7567fe91aaab4944b'
            '01fa29086c1cba4a1fb7ea0e13baea3e210a771ccc67134fbb32de4185e0cb23'
            '0bcfe168964338ec9c6e781479f2f8d06aa44f2262d6405ff8fa42983be89630'
            '68e3a5b47c6d175cc95b98b069a15205f027cab83af9e075818d38610feb6213'
            '28b56c316c2f3a4072f1f9bb773eb355b204f66805654cb96d5dcda6d2a9a73e')
validpgpkeys=('2B90598A745E992F315E22C58AB132963A06537A')

prepare() {
  cd firefox-${pkgver}esr

  cp ${srcdir}/mozconfig mozconfig
  
  # Disable sponsored tiles
  patch -Np1 -i ${srcdir}/firefox-${_basever}-disable-sponsored-tiles.patch

  # Disable Loop (Firefox Hello) and Pocket integration
  patch -Np1 -i ${srcdir}/firefox-${_basever}-disable-loop-pocket.patch
  # Remove loop and pocket source directories
  rm -fr browser/extensions/loop/ browser/components/pocket/

  # Disable geo IP lookup on first run
  patch -Np1 -i ${srcdir}/firefox-${_basever}-disable-location.services.mozilla.com.patch
  
  # Set some sensible defaults
  patch -Np1 -i ${srcdir}/firefox-${_basever}-prefs.patch
  
  # Disable telemetry options
  patch -Np1 -i ${srcdir}/firefox-${_basever}-disable-telemetry.patch
  
  # Disable infobar "Firefox automatically sends some data to Mozilla..."
  patch -Np1 -i ${srcdir}/firefox-${_basever}-disable-data-sharing-infobar.patch
  
  # Disable reader view
  patch -Np1 -i ${srcdir}/firefox-${_basever}-disable-reader.patch
  
  # Fix build with Fontconfig 2.6
  sed -i '/^ftcache.h/a ftfntfmt.h' config/system-headers
  
  # Fix tab loading icon not working with libpng 1.6
  cp ${srcdir}/firefox-fixed-loading-icon.png browser/themes/linux/tabbrowser/loading.png
  
  # Install in /usr/lib/firefox without version number
  patch -Np1 -i ${srcdir}/firefox-install-dir.patch

  # Don't install files from the browser/features directory
  # This directory only contains the loop program, which is not built
  sed -i 's#@RESPATH@/browser/features/*#; @RESPATH@/browser/features/*#' browser/installer/package-manifest.in
}

build() {
  cd firefox-${pkgver}esr
  
  # Fix configure: error: Your toolchain does not support C++0x/C++11 mode properly. Please upgrade your toolchain
  unset CPPFLAGS
  
  make -f client.mk
}

package() {
  cd firefox-${pkgver}esr
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 ${srcdir}/firefox.desktop "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"
}
