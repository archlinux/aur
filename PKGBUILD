# Maintainer: Maarten de Boer <maarten@cloudstek.nl>

pkgname=('qodana-cli')
pkgver=1.1.1
pkgrel=1
pkgdesc="Simple cross-platform command-line tool to run Qodana linters anywhere with minimum effort required."
arch=('x86_64' 'aarch64')
url="https://github.com/JetBrains/qodana-cli"
license=('Apache')
depends=('docker')
makedepends=('go>=1.16')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JetBrains/qodana-cli/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('f614329d6d76332bb76d94f4885371505b954113c755edcd8566d7d24d024376')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
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
