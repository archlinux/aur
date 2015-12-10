# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Maintainer: CRT <cirkit@kode.email>

pkgname=ntopng
pkgver=2.2
pkgrel=1
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL3')
options=('!makeflags')
depends=('redis' 'libxml2' 'geoip' 'libpcap' 'libnet' 'lua' 'zeromq' 'gd'
         'gdbm' 'pcre' 'rrdtool' 'psutils')
source=("http://sourceforge.net/projects/ntop/files/$pkgname/$pkgname-$pkgver.tar.gz"
        ntopng@.service)

md5sums=('c4144be7ff306ebfea1c4368aca066c4'
         'ca5208df1d80a8b28606d6a64e508902')	

build() {
  cd "$srcdir/ntopng-$pkgver"
  ./autogen.sh && ./configure --prefix=/usr
  make geoip
  make
}

package() {
  cd "$srcdir/ntopng-$pkgver"

  # Base directories.
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/ntopng"
  install -dm755 "$pkgdir/usr/share/man/man8"
  install -dm755 "$pkgdir/usr/lib/systemd/system"

  # Bin.
  install -m755 ntopng "$pkgdir/usr/share/ntopng"

  # Man
  install -m755 ntopng.8 "$pkgdir/usr/share/man/man8"

  # Docs.
  cp --no-preserve=ownership -R httpdocs scripts "$pkgdir/usr/share/ntopng"

  # Systemd service.
  install -m644 "$srcdir/ntopng@.service" "$pkgdir/usr/lib/systemd/system"

  cat > "$pkgdir/usr/bin/ntopng" <<EOF
#!/bin/sh
cd /usr/share/ntopng
./ntopng "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/ntopng" 
}
