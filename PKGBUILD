# Maintainer: Léo Haf <leo@haf.ovh>
pkgname=bitcoin-knots
pkgver=29.5.1.knots20260508
pkgrel=1
epoch=
pkgdesc="enhanced Bitcoin node/wallet software"
arch=(x86_64)
url="https://bitcoinknots.org"
license=('MIT')
groups=(bitcoin)
depends=('gcc-libs' 'sqlite' 'libevent' 'glibc')
makedepends=('boost' 'cmake')
checkdepends=('python3')
conflicts=('bitcoin')
backup=('etc/bitcoin/bitcoin.conf')
options=('!debug')
source=("https://bitcoinknots.org/files/29.x/$pkgver/bitcoin-$pkgver.tar.gz")
sha256sums=('e77ae84fd7c460102ad09f95fe3174a4d1ccbcde3f10885f36c02fc91ea8a45c')
validpgpkeys=(
	'1A3E761F19D2CC7785C5502EA291A2C45D0C504A' # luke-jr
)

build() {
	cd "bitcoin-$pkgver"
	cmake -B build
	cmake --build build -j "$(nproc)"
}

check() {
	cd "bitcoin-$pkgver"
	ctest --test-dir build
}

package() {
	cd "bitcoin-$pkgver"
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 build/bin/{bitcoin-cli,bitcoin-tx,bitcoin-util,bitcoin-wallet,bitcoind} "${pkgdir}/usr/bin/"
	
	install -dm755 "${pkgdir}/usr/share/man/man1"
	install -Dm755 doc/man/{bitcoin-cli.1,bitcoin-tx.1,bitcoin-util.1,bitcoin-wallet.1,bitcoind.1} "${pkgdir}/usr/share/man/man1/"
	
	install -Dm644 share/examples/bitcoin.conf "${pkgdir}/etc/bitcoin/bitcoin.conf"
	
	install -Dm644 contrib/init/bitcoind.service "${pkgdir}/etc/systemd/system/bitcoind.service"
}
