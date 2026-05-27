# Maintainer: iohzrd <iohzrd@gmail.com>
pkgname=bitcoin-knots-bip110
pkgver=29.3.knots20260210_bip110_v0.4.1
_tagver=29.3.knots20260210+bip110-v0.4.1
_srcver=29.3.knots20260210-bip110-v0.4.1
pkgrel=2
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
source=(
	"https://github.com/dathonohm/bitcoin/archive/refs/tags/v${_tagver}.tar.gz"
	"multi_index-fix-boost-1.91.patch"
	"bitcoin.sysusers"
	"bitcoin.tmpfiles"
)
sha256sums=(
	'60e168439b4e3246cebcb55ba80e90ab772dbdb788c52bb98b491a30491f926d'
	'5b44a132316039d4e3b917cc3ab203c2d79b81bbce3746823f19d06899c18766'
	'02f767d8eea9144e8372e4a454c4a14ecb7c84572e0cfa06e62b05a57d1fac6e'
	'0e9dfc7ede2c30ceeedd8a73a5e0aa7047d955431a87aa72a428c4fbd7f5de4f'
)

prepare() {
	cd "bitcoin-$_srcver"
	# Backport of bitcoin/bitcoin#35175 (commit 546598b73675): fix
	# compilation failure with Boost >= 1.91. Drop once a tarball
	# including this commit is released upstream.
	patch -p1 <"$srcdir/multi_index-fix-boost-1.91.patch"
}

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

	# systemd files
	install -Dm644 contrib/init/bitcoind.service "${pkgdir}/usr/lib/systemd/system/bitcoind.service"
	install -Dm644 "${srcdir}/bitcoin.sysusers" "${pkgdir}/usr/lib/sysusers.d/bitcoin.conf"
	install -Dm644 "${srcdir}/bitcoin.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bitcoin.conf"

	# config files
	install -dm710 "${pkgdir}/etc/bitcoin"
	install -Dm644 share/examples/bitcoin.conf "${pkgdir}/etc/bitcoin/bitcoin.conf"
}
