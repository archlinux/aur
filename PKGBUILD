pkgname=php-xhprof-pecl

pkgver=2.3.9
pkgrel=1

pkgdesc="A Hierarchical Profiler for PHP"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/xhprof"
license=('Apache 2.0')
depends=('php')
makedepends=()
optdepends=('graphviz: to generate callgraphs in reports')
backup=('etc/php/conf.d/xhprof.ini')
options=()
install=php-xhprof.install
source=("https://pecl.php.net/get/xhprof-${pkgver}.tgz")
sha256sums=('1dd421b25e0351e8074dec0b41ee67c5ca3a9f181ee90629e0222a12cd6f8774')

prepare() {
  cd "$srcdir/xhprof-${pkgver}/extension/"

  phpize || return 1
  ./configure --prefix=/usr --with-php-config=$(which php-config)
}

build() {
  cd "$srcdir/xhprof-${pkgver}/extension/"
  make || return 1
}

package() {
  cd "$srcdir/xhprof-${pkgver}/extension/"
  make INSTALL_ROOT="$pkgdir/" install
  echo ';extension=xhprof.so' > xhprof.ini
  echo 'xhprof.output_dir="/tmp"' >> xhprof.ini
  echo 'xhprof.collect_additional_info=1' >> xhprof.ini
  install -D -m644 xhprof.ini "$pkgdir/etc/php/conf.d/xhprof.ini"

  mkdir -p $pkgdir/usr/share/webapps/xhprof/
  cp -ra "$srcdir/xhprof-${pkgver}/xhprof_html" $pkgdir/usr/share/webapps/xhprof/
  cp -ra "$srcdir/xhprof-${pkgver}/xhprof_lib" $pkgdir/usr/share/webapps/xhprof/
  mv $pkgdir/usr/share/webapps/xhprof/xhprof_html $pkgdir/usr/share/webapps/xhprof/xhprof
}
