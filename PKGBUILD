# firefox-esr-privacy
pkgname=firefox-esr-privacy
_basever=60
pkgver=60.1.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('autoconf2.13' 'gtk2' 'libxt' 'startup-notification' 'dbus-glib' 'alsa-lib' 'desktop-file-utils'
         'hicolor-icon-theme' 'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'apulse')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'xorg-server' 'inetutils' 'rust' 'patchelf' 'pulseaudio')
install=firefox.install
options=('!emptydirs')
conflicts=('firefox')
provides=('firefox')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz
        firefox-${_basever}-disable-data-sharing-infobar.patch
        firefox-${_basever}-disable-location.services.mozilla.com.patch
        firefox-${_basever}-disable-pocket-leftovers.patch
        firefox-${_basever}-disable-newtab-page-remote.patch
        firefox-${_basever}-disable-reader.patch
        firefox-${_basever}-disable-telemetry.patch
        firefox-${_basever}-prefs.patch
        firefox-${_basever}-disable-first-run-privacy-policy.patch
        firefox.desktop
        mozconfig)
sha256sums=('a4e7bb80e7ebab19769b2b8940966349136a99aabd497034662cffa54ea30e40'
            'd8377a0f225df1e334bf82845ba082f499af561311c7033b61084b24c720924f'
            '05da47c8e2b5271f1979b7f5c15941b50645e68d31b556fcc8ab381699c979f5'
            '22f8a6e42617bc733e0627513dd58dbaa4a924a725db00ad7b2b666425d7edd2'
            'f5f58edd11e004cbbd3504bcc531b6259ecd4a67b45e0656dda70f08ef290d7f'
            'ce583b1e164f62d4869e97e46c724ea946f605733f0f2b1919162ca58b97883d'
            'adc25bf1a8712ce1a3aa91afa7ddbb8df805671f462089f67ae16adc5c3390a5'
            '57ea308737c2d82fff6b8ad55ceeed445018c6fd482efd14b2026312e8485b6c'
            '3c8008f7d0d0a2fcafcdc24f9a838bc72306d452f1dce233a65fcf0eba3d4e0f'
            '0bcfe168964338ec9c6e781479f2f8d06aa44f2262d6405ff8fa42983be89630'
            'c3d0a8c25d1122b20151fe085a8d5bc79234ae3dc05a606855eb68cfb7817d2c')
validpgpkeys=('2B90598A745E992F315E22C58AB132963A06537A')

prepare() {
  #cd firefox-${pkgver}esr
  cd firefox-${pkgver}

  cp "$srcdir"/mozconfig mozconfig
 
  # Disable Pocket integration leftovers
  patch -Np1 -i "$srcdir"/firefox-${_basever}-disable-pocket-leftovers.patch
  # Remove pocket source directory
  rm -fr browser/extensions/pocket
  # Disable pocket on the new tab page and disable remote fetching of top sites
  patch -Np1 -i "$srcdir"/firefox-${_basever}-disable-newtab-page-remote.patch

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

  # Disable privacy policy new tab on first run
  patch -Np1 -i "$srcdir"/firefox-${_basever}-disable-first-run-privacy-policy.patch
}

build() {
  #cd firefox-${pkgver}esr
  cd firefox-${pkgver}

  ./mach build
}

package() {
  #cd firefox-${pkgver}esr
  cd firefox-${pkgver}
  DESTDIR="$pkgdir" ./mach install

  install -Dm644 "$srcdir"/firefox.desktop "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"

  # Firefox no longer support Alsa, it crashes frequently with Alsa on FF>=60
  # Use apulse (PulseAudio emulation for Alsa) but don't require a user to run "apulse firefox" everytime by changing the rpath
  patchelf --set-rpath /usr/lib/apulse "$pkgdir/usr/lib/firefox/libxul.so"
}
