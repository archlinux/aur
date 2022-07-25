# Maintainer: MFW78 <mfw78@chasingseed.com>

pkgname=swarm-bee
pkgver=1.7.0
pkgrel=1
pkgdesc='Swarm client implemented in Go, basic building block for Swarm Network'
arch=('x86_64')
url='https://swarm.ethereum.org/'
license=('BS2D-3-Clause')
depends=('bash')
optdepends=('swarm-bee-clef: external signer for bee')
makedepends=('go' 'git')
options=('!strip' '!buildflags' '!makeflags')
backup=('etc/bee/bee.yaml')
source=(
    "git+https://github.com/ethersphere/bee.git#tag=v${pkgver}"
    "https://go.dev/dl/go1.17.11.linux-amd64.tar.gz"
)
sha512sums=(
    'SKIP'
    'f25e730abc94364ae36c5d5834125cec1cea77c0c8a65ec23acf6f2c3f0a8e908547530202f818d13b74f21a037206fed546826838ffdebc5d1a10cb3a182e44'
)
install="${pkgname}.install"

build() {
    cd "$srcdir/bee"
    GO="$srcdir/go/bin/go" GOPATH="$srcdir/go" make binary
}

package() {
    cd "$srcdir/bee"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/bee"
    install -Dm644 packaging/default -t "$pkgdir/etc/default"
    mv $pkgdir/etc/default/default $pkgdir/etc/default/bee
    install -Dm644 packaging/bee.yaml -t "$pkgdir/etc/bee"
    install -Dm644 packaging/bee.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm755 packaging/bee-get-addr -t "$pkgdir/usr/bin"
    install -Dm755 dist/bee -t "$pkgdir/usr/bin"
}
