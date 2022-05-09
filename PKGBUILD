# Maintainer: Kevin Puertas <kevinpr@jkanetwork.com>
# Maintainer: José Luis <jlgarrido97@gmail.com>
# Maintainer: Ron Bickers <ron@logicetc.com>
pkgname=openlitespeed
pkgver=1.7.15
pkgrel=2
pkgdesc="A high-performance, lightweight, open source HTTP server"
arch=('x86_64')
url="https://openlitespeed.org/"
license=('GPL3')
depends=(expat geoip libmodsecurity libxcrypt zlib)
makedepends=(cmake git go)
conflicts=(openlitespeed-bin)
backup=(opt/lsws/admin/conf/admin_config.conf
	opt/lsws/admin/conf/htpasswd
	opt/lsws/conf/templates/ccl.conf
	opt/lsws/conf/templates/rails.conf
	opt/lsws/conf/httpd_config.conf)
install=$pkgname.install
source=(https://openlitespeed.org/packages/$pkgname-$pkgver.src.tgz
        archlinux.patch
	build_yajl.sh.patch
	$pkgname.sysusers
	$pkgname.tmpfiles)
sha256sums=('b1601686e81ae696dff3770a6c2cc558eafbecbf6cccd0936bfc7000dc866995'
            '819f7d53f212e36574ee61b7eb3d7d02e0499d5d8df622524f3c580ef5df2057'
            '77b8b0870da1bbf43e77b976cb118b97ac09f74744845877e56023c5772616f1'
            'a641cc75a36f1050287b6ff48448efa189ae131d4ece6df20b66c9e5b4d6e355'
            '93de5ef937ec4fdf0c33e3932fd81f9890b96b99efb2fbe3d601fb91945bde7f')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i "$srcdir"/archlinux.patch
}

build() {
	cd "$pkgname-$pkgver"
	./build.sh
}

package() {
	cd "$pkgname-$pkgver"
	sed -i "s#SERVERROOT=/opt/lsws#SERVERROOT=$pkgdir/opt/lsws#" ols.conf
	./install.sh

	# Fix some permissions.
	find "$pkgdir"/opt/lsws/conf -type d -exec chmod 0750 "{}" \;
	find "$pkgdir"/opt/lsws/conf -type f -exec chmod 0640 "{}" \;
	find "$pkgdir"/opt/lsws/tmp -type d -exec chmod 0750 "{}" \;
	find "$pkgdir"/opt/lsws/admin/conf -type d -exec chmod 0700 "{}" \;
	find "$pkgdir"/opt/lsws/admin/conf -type f -exec chmod 0600 "{}" \;
	find "$pkgdir"/opt/lsws/admin/tmp -type d -exec chmod 0750 "{}" \;

	# All package files are owned by root; systemd-tmpfiles sets ownership after install.
	chown -R root: "$pkgdir"/opt/lsws

	# Remove $pkgdir from installed files.
	sed -i "s#$pkgdir##g" "$pkgdir"/opt/lsws/admin/misc/*

        install -Dm0644 "$pkgdir"/opt/lsws/admin/misc/lshttpd.service "$pkgdir"/usr/lib/systemd/system/lshttpd.service
        install -Dm0644 "$srcdir"/openlitespeed.sysusers "$pkgdir"/usr/lib/sysusers.d/openlitespeed.conf
        install -Dm0644 "$srcdir"/openlitespeed.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/openlitespeed.conf

        # Fix symlink for lsphp.
        pushd "$pkgdir"/opt/lsws/fcgi-bin
        rm lsphp
        ln -s lsphp5 lsphp
	popd

	# Clean up admin_php build.
	rm -rf "$pkgdir"/opt/lsws/phpbuild/*
}
