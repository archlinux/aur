# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: w0rty <mawo97 at gmail.com>

pkgname=wgcf-git
pkgver=2.2.11.r0.ecf3b62
pkgrel=1
pkgdesc='Generate WireGuard profile from Cloudflare Warp account'
arch=('x86_64' 'aarch64')
url='https://github.com/ViRb3/wgcf'
license=('MIT')
makedepends=('go' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://github.com/ViRb3/wgcf.git')
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}/"
	git describe --long --tags | sed -E '
		s/([^-]*-)g/r\1/
		s/-/./g
		s/^v//
	'
}

build() {
	cd "${pkgname%-git}/"
	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o builddir/wgcf
}

package() {
	cd "${pkgname%-git}/"
	install -Dm755 builddir/wgcf "$pkgdir/usr/bin/wgcf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
