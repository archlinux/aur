# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: David Thurstenson <thurstylark@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>

pkgname='bluez-utils-compat'
_pkgbase='bluez'
pkgver=5.51
pkgrel=1
url="http://www.bluez.org/"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
license=('GPL2')
pkgdesc="Development and debugging utilities for the bluetooth protocol stack. Includes deprecated tools."
depends=('dbus' 'systemd' 'glib2')
makedepends=('libical' 'alsa-lib' 'ell')
optdepends=('ell: for btpclient')
conflicts=('bluez-hcidump' 'bluez-utils' 'bluez-hcitool')
provides=('bluez-hcidump' 'bluez-utils' 'bluez-hcitool')
replaces=('bluez-hcidump' 'bluez<=4.101')
makedepends=('dbus' 'libical' 'systemd' 'alsa-lib' 'ell')
source=(https://www.kernel.org/pub/linux/bluetooth/"${_pkgbase}-${pkgver}".tar.{xz,sign}
        'refresh_adv_manager_for_non-LE_devices.diff::https://git.archlinux.org/svntogit/packages.git/plain/trunk/refresh_adv_manager_for_non-LE_devices.diff?h=packages/bluez')
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha512sums=('8b14eea98f541b981162abce728e0f917654ad3c990721ec398fe41bdd68069fe55ff64b61bc3c3b9f813facf42c995b07619f6d5d153965de27154b1a7b578f'
            'SKIP'
            'c6ef673956963725edc52d667648e51df5b99f820e87705096b4b9338e8a4540722e734f1e8e67998c2fbbefec30645ff1fa064789c8a858f770d1214399561d')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

prepare() {
  cd "${_pkgbase}-${pkgver}"
  patch -Np1 -i ../refresh_adv_manager_for_non-LE_devices.diff
}

build() {
  cd "${_pkgbase}-${pkgver}"
  ./configure \
          --prefix=/usr \
          --mandir=/usr/share/man \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --libexecdir=/usr/lib \
          --with-dbusconfdir=/usr/share \
          --enable-btpclient \
          --enable-midi \
          --enable-sixaxis \
          --enable-mesh \
          --enable-experimental \
          --enable-library \
          --enable-deprecated # to enable deprectated tools
  make
}

check() {
  cd "${_pkgbase}-${pkgver}"
  # tests segfault and hang
#  make check || /bin/true # https://bugzilla.kernel.org/show_bug.cgi?id=196621
}

package() {
  cd "${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" \
       install-binPROGRAMS \
       install-man1

  # add missing tools FS#41132, FS#41687, FS#42716
  for files in `find tools/ -type f -perm -755`; do
    filename="$(basename "$files")"
    install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}"/tools/$filename "${pkgdir}"/usr/bin/$filename
  done

  # libbluetooth.so* are part of libLTLIBRARIES and binPROGRAMS targets
  #make DESTDIR=${pkgdir} uninstall-libLTLIBRARIES
  #rmdir ${pkgdir}/usr/lib
  rm -rf "${pkgdir}"/usr/lib
  
  # move the hid2hci man page out
  mv "${pkgdir}"/usr/share/man/man1/hid2hci.1 "${srcdir}"/
}
