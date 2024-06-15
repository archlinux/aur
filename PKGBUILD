# Maintainer: Mineralwater Xu <mineralwater@m1neralwater.com>

pkgname=mkvtool
pkgver=5.0.0
pkgrel=1
pkgdesc="Automatic fonts subset tool."
arch=('x86_64')
url="https://github.com/MkvAutoSubset/MkvAutoSubset"
license=('GPL3')
depends=('python-fonttools' 'mkvtoolnix-cli' 'ass2bdnxml' 'ffmpeg' 'ripgrep')
makedepends=('python' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MkvAutoSubset/MkvAutoSubset/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b36d997c36ad2be8af5eeee2fe68d1f28a54aa862c3eea8884f4732ff1f0a0da')

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
	install -Dm 644 "mkvtool/mkvtool.1" -t "${pkgdir}/usr/share/man/man1"
}
