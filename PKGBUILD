# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=ganglia
pkgver=3.7.2
pkgrel=4
pkgdesc="A scalable distributed monitoring system for high-performance computing systems such as clusters and Grids."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://${pkgname}.sourceforge.net/"
license=('BSD')
depends=('apr' 'confuse' 'protobuf-c' 'python2' 'rrdtool')
options=('!libtool')
optdepends=('ganglia-web: Web frontend')
install='ganglia.install'
backup=('etc/ganglia/gmond.conf'
        'etc/ganglia/gmetad.conf')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        'riemann.proto::https://raw.githubusercontent.com/aphyr/riemann-java-client/2.5.0/src/main/proto/riemann/proto.proto'
        'ganglia.install'
        'ganglia.sysusers'
        'uid.patch'
        'runstatedir.patch')
sha256sums=('042dbcaf580a661b55ae4d9f9b3566230b2232169a0898e91a797a4c61888409'
            '880a28fa0ed5b485bce58109fa694eca458693d69b7c297cdd77a1340f476c00'
            '79df856f3b0623e736ea9c1f5c36c321769d6f161c85faf31fab3d7b872d6725'
            '34506cdaab1a6250c9a0d6d9fb9c6a0a0dfe1187bcb0a5d6ca71491007116d05'
            'dc2cdffaf0cbedbbac2e654843803423f93da494aaeecda8a185ad3badea8e21'
            'e3abe8017bf3d974e2b4ba5e285e7a91e94dbb69ec6fdf128675a8868e28c8a4')

prepare() {
  cd "$srcdir"
  protoc-c --c_out="$pkgname-$pkgver/gmetad" riemann.proto

  cd "$pkgname-$pkgver"
  for patch in $srcdir/*.patch; do
    msg2 "Applying $(basename $patch)"
    patch -Np1 -i $patch
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Required to work around Sun RPC (ONC/RPC) library errors
  LDFLAGS=-ltirpc \
  CFLAGS=-I/usr/include/tirpc \
    ./configure --prefix=/usr \
                --sbindir=/usr/bin \
                --libdir=/usr/lib \
                --sysconfdir=/etc/ganglia \
                --enable-gexec \
                --enable-status \
                --with-gmetad \
                --with-riemann \
                --with-python=/usr/bin/python2 \
                --with-systemdsystemunitdir=/usr/lib/systemd/system

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # Install Python modules
  mkdir -p "$pkgdir/usr/lib/$pkgname/python_modules"
  find "gmond/python_modules" -name *.py \
       -exec cp \{\} "$pkgdir/usr/lib/$pkgname/python_modules/" \;
  cp -R "gmond/python_modules/conf.d" "$pkgdir/etc/$pkgname/"

  msg2 "Generating default gmond.conf"
  ./gmond/gmond --default_config > "$pkgdir/etc/$pkgname/gmond.conf"

  install -Dm755 -d      "$pkgdir/var/lib/ganglia/rrds"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"

  # See man page for sysusers.d(5)
  install -Dm644 "$srcdir"/ganglia.sysusers \
                 "$pkgdir"/usr/lib/sysusers.d/ganglia.conf
}
