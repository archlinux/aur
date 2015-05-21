# Maintainer: Christoph Vigano <mail at cvigano dot de>
pkgname='molly-guard'
pkgver='0.5.1'
pkgrel=2
pkgdesc="protects machines from accidental shutdowns/reboots (via ssh)"
arch=('any')
url="http://packages.debian.org/source/sid/molly-guard" # Didn't find anything else
license=('Artistic2.0')
depends=('openssh' 'run-parts')
conflicts=('systemd-sysvcompat')
makedepends=('docbook-xsl')
source=("http://ftp.de.debian.org/debian/pool/main/m/$pkgname/${pkgname}_${pkgver}.orig.tar.gz" 'molly-guard.sh')
md5sums=('891b8b2762cb658140214acd2e54dc9b'
         '836d0faee390abafc18257f987bb9c60')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make clean
  sed -i "s&DB2MAN=/usr/share/sgml/docbook/stylesheet/xsl/nwalsh/manpages/docbook.xsl&DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-`pacman -Q docbook-xsl | awk '{ print $2 }' | awk -F"-" '{ print $1 }'`/manpages/docbook.xsl&" Makefile
  sed -i 's&HOSTNAME="$(hostname --short)"&HOSTNAME="$(uname -n)"&' run.d/30-query-hostname

  # /usr/sbin -> /usr/bin
  sed -i 's&sbin&bin&g' Makefile
}


package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DEST="$pkgdir" etc_prefix="" prefix="/usr" install

  # replace occurences of pkgdir in scripts
  for filename in $(find "$pkgdir"/usr -type f); do
    sed -i "s&$pkgdir&&g" $filename
  done

  install -Dm755 "$srcdir/molly-guard.sh" "$pkgdir/etc/profile.d/molly-guard.sh"

  rm -rf "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
