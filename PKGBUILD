# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Vincent Kobel (v@kobl.one)

pkgname='gvisor-git'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20230417.0
pkgrel=1
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
license=('Apache')
makedepends=('git' 'go')
optdepends=('docker: for Docker runtime support')
provides=(
	"${pkgname%-git}"
)
conflicts=(
	"${pkgname%-git}"
)
source=("git+https://github.com/google/${pkgname%-git}#branch=go")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/release-//g;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GO111MODULE=on
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	CGO_ENABLED=0 go build -v -o "bin/$_pkgbin" -ldflags "-X main.version=${pkgver}" gvisor.dev/gvisor/runsc
	go build -v -o "bin/$_pkgshim" gvisor.dev/gvisor/shim
}

package() {
	cd "${pkgname%-git}"
	install -Dm 755 "bin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "bin/$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
