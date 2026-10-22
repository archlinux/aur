# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

# shellcheck disable=SC2154

pkgname=lazycut
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal-based video trimming TUI"
arch=('x86_64')
url="https://github.com/ozemin/lazycut"
license=('MIT')

depends=('chafa' 'ffmpeg')
makedepends=('go>=1.26')

source=("lazycut-${pkgver}.tar.gz::https://github.com/ozemin/lazycut/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('5b6e2d6dc7f5020550dd6a119c7a6b950ce2f145dd4f477d019827f7cfdbc8504b687113fb92b4022faa3f7a5e400dde50f90d448b9c791c307d0c12bd75770b')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit
	go mod download
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit
	CGO_ENABLED=0 go build -mod=readonly -trimpath -ldflags="-s -w -X main.version=${pkgver}" -o lazycut .
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit
	install -Dm755 lazycut "${pkgdir}/usr/bin/lazycut"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
