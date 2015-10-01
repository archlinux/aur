# Maintainer: frank AT apsu DOT be
pkgname=geoipupdate
pkgver=2.2.1
pkgrel=1
pkgdesc="Automatic updates of MaxMind GeoIP2 and GeoIP Legacy binary databases"
license=('GPL2')
arch=(i686 x86_64)
url="http://dev.maxmind.com/geoip/geoipupdate/"

depends=(curl)
provides=(geoipupdate)
install=geoipupdate.install

source=("https://github.com/maxmind/geoipupdate/releases/download/v$pkgver/geoipupdate-$pkgver.tar.gz"
	    "geoipupdate.install"
        "geoipupdate.service"
        "geoipupdate.timer"
)

sha512sums=('5d28803353badd4d00a9174202912524f31e057ef4f5381360c16909fbccce3033f5ad7ec9c55963b70c0bbdb74589932bde36ea9b34f2a0632c504c1718dd85'
            '660d22d5dc86d6c2a30456e72b6d121d093d40fc1e27f8250d33675b4752c5bb66aef371a17a7177a926df27a7149bc63118248c6048078e861ce420bd875583'
            '20eba13c38f54fb32dc3ed6535c4ab62a7292b0f638d03c9ab5b3d3d968e4324795953fe0ec1596e3e69b279e8de24a5608f1484d68dd9b5d35f11a56b1dbd72'
            '1d865e31eccd7597093df83da05f3866a361e9f68bcc1f1fa10d72cc2fae8a789d9c2cee445cf81f2384a3415ebd12d2c485d6dfe8401ea005f7c111a6331dd2')

build() {
	cd "$srcdir/geoipupdate-$pkgver"
	./configure --prefix=/usr --libdir=/usr/lib --libexecdir=/usr/lib  --sysconfdir=/etc/geoipupdate
	make
}

package() {
	cd "$srcdir/geoipupdate-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    cp "$srcdir/geoipupdate.service" "$pkgdir/usr/lib/systemd/system/"
    cp "$srcdir/geoipupdate.timer"   "$pkgdir/usr/lib/systemd/system/"
}
