# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Christoph Vigano <mail at cvigano dot de>
pkgname='molly-guard'
pkgver=0.7.2
pkgrel=1
pkgdesc="protects machines from accidental shutdowns/reboots (via ssh)"
arch=('any')
url="http://packages.debian.org/source/sid/molly-guard" # Didn't find anything else
license=('Artistic2.0')
depends=('openssh' 'run-parts')
makedepends=('docbook-xsl')
source=("http://mirror.unitedcolo.de/debian/pool/main/m/molly-guard/${pkgname}_${pkgver}.tar.xz"
        'molly-guard.sh')
sha256sums=('02158e4e8a8e4b99b329daa6c8e0ff5071a35819a663da47b1da6628d24beb88'
            '272ea125b2b9d0a399834fa8337dfde9887d54ab9e671a6f363244863a415f62')
sha512sums=('4086a7ebc881345dee3120d9a465d5d7f65f5a54d9da9e59b67dc35428d214555f4de0bc08d7cff38e6bc0422aefc3561df1b2230a127973bd2292875fb70fb7'
            'c3d5beacdb719e3481ac1bfee4871e7e325478a701c2b022fd687ce4911bbb78fdbbaca07878269873756644e64313275cf6220463d36fdf07db8d715f3341d9')

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
