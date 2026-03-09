# Maintainer: Viaken <viaken@gmail.com>
# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
pkgname=passwdqc-utils
realpkgname=passwdqc
pkgver=2.1.0
pkgrel=1
pkgdesc="pwqcheck (password strength checker) and pwqgen (random passphrase generator) from passwdqc"
arch=('any')
url="http://www.openwall.com/passwdqc/"
license=('BSD' 'custom:BSD Revised')
optdepends=('pam_passwdqc: Enforce password strength rules')
source=(http://www.openwall.com/passwdqc/$realpkgname-$pkgver.tar.gz)
md5sums=('8f89ff67b1eb8d41ea566a505f234765')

pkgver() {
  curl -sL https://openwall.com/passwdqc/ | grep -o '<a href="passwdqc-.*\.tar\.gz">.*</a>' | sed -n 's/.*>\(.*\)<.*/\1/p' |
    grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+'
}

build() {
  cd "$srcdir/$realpkgname-$pkgver"

  sed "s#@VERSION@#${pkgver}#" $realpkgname.pc.in >$realpkgname.pc
  make -j1 utils
}

package() {
  cd "$srcdir/$realpkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/$realpkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

  make SHARED_LIBDIR="/usr/lib" DESTDIR="$pkgdir/" install_lib install_utils
}

# vim:set ts=2 sw=2 et:
