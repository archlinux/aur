# Maintainer: Maarten de Boer <info@maartendeboer.net>

pkgname=('qodana-cli')
pkgver=2023.1.4
pkgrel=1
pkgdesc="Simple cross-platform command-line tool to run Qodana linters anywhere with minimum effort required."
arch=('x86_64' 'aarch64')
url="https://github.com/JetBrains/qodana-cli"
license=('Apache')
depends=('docker')
makedepends=('go>=1.19')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('932c965163c177d9803e46d9e691afc493bc8ccdd61b9e06139a590d9f028403')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}/go"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go mod tidy
    go build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm0755 qodana-cli "${pkgdir}/usr/bin/qodana"

	install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm0644 THIRDPARTY.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
