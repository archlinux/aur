# Maintainer: Mineralwater Xu <mineralwater@m1neralwater.com>
pkgname=mkvtool
pkgver=3.3.5
pkgrel=1
pkgdesc="Automatic fonts subset tool."
arch=('x86_64')
url="https://github.com/KurenaiRyu/MkvAutoSubset"
license=('GPL3')
depends=('python-fonttools' 'mkvtoolnix-cli')
makedepends=('python' 'go')
source=("https://github.com/KurenaiRyu/MkvAutoSubset/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0f10c12253c2ef9720ee05987fdbd21fb113bb0ceac0e37eb424637bb0e339e4')

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
