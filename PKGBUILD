# Maintainer: Daniel Albers <daniel@lbe.rs>
# Source: <https://github.com/AlD/archlinux/tree/master/pkgbuilds/pam_krb5>

pkgname=pam_krb5-git
pkgver=2.4.12.r5.g9567cdf
_snapshot="${pkgname%-git}"
pkgrel=1
pkgdesc="Allows PAM-aware applications to authenticate users by performing an AS exchange with a Kerberos KDC."
arch=("i686" "x86_64")
url="https://fedorahosted.org/pam_krb5/"
license=("LGPL")
depends=("pam" "krb5")
makedepends=("gettext" "autoconf")
provides=("pam-krb5" "pam_krb5")
conflicts=("pam-krb5" "pam_krb5")
source=("git://git.fedorahosted.org/${_snapshot}.git")
md5sums=("SKIP")

pkgver() {
  cd "$_snapshot"
  git describe --long --tags | sed -e "s/${_snapshot}-//g" -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

prepare() {
  cd "$_snapshot"
  rm -Rf autom4te.cache/
}

build() {
  cd "$_snapshot"
  autopoint -f
  autoreconf -i -f
  ./configure --prefix=/usr --sysconfdir=/etc --enable-maintainer-mode
  make
}

check() {
  cd "$_snapshot"
  make -k check
}

package() {
  cd "$_snapshot"
  make DESTDIR="$pkgdir/" install
}
