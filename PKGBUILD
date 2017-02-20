# $Id$
# Upstream Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Stefan Mark (nullmark) <mark at unserver dot de>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_base_pkgname=colord
pkgname=${_base_pkgname}-nopolkit
pkgver=1.3.4
pkgrel=1
pkgdesc="System daemon for managing color devices, without polkit, logind and bach-completion dependancy."
arch=(i686 x86_64)
url="https://www.freedesktop.org/software/colord"
license=(GPL2)
depends=(lcms2 libgusb sqlite systemd dconf dbus libgudev)
makedepends=(intltool gobject-introspection argyllcms gnome-common git
             docbook-utils docbook-sgml perl-sgmls)
             # vala sane bash-completion
optdepends=('sane: scanner support'
            'argyllcms: color profiling')
replaces=(shared-color-profiles)
conflicts=(polkit)
provides=(colord)
install=colord.install
_commit=b4329ab9e5dfe87ac46db9df82bc014d658ee26a  # tags/1.3.4^0
source=("git+https://github.com/hughsie/colord#commit=$_commit")
sha1sums=('SKIP')
validpgpkeys=('163EB50119225DB3DF8F49EA17ACBA8DFA970E17')

pkgver() {
  cd ${_base_pkgname}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  # Fixup docbook-utils/perl-sgmls, for now...
  mkdir path
  ln -s /usr/bin/vendor_perl/sgmlspl.pl path/sgmlspl

  cd ${_base_pkgname}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${_base_pkgname}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/${_base_pkgname} \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-daemon-user=colord \
    --enable-print-profiles \
    --enable-libcolordcompat \
    --disable-static \
    --disable-polkit \
    --disable-bash-completion \
    --disable-systemd-login
    #--enable-vala \
    #--enable-sane \

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  PATH="$srcdir/path:$PATH" make
}

package() {
  cd ${_base_pkgname}
  make DESTDIR="$pkgdir" install

  # the build system has no colord user, so the chown fails
  chown -R 124:124 "$pkgdir/var/lib/colord"
}

# vim:set ts=2 sw=2 et:
