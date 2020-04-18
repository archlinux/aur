# Maintainer: robertfoster

_pkgname=fabric
pkgname=hyperledger-${_pkgname}
pkgver=2.1.0
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
	hyperledger.sysusers
	hyperledger.tmpfiles
)

prepare() {
	cd $srcdir
	export GOPATH="$PWD"/.gopath
	mkdir -p "$GOPATH"/src/github.com/hyperledger
	ln -sf "$PWD"/fabric-$pkgver "$GOPATH"/src/github.com/hyperledger/fabric
}

build() {
	export GOPATH="$PWD"/.gopath
	cd "$GOPATH"/src/github.com/hyperledger/fabric
	make release
}

package() {
	cd $srcdir/${_pkgname}-$pkgver
	install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

	cp -r release/linux-$(go env GOARCH)/bin "$pkgdir/usr"
	install -dm 755 $pkgdir/etc/hyperledger/fabric/msp
	install -dm 755 $pkgdir/etc/hyperledger/fabric/tls
	cp -r sampleconfig/*.yaml $pkgdir/etc/hyperledger/fabric

	msg2 "Install systemd service"
	install -Dm644 $srcdir/${_pkgname}-peer.service $pkgdir/usr/lib/systemd/system/${_pkgname}-peer.service
        install -D -m644 "${srcdir}/hyperledger.sysusers" "${pkgdir}/usr/lib/sysusers.d/hyperledger.conf"
        install -D -m644 "${srcdir}/hyperledger.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/hyperledger.conf"

	msg2 "Install conf file"
	install -Dm644 $srcdir/${_pkgname}-peer.conf $pkgdir/usr/lib/environment.d/${_pkgname}-peer.conf
}

md5sums=('1fa2f633da7a5ec7cc7b4559d3db7e53'
         '6d766c337ac87760a14198c54c052826'
         'f073e38d65495162dbb53fd5a8430ab3'
         'e6d2e667cbf6fae5f236dade2ce42193'
         '2fe223bd9e94c0d968766612d6406d63')
