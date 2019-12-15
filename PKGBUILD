# Maintainer: robertfoster

_pkgname=fabric
pkgname=hyperledger-${_pkgname}
pkgver=1.4.4
pkgrel=1
pkgdesc="A platform for distributed ledger solutions, underpinned by a modular architecture delivering high degrees of confidentiality, resiliency, flexibility and scalability"
arch=(armv6h armv7h arm aarch64 i686 x86_64)
url="https://github.com/hyperledger/fabric"
license=('APACHE')
groups=('hyperledger')
depends=('go')
makedepends=('git' 'docker')
install=$pkgname.install
source=("https://github.com/hyperledger/fabric/archive/v$pkgver.tar.gz"
	${_pkgname}-peer.conf
	${_pkgname}-peer.service
arm-support.patch)

export GOOS=linux
case "$CARCH" in
	x86_64) export GOARCH=amd64 ;;
	i686) export GOARCH=386 GO386=387 ;;
	arm) export GOARCH=arm GOARM=5 ;;
	armv6h) export GOARCH=arm GOARM=6 ;;
	armv7h) export GOARCH=arm GOARM=7 ;;
	aarch64) export GOARCH=arm64 ;;
esac

prepare() {
	cd $srcdir/${_pkgname}-$pkgver
	patch -Np1 -i ../arm-support.patch
	cd ..
	export GOPATH="$PWD"/.gopath
	mkdir -p "$GOPATH"/src/github.com/hyperledger
	ln -sf "$PWD"/fabric-$pkgver "$GOPATH"/src/github.com/hyperledger/fabric
}

build() {
	export GOPATH="$PWD"/.gopath
	cd "$GOPATH"/src/github.com/hyperledger/fabric
	make release/linux-$GOARCH
}

package() {
	cd $srcdir/${_pkgname}-$pkgver
	install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

	cp -r release/linux-$GOARCH/bin "$pkgdir/usr"
	install -dm 755 $pkgdir/etc/hyperledger/fabric/msp
	install -dm 755 $pkgdir/etc/hyperledger/fabric/tls
	cp -r sampleconfig/*.yaml $pkgdir/etc/hyperledger/fabric

	msg2 "Install systemd service"
	install -Dm644 $srcdir/${_pkgname}-peer.service $pkgdir/usr/lib/systemd/system/${_pkgname}-peer.service

	msg2 "Install conf file"
	install -Dm644 $srcdir/${_pkgname}-peer.conf $pkgdir/usr/lib/environment.d/${_pkgname}-peer.conf
}

md5sums=('d35eda5b3127218f066b2d62f3e11828'
         'a0bafaaeb3be191ed2893662fe9a6fc7'
         '19a55d9a62f467235b51b2e4d7b3c523'
         'cb61f0911c6bb15b8f1fdc5ab1802c38')
