# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Christoph Vigano <mail at cvigano dot de>
pkgname='molly-guard'
pkgver=0.7.2
pkgrel=4
pkgdesc="protects machines from accidental shutdowns/reboots (via ssh)"
arch=('any')
url="https://packages.debian.org/stable/molly-guard"
license=('Artistic2.0')
depends=('openssh' 'run-parts')
optdepends=('inetutils: for the FQDN Hostname support')
install=molly-guard.install
makedepends=('docbook-xsl')
source=("https://mirror.unitedcolo.de/debian/pool/main/m/molly-guard/${pkgname}_${pkgver}.tar.xz")
sha256sums=('02158e4e8a8e4b99b329daa6c8e0ff5071a35819a663da47b1da6628d24beb88')
sha512sums=('4086a7ebc881345dee3120d9a465d5d7f65f5a54d9da9e59b67dc35428d214555f4de0bc08d7cff38e6bc0422aefc3561df1b2230a127973bd2292875fb70fb7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  make clean
  sed -i "s&DB2MAN=/usr/share/sgml/docbook/stylesheet/xsl/nwalsh/manpages/docbook.xsl&DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-`pacman -Q docbook-xsl | awk '{ print $2 }' | awk -F"-" '{ print $1 }'`/manpages/docbook.xsl&" Makefile
  sed -i "s&root.root&root:root&" Makefile
  # /usr/sbin -> /usr/bin
  sed -i 's&sbin&bin&g' Makefile

  sed -i 's&HOSTNAME="$(hostname --short)"&HOSTNAME="$(uname -n)"&' run.d/30-query-hostname
  sed -i 's&egrep&grep -E&' run.d/30-query-hostname

  sed -i 's,\$EXEC "\$CMDARGS",\$CMD "\$CMDARGS",;s,\$EXEC \$CMDARGS,\$CMD \$CMDARGS,' shutdown.in
}

build() {
  cd "$pkgname-$pkgver"

  libdir="/usr/lib"
  bindir="/usr/bin"

  make bindir=$bindir libdir=$libdir
}


package() {
  cd "$pkgname-$pkgver"

  libdir="/usr/lib"
  bindir="/usr/bin"

  make DESTDIR="$pkgdir" bindir=$bindir libdir=$libdir install

  # remove blank lines and leading whitespace
  # couldnt get this to work
  # https://github.com/docbook/xslt10-stylesheets/issues/123
  for filename in $(find "$pkgdir"/usr/share/man -type f -name "*.8"); do
    sed -i '/^$/d' "$filename"
    sed -i -e 's/^[ \t]*//' "$filename"
  done

  # replace occurences of pkgdir in scripts
  for filename in $(find "$pkgdir"/usr -type f); do
    sed -i "s&$pkgdir&&g" "$filename"
  done

  mkdir -p $pkgdir/etc/profile.d
  for commandname in halt poweroff reboot shutdown; do
    ln -s "$libdir/$pkgname/molly-guard" "$pkgdir$libdir/$pkgname/$commandname"
    echo "alias $commandname=\"$libdir/$pkgname/$commandname\"" >> "$pkgdir/etc/profile.d/molly-guard.sh"
  done

  rm -rf "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
