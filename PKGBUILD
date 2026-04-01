# Maintainer: Castor <whoisyoges@castorisdead.xyz>
pkgname=managedssh
pkgver=1.1.3
pkgrel=1
pkgdesc="A terminal-first SSH connection manager built in Go, featuring a simple text-based UI and secure encrypted credential storage for managing and connecting to hosts."
arch=('x86_64' 'aarch64')
url='https://github.com/mylovelytools/managedssh'
license=('AGPL-3.0-or-later')
depends=('openssh')
makedepends=('go>=1.26')

# Pull tarball from GitHub (man page is inside)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mylovelytools/managedssh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5007dee43b9f9570c6365ed5cd82b1c5e104a6dafb7949a86fd62eb7ab688048')

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

