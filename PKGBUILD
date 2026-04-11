# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='hawser-git'
pkgver=v0.2.39.r0.g79f6dd9
pkgrel=1
pkgdesc="The agent for Dockhand"
conflicts=('hawser-git')
arch=('x86_64' 'aarch64')
url='https://dockhand.pro/'
license=('MIT')
source=("git+https://github.com/Finsys/hawser.git")
makedepends=('go' 'git')
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p "${srcdir}/go"
	export GOPATH="${srcdir}/go"

	cd "${pkgname%-git}"
	go mod download -modcacherw
}

build() {
	export GOPATH="${srcdir}/go"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	cd "${pkgname%-git}"

	go build -o hawser -buildmode=pie -trimpath -ldflags="-linkmode=external -X=main.commit=$(git rev-parse --short HEAD)"  -mod=readonly -modcacherw ./cmd/hawser
}

package() {
	cd "${pkgname%-git}"

	install -Dm755 hawser "${pkgdir}/usr/bin/hawser"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mkdir -p "${pkgdir}/usr/lib/systemd/system"
	install -m644 scripts/hawser.service "${pkgdir}/usr/lib/systemd/system/hawser.service"
	sed -i "s#/local##" "${pkgdir}/usr/lib/systemd/system/hawser.service"
}
