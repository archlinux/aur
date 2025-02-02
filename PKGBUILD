# Contributor: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx-portaudio-git
pkgver=2.17.6.r8.gdade54ec
pkgrel=1
pkgdesc="SDR receiver for Funcube Dongle, RTL-SDR, USRP and OsmoSDR devices (portaudio)"
arch=('x86_64')
url="https://gqrx.dk/"
license=('GPL-3.0-or-later')
depends=('qt5-base' 'qt5-svg' 'boost-libs' 'fftw' 'libusb' 'gsl' 'portaudio' 'libuhd' 'gnuradio' 'gnuradio-osmosdr')
optdepends=('gr-osmosdr-git: support of OsmoSDR devices')
makedepends=('make' 'patch' 'boost' 'git' 'cmake')
provides=('gqrx' 'gqrx-portaudio')
conflicts=('gqrx')
source=("21-fcd.rules"
        "gqrx.png"
        "gqrx.desktop"
        "git+https://github.com/csete/gqrx.git")
md5sums=('2be3bf7cba02e90cbbb9d5f6cfdaf68b'
         'f7032a8883c89bd80e0d0fd36f861c59'
         '810f89195231c18f32af92522aade721'
         'SKIP')
sha256sums=('490fdc3e16c8d6ae38894896f622531e2bf617963165ce2430a3c132d91ba5e5'
            'abb0c2598830c9fe728d8cd0d2f187d10331f7cb607520ff3664afd67a3a279d'
            'c67ff791ff9e1380e207ea9af32a0273f738a6b19d3b11251a94b931d6c00434'
            'SKIP')

pkgver() {
  cd gqrx
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # this compiles with portaudio as backend (pulseaudio is the default)
  cmake -B build -S gqrx \
    -DLINUX_AUDIO_BACKEND:STRING=Portaudio \
    -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  install -D -m644 21-fcd.rules -t "$pkgdir/etc/udev/rules.d"
  install -D -m644 gqrx.desktop -t "$pkgdir/usr/share/applications"
  install -D -m644 gqrx.png -t "$pkgdir/usr/share/pixmaps"
  install -D -m755 build/src/gqrx -t "$pkgdir/usr/bin"
}
