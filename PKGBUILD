# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname='molly-guard'
pkgver=0.7.1
pkgrel=1
pkgdesc="protects machines from accidental shutdowns/reboots (via ssh)"
arch=('any')
url="http://packages.debian.org/source/sid/molly-guard" # Didn't find anything else
license=('Artistic2.0')
depends=('openssh' 'run-parts')
makedepends=('docbook-xsl')
source=("http://mirror.unitedcolo.de/debian/pool/main/m/molly-guard/${pkgname}_${pkgver}.tar.xz"
        'molly-guard.sh')
sha256sums=('ad43869a5c85437b92d827fc2b0f58a6a66c37eb139cca74d71c3dee3837621b'
            '272ea125b2b9d0a399834fa8337dfde9887d54ab9e671a6f363244863a415f62')

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
sha512sums=('cace8ca9d07792bee5e61586eecf56f53a8b5a221e57f5322d1f71c989106fed24c83aadbe9b0495bfa034d5ef17ea9efe5666b53e14f584e8bc777b3589e860'
            'c3d5beacdb719e3481ac1bfee4871e7e325478a701c2b022fd687ce4911bbb78fdbbaca07878269873756644e64313275cf6220463d36fdf07db8d715f3341d9')
