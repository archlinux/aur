# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=clickrouter-git
pkgver=v2.0.1.r943.g6fa978f01
pkgrel=2
pkgdesc='Fast modular packet processing and analysis'
depends=('glibc' 'libpcap')
optdepends=()
makedepends=('git')
arch=('x86_64')
url='https://github.com/kohler/click'
license=('custom')
provides=('clickrouter')
conflicts=('clickrouter' 'click' 'click-git')
replaces=('clickrouter')
source=("$pkgname"::'git+https://github.com/kohler/click.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    FILES=$(grep -r 'gzcat' ./* | grep -v '^Binary' | cut -d ':' -f 1 | uniq)
    sed -i -e 's/\<gzcat\>/zcat/g' ${FILES}
}

build() {
    cd "$srcdir/$pkgname"
    ./configure --prefix=/usr --sbindir=/usr/bin --enable-all-elements
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="${pkgdir}" install
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/clickrouter/LICENSE"
}

# vim: set sw=4 ts=4 et:
