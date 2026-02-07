# Maintainer: iohzrd <iohzrd@gmail.com>
pkgname=bitcoin-knots-bip110
pkgver=29.2.knots20251110_bip110_v0.1
_tagver=29.2.knots20251110+bip110-v0.1
_srcver=29.2.knots20251110-bip110-v0.1
pkgrel=1
epoch=
pkgdesc="enhanced Bitcoin node/wallet software with BIP-110 support"
arch=(x86_64)
url="https://bip110.org"
license=('MIT')
groups=(bitcoin)
depends=('gcc-libs' 'sqlite' 'libevent' 'glibc')
makedepends=('boost' 'cmake')
checkdepends=('python3')
conflicts=('bitcoin')
backup=('etc/bitcoin/bitcoin.conf')
options=('!debug')
source=("https://github.com/dathonohm/bitcoin/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('173d7cf1b8248c3dcb60d932566d81e3b3ea736e1a64dd01df50004e26ea710b')

build() {
	cd "bitcoin-$_srcver"
	cmake -B build
	cmake --build build -j "$(nproc)"
}

check() {
	cd "bitcoin-$_srcver"
	ctest --test-dir build
}

package() {
	cd "bitcoin-$_srcver"
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 build/bin/{bitcoin-cli,bitcoin-tx,bitcoin-util,bitcoin-wallet,bitcoind} "${pkgdir}/usr/bin/"
	
	install -dm755 "${pkgdir}/usr/share/man/man1"
	install -Dm755 doc/man/{bitcoin-cli.1,bitcoin-tx.1,bitcoin-util.1,bitcoin-wallet.1,bitcoind.1} "${pkgdir}/usr/share/man/man1/"
	
	install -Dm644 share/examples/bitcoin.conf "${pkgdir}/etc/bitcoin/bitcoin.conf"
}
