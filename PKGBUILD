# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: shahid <helllamer@gmail.com>

pkgbase=litecoin-git
pkgname=('litecoin-daemon-git' 'litecoin-cli-git' 'litecoin-qt-git' 'litecoin-tx-git')

: "${_fragment=branch=master}"

pkgver=0.21.4+13+g3d715b8c60
pkgrel=1
arch=('x86_64')
url="http://www.litecoin.org/"
license=('MIT')
makedepends=(
	boost
	db5.3
	git
	fmt
	libevent
	libzmq.so
	libminiupnpc.so
	protobuf
	qrencode
	qt5-base
	qt5-tools
)
source=(
	"$pkgbase::git+https://github.com/litecoin-project/litecoin.git#$_fragment"
	'litecoin-qt.desktop'
	'litecoind.service'
	'litecoin.sysusers'
	'miniupnpc.patch'
	'0001-fix-boost-1.84-filesystem-deprecations.patch'
	'0002-fix-missing-headers-for-gcc-15.patch'
)
sha256sums=('SKIP'
	'ec2a2669a50fa96147a1d04cacf1cbc3d63238aee97e3b0df3c6f753080dae96'
	'98f5a1b28fe13b9093fa89cfe56bb84af09ff5f0d6e9ca196ec02d6dd826ca88'
	'a722b958a7e9b3468d902efa6c9804e01d78fdf88ead4252c934aee2b1d800db'
	'82497ba013364c98e2390f5fc76ad7f67d7757f705347db7b34134e21c3ab089'
	'f9de747281f6003739d9ac736684771b061e9d63f2ea90404c08187595e57619'
	'bd5ecad7133a98bcb5387fa298a296cde8985d92b5a84eed06c19ec93e8b7ab4')

prepare() {
	cd "$pkgbase"
	git apply ../miniupnpc.patch
	git apply ../0001-fix-boost-1.84-filesystem-deprecations.patch
	git apply ../0002-fix-missing-headers-for-gcc-15.patch
	autoreconf -fi
}

pkgver() {
	cd "$pkgbase"
	git describe --tags | sed 's/-/+/g; s/^v//'
}

build() {
	cd "$pkgbase"
	./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --disable-gui-tests BDB_LIBS="-ldb_cxx-5.3" BDB_CFLAGS="-I/usr/include/db5.3"
	make
}

package_litecoin-qt-git() {
	pkgdesc="Litecoin is a peer-to-peer network based digital currency - Qt"
	depends=(boost-libs desktop-file-utils libevent qt5-base fmt miniupnpc qrencode protobuf zeromq db5.3)
	conflicts=(litecoin-qt)
	provides=(litecoin-qt)

	cd "$pkgbase"
	install -Dt "$pkgdir/usr/bin" -m755 src/qt/litecoin-qt
	install -Dt "$pkgdir/usr/share/man/man1" -m644 doc/man/litecoin-qt.1
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
	install -Dt "$pkgdir/usr/share/applications" -m644 ../litecoin-qt.desktop

	install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/litecoin128.png
}

package_litecoin-daemon-git() {
	pkgdesc="Litecoin is a peer-to-peer network based digital currency - daemon"
	depends=(boost-libs libevent miniupnpc zeromq db5.3)
	conflicts=(litecoin-daemon)
	provides=(litecoin-daemon)

	cd "$pkgbase"
	install -Dt "$pkgdir/usr/bin" -m755 src/litecoind
	install -Dt "$pkgdir/usr/share/man/man1" -m644 doc/man/litecoind.1
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
	install -Dt "$pkgdir/usr/share/doc/$pkgname/examples" -m644 share/examples/litecoin.conf
	install -Dt "$pkgdir/usr/lib/systemd/system" -m644 ../litecoind.service

	install -Dm644 ../litecoin.sysusers "$pkgdir"/usr/lib/sysusers.d/litecoin.conf
}

package_litecoin-cli-git() {
	pkgdesc="Litecoin is a peer-to-peer network based digital currency - RPC client"
	depends=(boost-libs libevent)
	conflicts=(litecoin-cli)
	provides=(litecoin-cli)

	cd "$pkgbase"
	install -Dt "$pkgdir/usr/bin" -m755 src/litecoin-cli
	install -Dt "$pkgdir/usr/share/man/man1" -m644 doc/man/litecoin-cli.1
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

package_litecoin-tx-git() {
	pkgdesc="Litecoin is a peer-to-peer network based digital currency - Transaction tool"
	depends=(boost-libs openssl)
	conflicts=(litecoin-tx)
	provides=(litecoin-tx)

	cd "$pkgbase"
	install -Dt "$pkgdir/usr/bin" -m755 src/litecoin-tx
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

# vim:set ts=2 sw=2 et:
