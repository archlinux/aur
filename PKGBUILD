# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=php-pdo-cassandra
pkgver=0.6.0
pkgrel=2
pkgdesc="PDO driver for Cassandra CQL"
url="http://github.com/Orange-OpenSource/YACassandraPDO"
arch=('x86_64' 'i686')
license=('Apache')
depends=('php' 'thrift' 'boost')
makedepends=('thrift')
conflicts=('php-cassandra-pdo-git')
source=("https://github.com/Orange-OpenSource/YACassandraPDO/archive/${pkgver}.tar.gz")
md5sums=('06fd78e96670bc7ea9cfdbf36e5fea91')

build() {
  cd "$srcdir/YACassandraPDO-$pkgver"

  phpize
  ./configure --prefix=/usr
  # We need to sed this generated file to support thrift 0.9.3
  sed -i "s/apache::thrift::protocol::TInputRecursionTracker/::apache::thrift::protocol::TInputRecursionTracker/" gen-cpp/Cassandra.cpp gen-cpp/cassandra_types.cpp
  sed -i "s/apache::thrift::protocol::TOutputRecursionTracker/::apache::thrift::protocol::TOutputRecursionTracker/" gen-cpp/Cassandra.cpp gen-cpp/cassandra_types.cpp
  make

}

package() {
  cd "$srcdir/YACassandraPDO-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=pdo_cassandra.so' > pdo_cassandra.ini
  install -Dm644 pdo_cassandra.ini "$pkgdir/etc/php/conf.d/pdo_cassandra.ini"
}
