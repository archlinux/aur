# Maintainer: chadsr <git at ross dot ch>

pkgname=hyprls
pkgver=0.14.0 # renovate: datasource=github-releases depName=hyprland-community/hyprls
pkgrel=2
pkgdesc="A LSP server for Hyprland config files"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprland-community/hyprls"
license=('MIT')
optdepends=('hyprland')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d159b0caa649b1599061f9e6d155ca43bd2303a25a9d59d887849e9c67fd84123c2a6a94910055ea97cdee6293925e8cf7fe07b88e880fd62f416d75c8babafa')

prepare() {
	cd "${pkgname}-${pkgver}"
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOPATH="${srcdir}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-linkmode=external -X main.HyprlsVersion=${pkgver}" -o hyprls cmd/hyprls/main.go
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"/README.md
}
