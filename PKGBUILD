# Maintainer: envolution
# Contributor: Christian Heusel <christian@heusel.eu>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Christoph Vigano <mail at cvigano dot de>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname='molly-guard'
pkgver=0.8.5
pkgrel=1
pkgdesc="protects machines from accidental shutdowns/reboots (via ssh)"
arch=('any')
url="https://packages.debian.org/stable/molly-guard"
license=('Artistic-2.0')
depends=('openssh' 'run-parts')
optdepends=('inetutils: for the FQDN Hostname support')
install=molly-guard.install
makedepends=('docbook-xsl')
source=(
  "https://mirror.unitedcolo.de/debian/pool/main/m/molly-guard/${pkgname}_${pkgver}.tar.xz"
  arch-modifications.patch
  )
sha512sums=('1e3231930e12f4727acefac737632052dbf018bb574803527ea745daec7723f42fec911b0352da23a87202c8c1a4401d238f304f9849a1e647de9b06ac064150'
            '7bf489623cbe7d6d59efbe070d40d1ad09d34b19bbf49312a0db4e266c38456a67be07e7bfee5cb392ee6985fd89422ae51e2090f57dd4573d79b93cc1757d31')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../arch-modifications.patch

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

  install -d "$pkgdir/etc/profile.d" "$pkgdir$libdir/$pkgname"
  for cmd in halt poweroff reboot shutdown coldreboot; do
    # wrapper symlink (points to molly-guard script/binary)
    ln -s "molly-guard" "$pkgdir$libdir/$pkgname/$cmd"
    # "no-molly-guard" symlink points to the real system command
    ln -s "/usr/bin/$cmd" "$pkgdir$libdir/$pkgname/$cmd.no-molly-guard"
  done

  # profile script: set aliases
  cat >"$pkgdir/etc/profile.d/molly-guard.sh" <<EOF
# molly-guard: wrap shutdown-related commands
for cmd in halt poweroff reboot shutdown coldreboot; do
  alias \$cmd="$libdir/$pkgname/\$cmd"
done
EOF
  rm -rf $pkgdir/usr/bin

}
# vim:set ts=2 sw=2 et:
