# Maintainer: kballen <ken@kballentine.net>

pkgname=pulseaudio-module-xrdp
pkgver=0.6
pkgrel=3
pkgdesc="PulseAudio modules for xrdp"
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/pulseaudio-module-xrdp"
license=('LGPL')
depends=('pulseaudio' 'xrdp')
makedepends=('meson' 'check' 'doxygen' 'perl-xml-parser')
install="${pkgname}.install"

_pulseaudio_ver=$(pulseaudio --version | awk '{print $NF}')
: "${_pulseaudio_ver:=16.1}"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neutrinolabs/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://freedesktop.org/software/pulseaudio/releases/pulseaudio-${_pulseaudio_ver}.tar.xz")
sha256sums=('ed529ec30e8817caab3be9ff21a3962fde14b5acb34b1562797d1747c0a22b6f'
            $(curl -fs "https://freedesktop.org/software/pulseaudio/releases/pulseaudio-${_pulseaudio_ver}.tar.xz.sha256sum" | awk '{print $1}'))

prepare() {
    cd "$srcdir/pulseaudio-${_pulseaudio_ver}"

    meson build
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    sed -i '\#-I $(PULSE_DIR)/src#a -I $(PULSE_DIR)/build \\' src/Makefile.am

    ./bootstrap
    ./configure "PULSE_DIR=$srcdir/pulseaudio-${_pulseaudio_ver}"
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    make DESTDIR="$pkgdir" install
}
