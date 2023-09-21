# Maintainer: Kimiblock Moe

pkgname=sliding-sync-git
arch=('x86_64')
backup=("etc/default/sliding-sync")
pkgver=r1615.e75a462
pkgrel=1
pkgdesc="Run a sliding sync proxy. An implementation of MSC3575."
url=https://github.com/matrix-org/sliding-sync
license=("Apache")
depends=("matrix-synapse")
source=("git+https://github.com/matrix-org/sliding-sync.git" "sliding-sync-git.service")
makedepends=("go")
sha256sums=("SKIP" "ddf706360287e2f6c5e9646c8e3c4e49fa5021dd4fc2c85701d0a8aee863c26c")
provides=("sliding-sync")
install="sliding-sync-git.install"

function pkgver(){
	cd sliding-sync
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build(){
	cd "${srcdir}/sliding-sync"
	go build ./cmd/syncv3
}

function package(){
	cd sliding-sync
	install -Dm755 "${srcdir}/sliding-sync/syncv3" "${pkgdir}/usr/bin/syncv3"
	install -Dm644 "${srcdir}/sliding-sync-git.service" "${pkgdir}/usr/lib/systemd/system/sliding-sync.service"
	mkdir -p "${pkgdir}/etc/default"
	touch "${pkgdir}/etc/default/sliding-sync"
}
