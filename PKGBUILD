# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Contributor: Martin Kozák <martinkozak@martinkozak.net>

pkgname=php-xhprof

pkgver=0.9.10
pkgrel=1
__commit="dab44f76da5c8a0d4f1339f7d2ea2bc42408e8e9"

pkgdesc="A Hierarchical Profiler for PHP"
arch=('i686' 'x86_64')
url="https://github.com/phacility/xhprof/tree/experimental"
license=('Apache')
depends=('php')
makedepends=()
optdepends=('graphviz: to generate callgraphs in reports')
backup=('etc/php/conf.d/xhprof.ini')
options=()
install=php-xhprof.install
source=("https://github.com/phacility/xhprof/archive/${__commit}.zip")
sha512sums=('c8620e34d0a3816740e28efbbbbfd2c85e50dcbee907e54b86afdb1b2c49f6896203b8a84471def56cce105aef17937bf13544f35b70dab4a7f0ae1c071cb67f')

prepare() {
  cd "$srcdir/xhprof-${__commit}/extension/"

  phpize || return 1
  ./configure --prefix=/usr --with-php-config=$(which php-config)
}

build() {
  cd "$srcdir/xhprof-${__commit}/extension/"
  make || return 1
}

package() {
  cd "$srcdir/xhprof-${__commit}/extension/"
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
