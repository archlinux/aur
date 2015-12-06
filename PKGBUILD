# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=rtlsdr-airband-git
pkgver=r65.89d5dc1
pkgrel=1
pkgdesc="RTLSDR AM demodulator, support multiple channels per dongle"
arch=('i686' 'x86_64')
url="https://github.com/szpajder/RTLSDR-Airband"
license=('GPL3')
depends=('rtl-sdr' 'fftw' 'libvorbis' 'lame' 'libshout' 'libconfig')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('rtlsdr-airband::git+https://github.com/szpajder/RTLSDR-Airband.git#branch=unstable')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i 's|PREFIX = /usr/local|PREFIX =|g' makefile
}

build() {
    cd "$srcdir/${pkgname%-git}"
    PLATFORM=x86 make rtl_airband
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm 0755 rtl_airband ${pkgdir}/usr/bin/rtl_airband
    install -Dm 0600 rtl_airband.conf.example ${pkgdir}/etc/rtl_airband.conf
}
