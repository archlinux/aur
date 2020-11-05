# Contributor: Robin Eklind <rnd0x00@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=intelxed-git
pkgver=11.2.0.r187.g7573e4b
pkgrel=1
pkgdesc="x86 encoder decoder"
arch=('x86_64')
url="https://intelxed.github.io"
license=('Apache')
depends=()
makedepends=('git' 'mbuild' 'doxygen')
provides=('intelxed')
conflicts=('intelxed')
source=("$pkgname"::'git+https://github.com/intelxed/xed.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    ./mfile.py doc examples install --shared ${MAKEFLAGS}
}

package() {
    cd "${srcdir}/${pkgname}"/kits/xed-install-base-*-lin-x86-64

    # remove unneeded files
    rm -rf extlib/ mbuild/ misc/

    # install binaries, headers, and libraries
    install -Dm 755 -t "${pkgdir}/usr/bin" bin/*
    install -dm 755 "${pkgdir}/usr/include"
    cp -r include/* "${pkgdir}/usr/include/"
    install -Dm 644 -t "${pkgdir}/usr/lib" lib/*

    # install doc and examples
    install -dm 755 "${pkgdir}/usr/share/"{doc,$pkgname}
    cp -r doc/ref-manual "${pkgdir}/usr/share/doc/$pkgname"
    cp -r examples "${pkgdir}/usr/share/$pkgname/examples"
}

# vim: set sw=4 ts=4 et:
