# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=blocky
pkgver=0.29.0
pkgrel=1
pkgdesc="Fast and lightweight DNS proxy as ad-blocker"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/0xERR0R/blocky"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
backup=('etc/blocky.yml')
install=blocky.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'blocky.service'
	'blocky.sysusers'
	'blocky.yml'
)
b2sums=('e2cf074c62c8588d9b192105b35c5ed83c48fca6b35dbab2841f4306180001c0aca2e242ec4d3bee35dc6eba794e75f934a61d64f710ce1a808217a3a3c850fa'
	'b84ae53f2efae046f0b7695da9a14513d23f3e8cc8e5ef5b0c80fcbe87446d777b7c1197328472b0cb6500bee5c7ae2755a9e1674ecef545e9d9db443a28d1c2'
	'9641b73253d80a8f64fdd1c10a35ae7631e9eec8d2feda3214836af7634fc0d33d55a5b150912996b3380ef9242b17fbb2a847557b68bf5b657da68eb7d8321c'
	'dd0a46ee82ddd40853c95fdca8b3ef287c143ec815e913069dafaa894176a2109038fe5a79fbeef21d39412c7c72d466e8d4c4e636bbb34146e1a9c210e2c619'
)

prepare() {
	cd "$pkgname-$pkgver"
	echo ":: Downloading Go modules..."
	go mod download -x
}

build() {
	cd "$pkgname-$pkgver"
	make build
}

check() {
	cd "$pkgname-$pkgver"
	# make test # TODO: tests fail
}

package() {
	install -Dvm644 blocky.sysusers "$pkgdir/usr/lib/sysusers.d/blocky.conf"
	install -Dvm644 blocky.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dvm644 blocky.yml -t "$pkgdir/etc/"
	cd "$pkgname-$pkgver"
	install -Dv bin/blocky -t "$pkgdir/usr/bin/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
