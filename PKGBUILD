# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Contributor: Martin Kozák <martinkozak@martinkozak.net>

pkgname=php-xhprof
pkgver=0.9.4
pkgrel=3
pkgdesc="A Hierarchical Profiler for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/xhprof"
license=('Apache')
depends=('php')
makedepends=()
optdepends=('graphviz: to generate callgraphs in reports')
backup=('etc/php/conf.d/xhprof.ini')
options=()
install=php-xhprof.install
source=("http://pecl.php.net/get/xhprof-$pkgver.tgz")
md5sums=('ab4062a7337e3bdaa2fd7065a7942b8d')

prepare() {
  cd "$srcdir/xhprof-$pkgver/extension/"

  phpize || return 1 
  ./configure --prefix=/usr --with-php-config=$(which php-config)
}

build() {
  cd "$srcdir/xhprof-$pkgver/extension/"
  make || return 1
}

package() { 
  cd "$srcdir/xhprof-$pkgver/extension/"
  make INSTALL_ROOT="$pkgdir/" install
  echo ';extension=xhprof.so' > xhprof.ini
  install -D -m644 xhprof.ini "$pkgdir/etc/php/conf.d/xhprof.ini"

  # HTML Report interface
  cd ".."
  mkdir -p $pkgdir/usr/share/webapps/xhprof/
  cp -ra xhprof_html $pkgdir/usr/share/webapps/xhprof/
  cp -ra xhprof_lib $pkgdir/usr/share/webapps/xhprof/

  # apache
  mkdir -p $pkgdir/etc/httpd/conf/extra/
  cat >$pkgdir/etc/httpd/conf/extra/xhprof.conf <<EOF
        Alias /xhprof "/usr/share/webapps/xhprof/xhprof_html"
        <Directory "/usr/share/webapps/xhprof/xhprof_html">
                AllowOverride All
                Options FollowSymlinks
                Order allow,deny
                Allow from all
                php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
        </Directory>
EOF

}

#Y vim:set ts=2 sw=2 et:
