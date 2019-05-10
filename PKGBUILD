# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=ganglia-minimal
_pkgbase=${pkgname%%-minimal}
pkgver=3.7.2
pkgrel=3
pkgdesc="A version of the ganglia package without gmetad to reduce dependencies."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://ganglia.sourceforge.net/"
license=('BSD')
depends=('apr' 'confuse' 'python2' 'pcre')
conflicts=('ganglia')
options=('!libtool')
install='ganglia.install'
backup=('etc/ganglia/gmond.conf')
source=("http://downloads.sourceforge.net/$_pkgbase/$_pkgbase-$pkgver.tar.gz"
        'ganglia.install'
        'ganglia.sysusers'
        'uid.patch'
        'runstatedir.patch')
sha256sums=('042dbcaf580a661b55ae4d9f9b3566230b2232169a0898e91a797a4c61888409'
            '8fc88d5c6d294315cbb7eca104af115514dd89afb2bcb8cc4e462ebc0db128e2'
            'e0a14ba384d8e3685461241811cea18e5251ab5d84fd68471972540bcc542c4c'
            'dc2cdffaf0cbedbbac2e654843803423f93da494aaeecda8a185ad3badea8e21'
            'e3abe8017bf3d974e2b4ba5e285e7a91e94dbb69ec6fdf128675a8868e28c8a4')

prepare() {
  cd "$srcdir/$_pkgbase-$pkgver"

  for patch in $srcdir/*.patch; do
    msg2 "Applying $(basename $patch)"
    patch -Np1 -i $patch
  done
}

build() {
  cd "$srcdir/$_pkgbase-$pkgver"

  # Required to work around Sun RPC (ONC/RPC) library errors
  LDFLAGS=-ltirpc \
  CFLAGS=-I/usr/include/tirpc \
    ./configure --prefix=/usr \
                --sbindir=/usr/bin \
                --libdir=/usr/lib \
                --sysconfdir=/etc/ganglia \
                --enable-gexec \
                --enable-status \
                --with-python=/usr/bin/python2 \
                --with-systemdsystemunitdir=/usr/lib/systemd/system

  make
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"

  make DESTDIR="$pkgdir" install

  # Install Python modules
  mkdir -p "$pkgdir/usr/lib/$_pkgbase/python_modules"
  find "gmond/python_modules" -name *.py \
       -exec cp \{\} "$pkgdir/usr/lib/$_pkgbase/python_modules/" \;
  cp -R "gmond/python_modules/conf.d" "$pkgdir/etc/$_pkgbase/"

  msg2 "Generating default gmond.conf"
  ./gmond/gmond --default_config > "$pkgdir/etc/$_pkgbase/gmond.conf"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"

  # See man page for sysusers.d(5)
  install -Dm644 "$srcdir"/ganglia.sysusers \
                 "$pkgdir"/usr/lib/sysusers.d/ganglia.conf
}
