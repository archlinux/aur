# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_pkgname=realmd
pkgname=$_pkgname-git
pkgver=0.16.3.r35.g517fa76
pkgrel=3
pkgdesc="DBus service for joining hosts to Active Directory and FreeIPA realms (Git)"
arch=(i686 x86_64)
url="https://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(adcli dbus krb5 openldap packagekit polkit)
optdepends=('sssd: Active Directory, FreeIPA, LDAP client'
            'samba: traditional Active Directory client')
makedepends=(docbook-xsl git intltool python xmlto)
source=("git+https://gitlab.freedesktop.org/realmd/realmd.git"
	computer-ou.patch
	duplicate-test-path.patch
	install-diagnostic.patch)
sha256sums=('SKIP'
            '5e43d034348bdf3cb3f06ebd56d811b3427e43f9220fee9a104f50d3972cb5cd'
            'a659dfcf8e4f91123832ae89b9ac92bbcc9ea8d90a698533ca25dff9ec610d90'
            'e49fc613594d4fb540f0a562778e2fd45711548cbe3dc9769f5aa0773de16319')
validpgpkeys=('C0F67099B808FB063E2C81117BFB1108D92765AF')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  AUTOMAKE=automake ACLOCAL=aclocal NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$_pkgname"
  AUTOMAKE=automake ACLOCAL=aclocal ./configure \
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
