# Maintainer: markusressel <mail+archlinuxaur@markusressel.de>
#
# This file is maintained in https://github.com/markusressel/zfs-file-history/tree/main/packaging/aur/zfs-file-history
# and published to the AUR with packaging/aur/publish.sh (see RELEASING.md). Don't edit it on the AUR directly.
pkgname=zfs-file-history
pkgver=2.10.0
pkgrel=1
pkgdesc="Terminal UI for inspecting and restoring file history on ZFS snapshots."
arch=('x86_64')
url="https://github.com/markusressel/zfs-file-history"
license=('AGPL3')
# zfs-utils: libzfs (linked) and the zfs and zpool commands
depends=('glibc' 'zfs-utils')
makedepends=('go' 'just')
optdepends=('diffutils: diffs of file versions'
            'smartmontools: disk health of the pools'
            'sudo: the permission setup and the operations that need root'
            'wl-clipboard: copying to the clipboard on Wayland'
            'xclip: copying to the clipboard on X11')
provides=("zfs-file-history")
conflicts=("zfs-file-history-git")
install=zfs-file-history.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/markusressel/zfs-file-history/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('41ea57d0192120fe0effd3f86608f701577c0fdb88faa550f2fe4da40894fac5')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export GOFLAGS="-mod=readonly -modcacherw"
	go mod download
	mkdir -p bin/
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	# the release tarball contains no .git directory, so version and commit have to be passed explicitly
	just VERSION="${pkgver}" GIT_REV="${pkgver}" build
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./bin/zfs-file-history version
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dt "${pkgdir}/usr/bin" -m755 bin/zfs-file-history
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m644 zfs-file-history.yaml
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
