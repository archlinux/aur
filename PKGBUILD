# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=rtlsdr-scanner-git
pkgver=r911.275c7fe
pkgrel=1
pkgdesc="Python frequency scanning GUI for the OsmoSDR rtl-sdr library"
arch=('i686' 'x86_64')
url="http://eartoearoak.com/software/rtlsdr-scanner"
license=('GPL3')
depends=('rtl-sdr' 'wxpython' 'python2-pyrtlsdr-git' 'python2-matplotlib' 'python2-numpy' 'python2-pillow' 'python2-pyserial')
makedepends=('git')
optdepends=('python2-visvis: better and faster real-time plotting')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('rtlsdr-scanner::git+https://github.com/EarToEarOak/RTLSDR-Scanner.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i 's|#! /usr/bin/env python|#!/usr/bin/env python2|g' src/rtlsdr_scan.py
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python2 -m compileall src
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -d "${pkgdir}/opt/rtlsdr-scanner"
    cp -dpr --no-preserve=ownership src "${pkgdir}/opt/rtlsdr-scanner/src"
    cp -dpr --no-preserve=ownership res "${pkgdir}/opt/rtlsdr-scanner/res"
    install -Dm 0644 rtlsdr_scan.ico "${pkgdir}/opt/rtlsdr-scanner/rtlsdr_scan.ico"
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/rtlsdr-scanner/src/rtlsdr_scan.py "${pkgdir}/usr/bin/rtlsdr_scan"
}
