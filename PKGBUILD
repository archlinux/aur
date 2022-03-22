# Maintainer: Mineralwater Xu <mineralwater@m1neralwater.com>
pkgname=mkvtool
pkgver=3.3.1
pkgrel=1
pkgdesc="Automatic fonts subset tool."
arch=('x86_64')
url="https://github.com/KurenaiRyu/MkvAutoSubset"
license=('GPL3')
depends=('python-fonttools' 'mkvtoolnix-cli')
makedepends=('python' 'go')
source=("https://github.com/KurenaiRyu/MkvAutoSubset/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b2f96a5e551a27c46368aaafe1fe82aab073240d24d5516829c3565562976096')

prepare() {
	mv v${pkgver}.tar.gz MkvAutoSubset-${pkgver}

	cd "MkvAutoSubset-$pkgver/mkvtool"
	gzip mkvtool.1
}
build() {
	cd "MkvAutoSubset-$pkgver/mkvtool"
	go mod tidy
        go build \
            -trimpath \
            -buildmode=pie \
            -mod=readonly \
            -modcacherw \
            -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" 
}

package() {
	cd "MkvAutoSubset-$pkgver"
	install -Dm 755 "mkvtool/mkvtool" -t "${pkgdir}/usr/bin"
	install -Dm 644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
	install -Dm 644 "mkvtool/mkvtool.1.gz" -t "${pkgdir}/usr/share/man/man1"
}
