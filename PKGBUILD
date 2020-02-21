# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: David Thurstenson <thurstylark@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>

pkgname='bluez-utils-compat'
_pkgbase='bluez'
pkgver=5.53
pkgrel=1
url="http://www.bluez.org/"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
license=('GPL2')
pkgdesc="Development and debugging utilities for the bluetooth protocol stack. Includes deprecated tools."
depends=('dbus' 'systemd' 'glib2')
makedepends=('dbus' 'libical' 'systemd' 'alsa-lib' 'ell')
optdepends=('ell: for btpclient')
conflicts=('bluez-hcidump' 'bluez-utils' 'bluez-hcitool')
provides=('bluez-hcidump' "bluez-utils=${pkgver}" 'bluez-hcitool')
source=(https://www.kernel.org/pub/linux/bluetooth/"${_pkgbase}-${pkgver}".tar.{xz,sign}
        'refresh_adv_manager_for_non-LE_devices.diff::https://git.archlinux.org/svntogit/packages.git/plain/trunk/refresh_adv_manager_for_non-LE_devices.diff?h=packages/bluez')
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha512sums=('62956e6293ec2517ec453dc7a6c82d34a8c446df8add8fe411b0a45fd5604817f3a19fbc646ad6f68df435f3cd2bd10ae040890e30db83b022f90b54cc6b3c74'
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
  for _dir in tools attrib ; do 
    for _files in $( find "$_dir"/ -type f -perm -755 ); do
      _filename="$( basename "${_files}" )"
      install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}/${_dir}/${_filename}" "${pkgdir}/usr/bin/${_filename}"
    done
  done

  # libbluetooth.so* are part of libLTLIBRARIES and binPROGRAMS targets
  #make DESTDIR=${pkgdir} uninstall-libLTLIBRARIES
  #rmdir ${pkgdir}/usr/lib
  rm -rf "${pkgdir}"/usr/lib
  
  # move the hid2hci man page out
  rm "${pkgdir}"/usr/share/man/man1/hid2hci.1
}
