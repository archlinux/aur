# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Christoph Vigano <mail at cvigano dot de>
pkgname='molly-guard'
pkgver=0.7.2
pkgrel=2
pkgdesc="protects machines from accidental shutdowns/reboots (via ssh)"
arch=('any')
url="http://packages.debian.org/source/sid/molly-guard" # Didn't find anything else
license=('Artistic2.0')
depends=('openssh' 'run-parts')
makedepends=('docbook-xsl')
source=("http://mirror.unitedcolo.de/debian/pool/main/m/molly-guard/${pkgname}_${pkgver}.tar.xz")
sha256sums=('02158e4e8a8e4b99b329daa6c8e0ff5071a35819a663da47b1da6628d24beb88')
sha512sums=('4086a7ebc881345dee3120d9a465d5d7f65f5a54d9da9e59b67dc35428d214555f4de0bc08d7cff38e6bc0422aefc3561df1b2230a127973bd2292875fb70fb7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make clean
  sed -i "s&DB2MAN=/usr/share/sgml/docbook/stylesheet/xsl/nwalsh/manpages/docbook.xsl&DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-`pacman -Q docbook-xsl | awk '{ print $2 }' | awk -F"-" '{ print $1 }'`/manpages/docbook.xsl&" Makefile
  sed -i "s&root.root&root:root&" Makefile
  sed -i 's&HOSTNAME="$(hostname --short)"&HOSTNAME="$(uname -n)"&' run.d/30-query-hostname
  sed -i 's&HOSTNAME="$(hostname --short)"&HOSTNAME="$(uname -n)"&' run.d/30-query-hostname

  # /usr/sbin -> /usr/bin
  sed -i 's&sbin&bin&g' Makefile
}


package() {
  cd "$srcdir/$pkgname-$pkgver"

  libdir="/usr/local/lib"
  make DESTDIR="$pkgdir" bindir="/usr/local/sbin" libdir=$libdir install

  # replace occurences of pkgdir in scripts
  for filename in $(find "$pkgdir"/usr -type f); do
    sed -i "s&$pkgdir&&g" $filename
  done

  for filename in halt poweroff reboot shutdown; do
    ln -s /sbin/${filename} $pkgdir$libdir/molly-guard/${filename}
  done
}

# vim:set ts=2 sw=2 et:
