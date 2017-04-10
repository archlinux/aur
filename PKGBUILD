# firefox-esr-privacy
pkgname=firefox-esr-privacy
_basever=52
pkgver=52.0.2
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('autoconf2.13' 'gtk2' 'libxt' 'startup-notification' 'dbus-glib' 'alsa-lib' 'desktop-file-utils'
         'hicolor-icon-theme' 'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'xorg-server' 'inetutils')
install=firefox.install
options=('!emptydirs')
conflicts=('firefox')
provides=('firefox')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz
        firefox-install-dir.patch
        firefox-${_basever}-disable-location.services.mozilla.com.patch
        firefox-${_basever}-disable-pocket-leftovers.patch
        firefox-${_basever}-disable-sponsored-tiles.patch
        firefox-${_basever}-prefs.patch
        firefox-${_basever}-disable-telemetry.patch
        firefox-${_basever}-disable-data-sharing-infobar.patch
        firefox-${_basever}-disable-reader.patch
        firefox.desktop
        firefox-fixed-loading-icon.png
        mozconfig)
sha256sums=('05ed22738b3ac49253fe482a316ca3b4163885b03b22404ff9177b0fba950522'
            'b7a9eb7f4c9f5c297978459338d389e5bc790e5c5d89805668f7d24ea1d485b2'
            '8d9afa1f940a9dac689ead40a57990d1491f34a1787b2222f8f5b5e485d54103'
            'd6760634e4926ce5ad0df501d06139a5e693d7058e671a195c9e0b54197c1d96'
            'a72c657784dc5804509456d9ba39ccc8d5e5998c847f49abbcfeb2a547290815'
            'c51a948262319925d17ef80d1bbbe581144685d2ef848cd708653c3f2d15b5cf'
            'b661dcaa00323119e58a3b9d5b6e732291a107fbd29d242fb1ddcd36ea50106e'
            '52a94f48e562f98ba0b22b43b1684f6a813872b9c310d6f7567fe91aaab4944b'
            '7f171b7d69866ac6d8945ab0867b2646964362c791875c6428b4c2c8e3f3fb5b'
            '0bcfe168964338ec9c6e781479f2f8d06aa44f2262d6405ff8fa42983be89630'
            '68e3a5b47c6d175cc95b98b069a15205f027cab83af9e075818d38610feb6213'
            '0ab9c4d33e88ab6fa8fdeab7e80e39876115413af1b344f67cf766614359069e')
validpgpkeys=('2B90598A745E992F315E22C58AB132963A06537A')

prepare() {
  cd firefox-${pkgver}esr

  cp "$srcdir"/mozconfig mozconfig
  
  # Disable sponsored tiles
  # This patch is not needed anymore, it also breaks the newtab page (nothing on it) and restore closed tabs does not work anymore
  #  patch -Np1 -i "$srcdir"/firefox-${_basever}-disable-sponsored-tiles.patch

  # Disable Pocket integration leftovers
  patch -Np1 -i "$srcdir"/firefox-${_basever}-disable-pocket-leftovers.patch
  # Remove pocket source directory
  rm -fr browser/extensions/pocket

  # Disable geo IP lookup on first run
  patch -Np1 -i "$srcdir"/firefox-${_basever}-disable-location.services.mozilla.com.patch
  
  # Set some sensible defaults
  patch -Np1 -i "$srcdir"/firefox-${_basever}-prefs.patch
  
  # Disable telemetry options
  patch -Np1 -i "$srcdir"/firefox-${_basever}-disable-telemetry.patch
  
  # Disable infobar "Firefox automatically sends some data to Mozilla..."
  patch -Np1 -i "$srcdir"/firefox-${_basever}-disable-data-sharing-infobar.patch
  
  # Disable reader view
  patch -Np1 -i "$srcdir"/firefox-${_basever}-disable-reader.patch
  
  # Fix build with Fontconfig 2.6
  sed -i '/^ftcache.h/a ftfntfmt.h' config/system-headers
  
  # Fix tab loading icon not working with libpng 1.6
  cp "$srcdir"/firefox-fixed-loading-icon.png browser/themes/linux/tabbrowser/loading.png
  
  # Install in /usr/lib/firefox without version number
  patch -Np1 -i "$srcdir"/firefox-install-dir.patch
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

  install -Dm644 "$srcdir"/firefox.desktop "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"
}
