# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=ganglia
pkgver=3.7.1
pkgrel=3
pkgdesc="A scalable distributed monitoring system for high-performance computing systems such as clusters and Grids."
arch=('i686' 'x86_64' 'armv6h')
url="http://${pkgname}.sourceforge.net/"
license=('BSD')
depends=('apr' 'confuse' 'python2' 'rrdtool')
options=('!libtool')
optdepends=('ganglia-web: Web frontend')
install='ganglia.install'
backup=('etc/ganglia/gmond.conf'
        'etc/ganglia/gmetad.conf')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        'ganglia.install'
        'ganglia.sysusers'
        'uid.patch'
        'runstatedir.patch')
sha256sums=('e735a6218986a0ff77c737e5888426b103196c12dc2d679494ca9a4269ca69a3'
            '79df856f3b0623e736ea9c1f5c36c321769d6f161c85faf31fab3d7b872d6725'
            '34506cdaab1a6250c9a0d6d9fb9c6a0a0dfe1187bcb0a5d6ca71491007116d05'
            'dc2cdffaf0cbedbbac2e654843803423f93da494aaeecda8a185ad3badea8e21'
            'e3abe8017bf3d974e2b4ba5e285e7a91e94dbb69ec6fdf128675a8868e28c8a4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  for patch in $srcdir/*.patch; do
    msg2 "Applying $(basename $patch)"
    patch -Np1 -i $patch
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libdir=/usr/lib \
              --sysconfdir=/etc/ganglia \
              --enable-gexec \
              --enable-status \
              --with-gmetad \
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

  install -Dm755 -d /var/lib/ganglia{,/rrds}
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"

  # See man page for sysusers.d(5)
  install -Dm644 "$srcdir"/ganglia.sysusers \
                 "$pkgdir"/usr/lib/sysusers.d/ganglia.conf
}
