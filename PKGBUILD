# Maintainer: markusressel <mail+archlinuxaur@markusressel.de>
pkgname=zfs-file-history-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Terminal UI for inspecting and restoring file history on ZFS snapshots."
arch=('x86_64')
url="https://github.com/markusressel/zfs-file-history"
license=('AGPL3')
depends=('glibc')
makedepends=('go' 'git')
provides=("zfs-file-history")
conflicts=("zfs-file-history")
source=('git+https://github.com/markusressel/zfs-file-history')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	go mod tidy
	mkdir -p bin/
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o bin/zfs-file-history main.go
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dt ${pkgdir}/usr/bin -m755 bin/zfs-file-history
	install -Dt ${pkgdir}/usr/share/${pkgname%-git} -m644 zfs-file-history.yaml
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
