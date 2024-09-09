# Maintainer: Kimiblock Moe
# Contributor: Luca Weiss <luca@z3ntu.xyz>
# Contributor: user20159 <https://aur.archlinux.org/account/user20159>
pkgname=matrix-sliding-sync
arch=('x86_64' 'aarch64')
backup=("etc/default/sliding-sync")
pkgver=0.99.19
pkgrel=1
pkgdesc="Run a sliding sync proxy. An implementation of MSC3575."
url=https://github.com/matrix-org/sliding-sync
license=("Apache")
depends=("postgresql>13")
source=("git+https://github.com/matrix-org/sliding-sync.git#tag=v${pkgver}" "sliding-sync-git.service")
makedepends=("go" "git")
sha256sums=('556b7cdb2aa29f955c5c01a1e4a8a7186a943ee0806e5f24780febfa73c92cfd'
            '7f456f0c130fc46e79964ae8587d8fb4eb74ce78106523978aeb60f024d291de')
provides=("sliding-sync" "matrix-sliding-sync")
conflicts=("sliding-sync" "matrix-sliding-sync")
install="syncv3.install"

function build(){
	cd "${srcdir}/sliding-sync"
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" ./cmd/syncv3
}

function package(){
	cd sliding-sync
	install -Dm755 "${srcdir}/sliding-sync/syncv3" "${pkgdir}/usr/bin/syncv3"
	install -Dm644 "${srcdir}/sliding-sync-git.service" "${pkgdir}/usr/lib/systemd/system/sliding-sync.service"
	mkdir -p "${pkgdir}/etc/default"
	touch "${pkgdir}/etc/default/sliding-sync"
	chmod 0600 -R "${pkgdir}/etc/default/sliding-sync"
	mkdir -p "${pkgdir}/usr/lib/tmpfiles.d"
	echo 'f	/etc/default/sliding-sync	0600	root	root' >"${pkgdir}/usr/lib/tmpfiles.d/sliding-sync.conf"
}

