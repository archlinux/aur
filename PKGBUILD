# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=blocky
pkgver=0.23
pkgrel=1
pkgdesc="Fast and lightweight DNS proxy as ad-blocker"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/0xERR0R/blocky"
license=('Apache')
depends=('glibc')
makedepends=('go')
backup=('etc/blocky.yml')
install=blocky.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'blocky.service'
	'blocky.sysusers'
	'blocky.yml'
)
b2sums=('4dd8b4a9587ed2b768ff2cf8809e14242032d7e8be3d3c422eb5518df33c32c0f767ba8e7490f353e81ede8c150cf3175621ea35ad3aa682f62c7d169c511b63'
	'b352c4dceb87892d291764c00d294dff50e3701b3eecc4c1573b1200fb5676e8ef19af842b11663080354aff087a59a72f11074533b4aa60e6a505edd52aad65'
	'9641b73253d80a8f64fdd1c10a35ae7631e9eec8d2feda3214836af7634fc0d33d55a5b150912996b3380ef9242b17fbb2a847557b68bf5b657da68eb7d8321c'
	'39ad1c530ea0abc3d166880c2e8cc6b1dd266531a131bef8cd5a5ea0208b4d361f3e98d07a8b26af8517cddb34cbfadc37ae175337befa673f073ae744f40633'
)

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    go mod download
}

build() {
	cd "$pkgname-$pkgver"
	make build
}

check() {
	cd "$pkgname-$pkgver"
	# make test # TODO: test fails
}

package() {
	install -Dvm644 blocky.sysusers "$pkgdir/usr/lib/sysusers.d/blocky.conf"
	install -Dvm644 blocky.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dvm644 blocky.yml -t "$pkgdir/etc/"
	cd "$pkgname-$pkgver"
	install -Dv bin/blocky -t "$pkgdir/usr/bin/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
