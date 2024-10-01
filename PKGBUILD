# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Previous maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Contributor: Martin Kozák <martinkozak@martinkozak.net>

pkgname=php-xhprof

pkgver=2.3.10
pkgrel=1

pkgdesc="A Hierarchical Profiler for PHP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://pecl.php.net/package/xhprof"
license=('Apache')
depends=('php')
makedepends=()
optdepends=('graphviz: to generate callgraphs in reports')
# backup=('etc/php/conf.d/xhprof.ini')
options=()
#install=php-xhprof.install
source=("https://pecl.php.net/get/xhprof-${pkgver}.tgz")
sha512sums=('fcd96013222cfde9a5a26e818effc35fdc686e1aeec5040964af7672700938b1e6090b84090234ef05b7ae4deb9fa2869eb53ae5d7c6666fcb1c6e0b484a7a9c')

prepare() {
	cd "$srcdir/xhprof-${pkgver}/extension/"

	phpize || return 1
	./configure --prefix=/usr --with-php-config=$(which php-config)
}

build() {
	cd "$srcdir/xhprof-${pkgver}/extension/"
	make || return 1
	#NO_INTERACTION=1 make test || return 1
}

package() {
	cd "$srcdir/xhprof-${pkgver}/extension/"
	make INSTALL_ROOT="$pkgdir/" install
	# xhprof.ini not really needed, therefore commented out here
	#echo ';extension=xhprof.so' > xhprof.ini
	#install -D -m644 xhprof.ini "$pkgdir/etc/php/conf.d/xhprof.ini"

	# HTML Report interface: copy JavaScript + PHP
	cd ..
	mkdir -p $pkgdir/usr/share/webapps/xhprof/
	cp -ra xhprof_html $pkgdir/usr/share/webapps/xhprof/
	cp -ra xhprof_lib $pkgdir/usr/share/webapps/xhprof/

	# For NGINX: set xhprof.output_dir = /srv/http/tmp in php.ini
	# and activate PHP.
	# Apache web-server config stuff. Left here in comments.
#	mkdir -p $pkgdir/etc/httpd/conf/extra/
#	cat >$pkgdir/etc/httpd/conf/extra/xhprof.conf <<EOF
#	Alias /xhprof "/usr/share/webapps/xhprof/xhprof_html"
#	<Directory "/usr/share/webapps/xhprof/xhprof_html">
#		AllowOverride All
#		Options FollowSymlinks
#		Order allow,deny
#		Allow from all
#		php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
#	</Directory>
#EOF

}


