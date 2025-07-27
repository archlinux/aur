# Maintainer: storbake
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=realmd
pkgver=0.17.1
pkgrel=2
pkgdesc="DBus service for joining hosts to Active Directory and FreeIPA realms"
arch=(i686 x86_64)
url="https://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(adcli dbus krb5 openldap packagekit polkit)
optdepends=('sssd: Active Directory, FreeIPA, LDAP client'
            'samba: traditional Active Directory client')
makedepends=(docbook-xsl git glib2-devel intltool python xmlto)
install=realmd.install
source=("https://gitlab.freedesktop.org/realmd/realmd/-/archive/${pkgver}/realmd-${pkgver}.tar.gz" "realmd-arch-helper.sh")
sha256sums=('e8b51d5918418e9dc55006f0371831ab841f00a065baf2d001b6b5245f24a532' 'f73b6bf3edaa850c490f4c85353ecb56c836cd5a13f7ce11ae5921fbe568b7e4')

build() {
  cd "$pkgname-$pkgver"
  AUTOMAKE=automake ACLOCAL=aclocal ./autogen.sh \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --localstatedir=/var    \
    --with-distro=defaults  ;
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" DBUS_POLICY_DIR="/usr/share/dbus-1/system.d" install
  install -Dm755 "$srcdir/realmd-arch-helper.sh" "$pkgdir/usr/lib/realmd/realmd-arch-helper.sh"
}

# vim: ts=2:sw=2:et
