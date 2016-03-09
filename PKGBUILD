pkgname=firefox-esr-privacy
_basever=38
_pkgdir=mozilla-esr${_basever}
pkgver=38.6.1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'xorg-server' 'inetutils')
install=firefox.install
options=('!emptydirs')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.bz2
        firefox-install-dir.patch
        firefox-${_basever}-disable-location.services.mozilla.com.patch
        firefox-${_basever}-disable-loop.patch
        firefox-${_basever}-disable-sponsored-tiles.patch
        firefox-${_basever}-prefs.patch
        firefox.desktop
        firefox-fixed-loading-icon.png
        mozconfig)
sha256sums=('91174d0118ac7178b5902bd6e82743b4eab5d567ec6431abebf4da093ffbd0ff'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '67a3aa79643837965902118927a37cecd098a83696d7e1b58e2040ce82b823df'
            '1579b3221638ab012782d898c26014024ccae02363b7be674c3192e1b8031608'
            '6e0dcac677bf2e47df6a56b30c153e8bbd712fab7d4f7c05fc27c83bf60afbd9'
            'c618470c7cc8e42fd8b582980d94a132efad8a3533093703cbfc10169f036f70'
            '0bcfe168964338ec9c6e781479f2f8d06aa44f2262d6405ff8fa42983be89630'
            '68e3a5b47c6d175cc95b98b069a15205f027cab83af9e075818d38610feb6213'
            '7b6729423fba99e45c022c1d5638554c0e6f19ff5ef79c466861a9418062ce4c')
validpgpkeys=('2B90598A745E992F315E22C58AB132963A06537A')

prepare() {
  cd ${_pkgdir}

  cp ${srcdir}/mozconfig mozconfig
  
  # Disable sponsored tiles
  patch -Np1 -i ${srcdir}/firefox-${_basever}-disable-sponsored-tiles.patch
  # Disable Loop (Firefox Hello)
  patch -Np1 -i ${srcdir}/firefox-${_basever}-disable-loop.patch
  # Disable geo IP lookup on first run
  patch -Np1 -i ${srcdir}/firefox-${_basever}-disable-location.services.mozilla.com.patch
  # Set some sensible defaults
  patch -Np1 -i ${srcdir}/firefox-${_basever}-prefs.patch
  # Fix build with Fontconfig 2.6
  sed -i '/^ftcache.h/a ftfntfmt.h' config/system-headers
  # Fix tab loading icon not working with libpng 1.6
  cp ${srcdir}/firefox-fixed-loading-icon.png browser/themes/linux/tabbrowser/loading.png
  # Install in /usr/lib/firefox without version number
  patch -Np1 -i ${srcdir}/firefox-install-dir.patch
}

build() {
  cd ${_pkgdir}
  
  # Fix configure: error: Your toolchain does not support C++0x/C++11 mode properly. Please upgrade your toolchain
  unset CPPFLAGS
  
  make -f client.mk
}

package() {
  cd ${_pkgdir}
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 ${srcdir}/firefox.desktop "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"
}
