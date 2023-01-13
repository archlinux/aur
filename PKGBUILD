# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Previous maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Contributor: Martin Kozák <martinkozak@martinkozak.net>

pkgname=php-xhprof

pkgver=2.3.9
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
sha512sums=('38a2609d961d908c6a4b5d1ff2085ffdad4a5f7d277705c826ae19e215660802528d606c5ee052f2e65255a7a85b2a9cb9038f4785c730ec468fc76dc7bcf5de')

prepare() {
	cd "$srcdir/xhprof-${pkgver}/extension/"

	phpize || return 1
	./configure --prefix=/usr --with-php-config=$(which php-config)
}

build() {
	cd "$srcdir/xhprof-${pkgver}/extension/"
	make || return 1
	NO_INTERACTION=1 make test || return 1
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

	# Apache web-server config stuff. Left here in comments.
	# I prefer Hiawatha web-server, others might prefer NGINX, etc.
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


