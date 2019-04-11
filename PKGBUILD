# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=realmd-git
_pkgname=realmd
pkgver=0.16.3.r26.gb6753bd
pkgrel=1
pkgdesc="DBus service for joining hosts to Active Directory and FreeIPA realms"
arch=(i686 x86_64)
url="https://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(adcli dbus krb5 openldap packagekit polkit)
makedepends=(docbook-xsl git intltool python xmlto)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://gitlab.freedesktop.org/realmd/realmd.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe | sed 's/-/.r/; s/-/./g'
}

prepare() {
  cd "$_pkgname"
  AUTOMAKE=automake ACLOCAL=aclocal NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$_pkgname"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --localstatedir=/var    \
    --with-distro=defaults  ;
  make
}

check() {
  cd "$_pkgname"
  make check
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" DBUS_POLICY_DIR="/usr/share/dbus-1/system.d" install
}

# vim: ts=2:sw=2:et
