# Maintainer: Léo Haf <leo@haf.ovh>
pkgname=bitcoin-knots
pkgver=29.3.knots20260508
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
sha256sums=('8e3aebdacab32f6f6b65d90c98a188952553a12a577e0b58d13525bfd59dd630')
validpgpkeys=(
	'DAED928C727D3E613EC46635F5073C4F4882FFFC' # Léo haf <leo@haf.ovh>
)

build() {
	cd "bitcoin-$pkgver"
	cmake -B build -D RDTS_CONSENT=RUNTIME_WARN
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
}
