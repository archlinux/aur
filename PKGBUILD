# Maintainer: HLFH <gaspard@dhautefeuille.eu>
pkgname=openlitespeed
pkgver=1.7.17
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
b2sums=('fd519bdaed887344c1822020dbd98517fe0e8cd5954813f775159bad24785ddecc8289fcf60a9242e92f7f3d36fa3cfd54609cf75d443527fc78cce2a992a197'
        '54bec1e0f65b38bbce31a4fc8e2f55e2fb989a2d1e6d4fae37873d54812d26bf90ff9ca107409afbddd888b705449d402a1119eb172593fa18ea50292353bcfb'
        '06098679000a7d5243b757a4d33978c17227717046eff82b3c47f306382f29bf174fd5a2d08696a1bcef5637d23b817c43aba325f75c23b7cc9ab16f6d090dcb'
        '3dba0c1915eb6a815a385b27c068010c59ea3c96005cc64308e47072ce3d26ee5d5974288dbb93aad10b802fa4f3ed3e67107c2f4dac3605de91586cbc46181e'
        '2d00d23542951e045b27a04dd7c070fe16fe23af57eac8883bb67d53ae5dc090a87ba72370e7fa1774d0e490a3fde39c46efea2c3b941686839d127a624b9d2d')

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
