_phpbase="php70"
pkgname=php70-memcache
pkgver=3.0.8
pkgrel=8
pkgdesc="Memcache module for PHP"
arch=('x86_64')
url="http://pecl.php.net/package/memcache"
license=('PHP')
depends=("${_phpbase}")
makedepends=('git')
checkdepends=('memcached')
backup=("etc/${_phpbase}/conf.d/memcache.ini")
install=php-memcache.install
_commit=fdbd46bbc6f53ed6e024521895e142cbfc9b3340
source=("pecl-memcache::git+https://github.com/websupport-sk/pecl-memcache.git#commit=$_commit")

prepare() {
  cd "$srcdir/pecl-memcache"
  # Disable UDP tests
  sed -i "s|^\(\$udpPort2\? =\) .*|\1 0;|" tests/connect.inc

  # Remove flaky tests
  #   [tests/040.phpt] memcache->increment()/decrement() with multiple keys
  #   [tests/042.phpt] memcache->set() with multiple values
  #   strange keys [tests/005.phpt]
  #   ini_set('session.save_handler') [tests/036.phpt]
  #   ini_set('memcache.session_redundancy') [tests/044.phpt]
  #   ini_set('session.save_handler') with unix domain socket [tests/053.phpt]
  #   session locking [tests/057.phpt]
  rm tests/{005,036,040,042,044,053,057}.phpt
}

build() {
  cd "$srcdir/pecl-memcache"
  phpize70
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/pecl-memcache"
  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=memcache.so' > memcache.ini
  install -Dm644 memcache.ini "$pkgdir/etc/${_phpbase}/conf.d/memcache.ini"
}

check() {
  cd "$srcdir/pecl-memcache"

  sed -i "s|^\(\$domainsocket =\) .*|\1 'unix://$PWD/memcached.sock';|" \
    tests/connect.inc

  memcached_pids=()
  memcached -p 11211 -U 11211 >/dev/null        & memcached_pids+=($!)
  memcached -p 11212 -U 11212 >/dev/null        & memcached_pids+=($!)
  memcached -s "$PWD/memcached.sock" >/dev/null & memcached_pids+=($!)

  local ret=0
  make test NO_INTERACTION=1 REPORT_EXIT_STATUS=1 || ret=1

  kill ${memcached_pids[@]}

  return $ret
}

md5sums=('SKIP')
