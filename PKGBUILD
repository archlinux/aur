# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=camo
pkgver=2.3.0
pkgrel=1
pkgdesc="a small http proxy to simplify routing images through an SSL host"
arch=('any')
url="https://github.com/atmos/camo"
license=('MIT')
depends=('nodejs')
makedepends=('coffee-script')
backup=('etc/camo')
install=camo.install
source=("https://github.com/atmos/$pkgname/archive/v$pkgver.tar.gz"
        'camo.service'
	'camo.conf'
	'camo.install'
	'append-mime-types.patch')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# Patch mime-types.json for easier Amazon S3 and Cloudflare integration
	patch -p1 < ../append-mime-types.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	coffee -c server.coffee
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 server.js "$pkgdir/usr/lib/camo/server.js"
	install -Dm644 package.json "$pkgdir/usr/lib/camo/package.json"
	install -Dm644 mime-types.json "$pkgdir/usr/lib/camo/mime-types.json"
	install -Dm644 ../camo.service "$pkgdir/usr/lib/systemd/system/camo.service"
	install -Dm644 ../camo.conf "$pkgdir/etc/camo"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

sha256sums=('b301231075e39091dd622569a8fb13912a82a727c5dc0e7d21d84cd0b463c51f'
            '038c7495a899f8d7b9b6487aeed54409afeb266e99c7ee9a700202d758e20b2c'
            '67f178c6f782a2faeec056e21d7fb263f8a4e61b92450cde552fa544bb4bd1d5'
            '276257e3d3024ad514b740cb0c8342e5684875a3d072176a13e524d23e2c54e9'
            'dda93ac5660b0a894eb7ea660fd10d0d59988871f3e903354c849a191795a026')
