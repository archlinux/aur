# Maintainer: Castor <whoisyoges@castorisdead.xyz>
pkgname=managedssh
pkgver=1.2.0
pkgrel=1
pkgdesc="A terminal-first SSH connection manager built in Go, featuring a simple text-based UI and secure encrypted credential storage for managing and connecting to hosts."
arch=('x86_64' 'aarch64')
url='https://github.com/mylovelytools/managedssh'
license=('AGPL-3.0-or-later')
depends=('openssh')
makedepends=('go>=1.26')

# Pull tarball from GitHub (man page is inside)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mylovelytools/managedssh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('023d730c8a8d18a241823b50f4621b839fe7453475addb9ebb207104146cba6d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
    go build -o managedssh .
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Install binary
    install -Dm755 managedssh "${pkgdir}/usr/bin/managedssh"
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Install man page (from the extracted tarball)
    install -Dm644 "managedssh.1" "${pkgdir}/usr/share/man/man1/managedssh.1"
}

