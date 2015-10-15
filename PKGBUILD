# Maintainer: Moritz Kaspar Rudert (mortzu) <me@mortzu.de>
pkgname='molly-guard'
pkgver=0.6.2
pkgrel=1
pkgdesc="protects machines from accidental shutdowns/reboots (via ssh)"
arch=('any')
url="http://packages.debian.org/source/sid/molly-guard" # Didn't find anything else
license=('Artistic2.0')
depends=('openssh' 'run-parts')
makedepends=('docbook-xsl')
source=("http://http.debian.net/debian/pool/main/m/$pkgname/${pkgname}_${pkgver}.tar.xz"
        'molly-guard.sh')
md5sums=('ab3dcd91c9560acc8864b0ff4549079b'
         'd3d171f182d45e59591dee11c911a710')

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

  make DESTDIR="$pkgdir" bindir="/usr/bin" libdir="/usr/lib" install

  # replace occurences of pkgdir in scripts
  for filename in $(find "$pkgdir"/usr -type f); do
    sed -i "s&$pkgdir&&g" $filename
  done

  for filename in halt poweroff reboot shutdown; do
    ln -s /usr/lib/molly-guard/molly-guard $pkgdir/usr/lib/molly-guard/${filename}
  done

  install -Dm755 "$srcdir/molly-guard.sh" "$pkgdir/etc/profile.d/molly-guard.sh"

  rm -rf "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
