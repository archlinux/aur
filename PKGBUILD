# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor : ianux <ianux@free.fr>

pkgname=bluez-ps3
_gitname=bluez
pkgver=5.43
pkgrel=1
pkgdesc="Daemons for the bluetooth protocol stack. Patched to support PS3 controllers, including Gasia/Shanwan clones"
url="https://github.com/luetzel/bluez"
arch=('i686' 'x86_64')
license=('GPL2')
provides=('bluez' 'bluez-plugins')
makedepends=('dbus' 'libical' 'systemd')
depends=('libical' 'dbus' 'glib2')
backup=('etc/dbus-1/system.d/bluetooth.conf'
        'etc/bluetooth/main.conf')
conflicts=('bluez' 'bluez-plugins' 'obexd-client' 'obexd-server')
source=('git+https://github.com/luetzel/bluez'
        'bluetooth.modprobe')
sha256sums=('SKIP'
            '46c021be659c9a1c4e55afd04df0c059af1f3d98a96338236412e449bf7477b4')

#pkgver() {
#  cd ${srcdir}/${_gitname}
#  echo "$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
#}

build() {
  cd ${srcdir}/${_gitname}
  ./configure \
          --prefix=/usr \
          --mandir=/usr/share/man \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --libexecdir=/usr/lib \
          --enable-sixaxis \
          --enable-experimental
  make
}

check() {
  cd ${srcdir}/${_gitname}
  make check
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} \
       install-libexecPROGRAMS \
       install-dbussessionbusDATA \
       install-systemdsystemunitDATA \
       install-systemduserunitDATA \
       install-dbussystembusDATA \
       install-dbusDATA \
       install-pluginLTLIBRARIES \
       install-man8

  # ship upstream main config file
  install -dm755 ${pkgdir}/etc/bluetooth
  install -Dm644 ${srcdir}/${_gitname}/src/main.conf ${pkgdir}/etc/bluetooth/main.conf

  # add basic documention
  install -dm755 ${pkgdir}/usr/share/doc/${pkgbase}/dbus-apis
  cp -a doc/*.txt ${pkgdir}/usr/share/doc/${pkgbase}/dbus-apis/
  # fix module loading errors
  install -dm755 ${pkgdir}/usr/lib/modprobe.d
  install -Dm644 ${srcdir}/bluetooth.modprobe ${pkgdir}/usr/lib/modprobe.d/bluetooth-usb.conf	
  
  # fix obex file transfer - https://bugs.archlinux.org/task/45816
  ln -fs /usr/lib/systemd/user/obex.service ${pkgdir}/usr/lib/systemd/user/dbus-org.bluez.obex.service
}
