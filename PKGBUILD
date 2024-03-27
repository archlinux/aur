# Maintainer: Michael Prager <archlinuxaur@michaelprager.de>
# Contributor: Ammann Max <maximilian.ammann@googlemail.com>
pkgname=golden-cheetah-git
pkgver=v3.6.r203.fd1eed4ed
pkgrel=1
pkgdesc="Performance Software for Cyclists, Runners, Triathletes and Coaches"
arch=('i686' 'x86_64')
url="https://www.goldencheetah.org/"
license=('GPL-2.0-or-later')
makedepends=(
  'bison'
  'flex'
  'gcc'
  'make'
  'qt5-tools'
  'sip4'
  'pkgconf'
  'git')
depends=(
  'qt5-base'
  'qt5-svg'
  'qt5-location'
  'qt5-declarative'
  'qt5-webchannel'
  'qt5-webengine'
  'qt5-sensors'
  'qt5-serialport'
  'qt5-multimedia'
  'qt5-script'
  'qt5-connectivity'
  'qt5-charts'
  'gsl')
optdepends=(
  'vlc: video playback in training mode'
  'srmio: SRM powercontrol V downloads via serial'
  'libftd2xx: Powertap downloads via USB'
  'libkml: export to Google Earth'
  'libical: diary window and CALDAV support (external calendar integration)'
  'libusb-compat: for using USB2 sticks in Train View'
  'libsamplerate'
  'r: R charts'
  'python: Python charts, scripts and data processors')
options=('staticlibs')
conflicts=('golden-cheetah-rc' 'golden-cheetah-dev' 'golden-cheetah')
provides=('golden-cheetah')
source=('golden-cheetah::git+https://github.com/GoldenCheetah/GoldenCheetah.git'
        'GoldenCheetah.desktop'
        'gcconfig.pri')
sha256sums=('SKIP'
            '3ec79d7671a54ce34d6be3b5c2dbd051f423a3fc1529398337631d742765d7ad'
            '7409dc95720bc309a082ef72bf2dab6cf458a7eaed901c9ead14ffc8f6d0f013')

pkgver() {
  cd "${srcdir}/golden-cheetah"
  printf "%s" "$(git describe --long --tags --exclude v3.5-RC2 | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/golden-cheetah/"
  cp qwt/qwtconfig.pri.in qwt/qwtconfig.pri
  cp "$srcdir/gcconfig.pri" src/gcconfig.pri
  lupdate-pro src/src.pro
  qmake-qt5 -recursive QMAKE_CXXFLAGS_WARN_ON+="-Wno-deprecated-declarations -Wno-unused-value" QMAKE_CFLAGS_WARN_ON+="-Wno-deprecated-declarations -Wno-unused-value"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "${srcdir}/golden-cheetah/src/GoldenCheetah" "$pkgdir/usr/bin/"
  #mkdir -p "$pkgdir/usr/lib/udev/rules.d/" # unused
  mkdir -p "$pkgdir/usr/share/applications/"
  cp "${srcdir}/GoldenCheetah.desktop" "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  cp "${srcdir}/golden-cheetah/src/Resources/images/gc.png" "$pkgdir/usr/share/pixmaps/"
}
