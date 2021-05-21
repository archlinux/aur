# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=swarm-bee-git
pkgver=v0.6.1.r149.g65c1774d
pkgrel=1
pkgdesc='Swarm client implemented in Go, basic building block for Swarm Network'
arch=('x86_64')
url='https://swarm.ethereum.org/'
license=('BSD-3-Clause')
depends=('bash')
optdepends=('bee-clef: external signer for bee')
makedepends=('git' 'go')
backup=('etc/bee/bee.yaml')
source=("git+https://github.com/ethersphere/bee.git")
sha512sums=('SKIP')
install='bee.install'

pkgver() {
    cd bee
    version=$(sed -nr 's/\s*version = "(.+)".*/\1/p' version.go)
    git describe --long | sed -e "s/^v[^-]*/v$version/" -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

build() {
    cd bee
    export LDFLAGS='-s -w'
    # -s Omit the symbol table and debug information.
    # -w Omit the DWARF symbol table.

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        -o dist/bee \
        ./cmd/bee
}

check() {
    cd bee
    go test -race -failfast -v ./...
}

package() {
    cd bee
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/bee"
    install -Dm644 packaging/default "$pkgdir/etc/default/bee"
    install -Dm644 packaging/bee.yaml -t "$pkgdir/etc/bee"
    install -Dm644 packaging/bee.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm755 dist/bee packaging/bee-get-addr -t "$pkgdir/usr/bin"
}
