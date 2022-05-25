# Maintainer: Kevin Puertas <kevinpr@jkanetwork.com>
# Maintainer: José Luis <jlgarrido97@gmail.com>
# Maintainer: Ron Bickers <ron@logicetc.com>
pkgname=openlitespeed
pkgver=1.7.16
pkgrel=1
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
sha256sums=('918c1f54b92b87462ff7013568768c85cb08568f184eb83223c48f3c0a792719'
            '92d1c6e4c93f2f0ee363b20add793a47b1cf7783ca430591a9de95b3496d7ef3'
            '77b8b0870da1bbf43e77b976cb118b97ac09f74744845877e56023c5772616f1'
            '0d2a2d55882e76e1bbdea12e9d97886366c0ad58c43b24fe655fff099c11e141'
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
