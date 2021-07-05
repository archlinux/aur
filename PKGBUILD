# Maintainer: MFW78 <mfw78@chasingseed.com>

pkgname=swarm-bee-clef
pkgver=0.5.0
pkgrel=2
pkgdesc="Go Ethereum's external signer packaged for bee"
arch=('x86_64')
url='https://swarm.ethereum.org/'
license=('GPLv3')
depends=('bash')
makedepends=('go' 'git')
options=('!strip' '!buildflags' '!makeflags')
backup=(
    'etc/bee-clef/4byte.json'
    'etc/bee-clef/rules.js'
)
source=("git+https://github.com/ethersphere/bee-clef.git#tag=v${pkgver}")
sha512sums=('SKIP')
install="${pkgname}.install"

build() {
    cd "$srcdir/bee-clef"
    export GOBIN="$srcdir/bee-clef"
    go install github.com/ethereum/go-ethereum/cmd/clef@latest
}

package() {
    cd "$srcdir/bee-clef"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/bee-clef"
    install -Dm644 packaging/{4byte.json,rules.js} -t "$pkgdir/etc/bee-clef"
    install -Dm644 packaging/bee-clef.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm755 packaging/bee-clef-{keys,service} -t "$pkgdir/usr/bin"
    mv packaging/default packaging/bee-clef
    install -Dm644 packaging/bee-clef -t "$pkgdir/etc/default"
    install -Dm755 clef -t "$pkgdir/usr/bin"
}
