# Maintainer: Mineralwater Xu <mineralwater@m1neralwater.com>

pkgname=correlation-git
pkgver=r146.f0965a0
pkgrel=1
pkgdesc="Program calculates the main correlation functions of a material"
arch=('x86_64')
url="https://github.com/Isurwars/Correlation"
license=('MIT')
depends=('automake' 'autoconf' 'libtool')
makedepends=('gcc')
source=("${pkgname}::git+https://github.com/Isurwars/Correlation.git#branch=main"
        "https://gist.githubusercontent.com/MineralwaterXu/114c0f8e1f25d4a36cfec83a3b66075e/raw/9284a4e24cda1633546b2aef620d9642ff4e9bbc/0001-Fix-function-strerror-declaration.patch")
sha256sums=('SKIP'
            'SKIP')

prepare() {
        cd "${pkgname}"
        patch -p1 -i ../0001-Fix-function-strerror-declaration.patch
}
pkgver() {
        cd "${pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	aclocal
	autoconf
	automake --add-missing
	chmod +x configure
	chmod +x install-sh
	./configure
	make
}

package() {
	cd "${pkgname}"
	install -Dm 755 "bin/correlation" -t "${pkgdir}/usr/bin"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
#	install -Dm 644 "correlation.1" -t "${pkgdir}/usr/share/man/man1"
}
