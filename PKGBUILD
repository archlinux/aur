# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: MFW78 <mfw78@chasingseed.com>

pkgname=swarm-bee-clef
pkgver=0.13.1
_clefver=1.10.17
pkgrel=1
pkgdesc="Go Ethereum's external signer"
arch=('x86_64')
url='https://github.com/ethersphere/bee-clef'
license=('GPL3')
depends=('bash')
makedepends=('go')
conflicts=('go-ethereum')
backup=('etc/bee-clef/4byte.json'
        'etc/bee-clef/rules.js')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "go-ethereum-bee-clef-$_clefver.tar.gz::https://github.com/ethereum/go-ethereum/archive/v$_clefver.tar.gz"
        'bee-clef.sysusers'
        'bee-clef.tmpfiles')
sha256sums=('ab64c812ff310e5a7309a62620ce0c39be559a151364c608111039c1bfd6b243'
            '00db123e1b23d3d904bd8a6bd4de8f3330d14db1622e8f22bf1653c94f03e09c'
            '7314d2aa0ce149621a5d59b881ada3ea37231743b5875389b3041bb845233491'
            'c5dbcb978de5b7c31482f4fd1cff3101a738df85e27758ec2b4e469a1762384c')
install=bee-clef.install

prepare() {
	cd "go-ethereum-$_clefver"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "go-ethereum-$_clefver"
	go build -o build ./cmd/clef
}

check() {
	cd "go-ethereum-$_clefver"
	go test ./cmd/clef
}

package() {
	install -D "go-ethereum-$_clefver/build/clef" -t "$pkgdir/usr/bin/"
	install -Dm644 bee-clef.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 bee-clef.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	cd "bee-clef-$pkgver"
	install -Dm644 packaging/{4byte.json,rules.js} -t "$pkgdir/etc/bee-clef"
	install -Dm644 packaging/bee-clef.service -t "$pkgdir/usr/lib/systemd/system"
	install -D packaging/bee-clef-{keys,service} -t "$pkgdir/usr/bin"
	install -Dm644 packaging/default "$pkgdir/etc/default/bee-clef"
}
