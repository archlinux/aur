# Contributor: robertfoster

pkgname=capanalysis
pkgver=1.2.3
pkgrel=1
arch=(i686 x86_64)
pkgdesc="PCAP files from another point of view"
url="http://www.capanalysis.net/"
license=('GPL')
depends=('glibc' 'libpcap' 'libpqxx' 'sqlite' 'openssl' 'zlib' 'wireshark-cli' 'apache' 'php-apache' 'php-sqlite' 'php-pgsql' 'postgresql' 'ndpi')
makedepends=('xxd')
source=("https://github.com/xplico/CapAnalysis/archive/v$pkgver.tar.gz"
  "xplico::git+https://github.com/xplico/xplico"
  capanalysis.service
  capana.conf)
install=capanalysis.install

prepare() {
  cd $srcdir
  ln -sf xplico/include .
  cd xplico
  # Fix some headers paths
  find . -name "*.c" -exec sed -i "s|libndpi\/|ndpi\/|g" {} +
  find . -name "*.h" -exec sed -i "s|libndpi\/|ndpi\/|g" {} +
  find . -name "*.c" -exec sed -i "s|json_object_private|json_object|g" {} +
}

build() {
  cd $srcdir
  cd xplico
  make -j1
  cd ../CapAnalysis-$pkgver
  msg2 "Compiling CapAnalysis..."
  make pkgbin
  make
}

package() {
  cd $srcdir/CapAnalysis-$pkgver
  make INSTALL_DIR=$pkgdir/opt/capanalysis install
  mkdir -p $pkgdir/etc/httpd/conf/extra
  cp ../capana.conf $pkgdir/etc/httpd/conf/extra/httpd-capana.conf
  install -Dm644 ../capanalysis.service "${pkgdir}"/usr/lib/systemd/system/capanalysis.service
}

sha256sums=('7765376b2e17188a73972926894c5cff5b2d2a40766e3571d508f4ece5fd0cf1'
            'SKIP'
            '51c31b24f5f4a42cc66a1fa1fec3a520deaaa6e2f728230b28f60665925be16c'
            'd4d35d1198e0b86b35849c253ff051564d2263ee4ed35e62e31309e0082fb678')
