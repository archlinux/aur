# Maintainer: Mineralwater Xu <mineralwater@m1neralwater.com>
pkgname=mkvautosubset
pkgver=3.1.9
pkgrel=1
pkgdesc="Automatic fonts subset tool."
arch=('x86_64')
url="https://github.com/KurenaiRyu/MkvAutoSubset"
license=('GPL3')
depends=('python-fonttools' 'mkvtoolnix-cli')
makedepends=('python' 'go')
source=("https://github.com/KurenaiRyu/MkvAutoSubset/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2042888e768c61ceb5a91b635694b8105da5c2e226457d28d841ad452e4790a6')

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
