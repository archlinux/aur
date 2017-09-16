# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=realmd-git
_pkgname=realmd
pkgver=0.15.1.r2.g40f9583
pkgrel=3
pkgdesc="DBus service for joining hosts to Active Directory and FreeIPA realms"
arch=(i686 x86_64)
url="http://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(adcli dbus krb5 openldap packagekit polkit)
makedepends=(docbook-xsl intltool xmlto)
checkdepends=(python2)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://anongit.freedesktop.org/realmd/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe | sed 's/-/.r/; s/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed -i '1s/\<python\>/&2/' build/tap-*
}

build() {
  cd "$_pkgname"
  NOCONFIGURE=1 ./autogen.sh
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
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
