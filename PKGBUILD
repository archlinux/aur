# Maintainer: Integral <integral@member.fsf.org>

pkgname=btrfs-rec-git
_pkgname=${pkgname%-git}
_srcname=btrfs-progs-ng
pkgver=0.1.0.r23.gc56295c
pkgrel=1
pkgdesc="Recover data from a broken Btrfs filesystem"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://git.lukeshu.com/${_srcname}"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	git -C "${_srcname}" describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_srcname}/"
	export GOPATH="${srcdir}"
	go mod download -modcacherw -x
}

build() {
	cd "${_srcname}/"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build/ ./cmd/...
}

check() {
	cd "${_srcname}/"
	go test ./...
}

package() {
	cd "${_srcname}/"
	install -Dm755 build/btrfs-rec -t "${pkgdir}/usr/bin/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
