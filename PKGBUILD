# Maintainer: markusressel <mail+archlinuxaur@markusressel.de>
#
# This file is maintained in https://github.com/markusressel/zfs-file-history/tree/main/packaging/aur/zfs-file-history-git
# and published to the AUR with packaging/aur/publish.sh (see RELEASING.md). Don't edit it on the AUR directly.
pkgname=zfs-file-history-git
pkgver=2.10.0.r0.g98a0650
pkgrel=1
pkgdesc="Terminal UI for inspecting and restoring file history on ZFS snapshots."
arch=('x86_64')
url="https://github.com/markusressel/zfs-file-history"
license=('AGPL3')
# zfs-utils: libzfs (linked) and the zfs and zpool commands
depends=('glibc' 'zfs-utils')
makedepends=('go' 'git' 'just')
optdepends=('diffutils: diffs of file versions'
            'smartmontools: disk health of the pools'
            'sudo: the permission setup and the operations that need root'
            'wl-clipboard: copying to the clipboard on Wayland'
            'xclip: copying to the clipboard on X11')
provides=("zfs-file-history")
conflicts=("zfs-file-history")
install=zfs-file-history.install
source=('git+https://github.com/markusressel/zfs-file-history')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	go mod download
	mkdir -p bin/
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	just VERSION="${pkgver}" build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dt ${pkgdir}/usr/bin -m755 bin/zfs-file-history
	install -Dt ${pkgdir}/usr/share/${pkgname%-git} -m644 zfs-file-history.yaml
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
