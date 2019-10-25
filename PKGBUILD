# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=realmd
pkgver=0.16.3.r29.g81b5e34
pkgrel=1
pkgdesc="DBus service for joining hosts to Active Directory and FreeIPA realms"
arch=(i686 x86_64)
url="https://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(adcli dbus krb5 openldap packagekit polkit)
optdepends=('sssd: Active Directory, FreeIPA, LDAP client'
            'samba: traditional Active Directory client')
makedepends=(docbook-xsl git intltool python xmlto)
#source=("https://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz"
#        "https://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz.sig")
_commit=81b5e3478269ea47d66ddb98f7cbebd06fe950e6
source=("git+https://gitlab.freedesktop.org/realmd/realmd.git#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('C0F67099B808FB063E2C81117BFB1108D92765AF')

pkgver() {
  cd "$pkgname"
  git describe | sed 's/-/.r/; s/-/./g'
}

prepare() {
  cd "$pkgname"
  AUTOMAKE=automake ACLOCAL=aclocal NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --localstatedir=/var    \
    --with-distro=defaults  ;
  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" DBUS_POLICY_DIR="/usr/share/dbus-1/system.d" install
}

# vim: ts=2:sw=2:et
