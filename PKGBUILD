# Maintainer: Léo Haf <leo@haf.ovh>
pkgname=bitcoin-knots
pkgver=29.4.1.knots20260508
pkgrel=2
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
sha256sums=('da43e8c790bed9d8c432d07a10271084537dbd61de3ba0f7bd49f959adcb9b8f')
validpgpkeys=(
	'DAED928C727D3E613EC46635F5073C4F4882FFFC' # Léo haf <leo@haf.ovh>
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
