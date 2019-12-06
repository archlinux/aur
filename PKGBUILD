# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=spin-git
pkgver=6.5.2.r0.g4883fbb
pkgrel=1
pkgdesc='Explicit state logic model checking tool'
depends=('glibc')
optdepends=('tcl: ispin graphical interface'
            'swarm: improved performance on large verification problems'
            'modex: extract verification models from implementation C code'
            'ispin: GUI for Spin')
arch=('i686' 'x86_64')
url='https://spinroot.com/'
license=('custom:BSD3')
provides=('spin')
conflicts=('spin')
source=("$pkgname"::'git+https://github.com/nimble-code/Spin.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/version-//;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make -C Src
    gzip -9c Man/spin.1 > Man/spin.1.gz
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm 755 Src/spin "${pkgdir}/usr/bin/spin"
    install -Dm 644 Src/LICENSE "${pkgdir}/usr/share/licenses/spin/LICENSE"
    install -Dm 644 Man/spin.1.gz "${pkgdir}/usr/share/man/man1/spin.1.gz"
    install -d "${pkgdir}/usr/share/doc/spin/examples"
    find Examples/ -type f -exec chmod 644 {} +
    cp -a Examples/* "${pkgdir}/usr/share/doc/spin/examples/"
}
