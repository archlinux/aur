# Maintainer: Kimiblock Moe

pkgname=sliding-sync-git
arch=('x86_64')
backup=("etc/default/sliding-sync")
pkgver=r1783.bbb886e
pkgrel=1
pkgdesc="Run a sliding sync proxy. An implementation of MSC3575."
url=https://github.com/matrix-org/sliding-sync
license=("Apache")
depends=("postgresql>13")
source=("git+https://github.com/matrix-org/sliding-sync.git" "sliding-sync-git.service")
makedepends=("go" "git")
sha256sums=('SKIP'
            '732a62fa9edd235022a8fc9ede32d7c4a0fb5235a9e49097f3a9df46cacca289')
provides=("sliding-sync")
install="sliding-sync-git.install"

function pkgver(){
	cd sliding-sync
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
