# Maintainer: Georg Graßnick <dev.grassnick at mailbox dot org>

pkgname=ymuse
pkgver=0.21
pkgrel=1
pkgdesc="Easy, functional, and snappy client for Music Player Daemon"
arch=("x86_64" "aarch64")
url="https://yktoo.com/en/software/ymuse/"
license=("Apache")
depends=("gtk3")
optdepends=("mpd")
makedepends=("go")
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/yktoo/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
	"11227b20c28d3c5118e8d977e936ea822e15ec71981297f825b145969009bf5ab0a754a5806b0bfdb4913392a557a434becda6c359a2f975c055764bf1095c08"
)

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "${pkgname}-${pkgver}"
	go generate
	go build -ldflags "-s -w -X main.version=${pkgver} -X main.commit=$(git rev-parse HEAD) -X main.date=$(date --iso-8601=seconds)"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 ymuse "${pkgdir}/usr/bin/ymuse"

	for file in $(find resources/icons -type f); do
		install -Dm644  ${file} "${pkgdir}"/usr/share/icons/${file#resources/icons}
	done

	for file in $(find resources/i18n -type f -name *.mo); do
		install -Dm644  ${file} "${pkgdir}"/usr/share/locale/${file#resources/i18n/generated}
	done

	install -Dm644 resources/com.yktoo.ymuse.desktop -t "${pkgdir}"/usr/share/applications/
}
