# Maintainer: Jat <chat@jat.email>

pkgname=pulseaudio-module-xrdp
pkgver=0.7
pkgrel=1
pkgdesc="PulseAudio modules for xrdp"
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/pulseaudio-module-xrdp"
license=('LGPL')
depends=('pulseaudio' 'xrdp')
makedepends=('meson' 'check' 'doxygen' 'perl-xml-parser')
install="${pkgname}.install"

_pulseaudio_ver=$(pulseaudio --version | awk '{print $NF}')
: "${_pulseaudio_ver:=16.1}"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "https://freedesktop.org/software/pulseaudio/releases/pulseaudio-${_pulseaudio_ver}.tar.xz")
sha256sums=('be101538ebe891bd4ae9d533559b99cf07abf0bbce399f50f2d248f35c160a9d'
            '8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72863251751e504ae4')

prepare() {
    cd "${srcdir}/pulseaudio-${_pulseaudio_ver}"

    meson build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    sed -i '\#-I $(PULSE_DIR)/src#a -I $(PULSE_DIR)/build \\' src/Makefile.am

    ./bootstrap
    ./configure "PULSE_DIR=${srcdir}/pulseaudio-${_pulseaudio_ver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="$pkgdir" install
}
