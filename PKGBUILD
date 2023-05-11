# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: David Thurstenson <thurstylark@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>

pkgname='bluez-utils-compat'
_pkgbase='bluez'
pkgver=5.66
pkgrel=2
url="http://www.bluez.org/"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
license=('GPL2')
pkgdesc="Development and debugging utilities for the bluetooth protocol stack. Includes deprecated tools."
depends=('dbus' 'systemd' 'glib2')
makedepends=('dbus' 'libical' 'systemd' 'alsa-lib' 'json-c' 'ell' 'python-docutils')
optdepends=('ell: for btpclient')
conflicts=('bluez-hcidump' 'bluez-utils' 'bluez-hcitool' 'bluez-rfcomm')
provides=('bluez-hcidump' "bluez-utils=${pkgver}" 'bluez-hcitool' 'bluez-rfcomm')
backup=('etc/bluetooth/mesh-main.conf')
source=(https://www.kernel.org/pub/linux/bluetooth/"${_pkgbase}-${pkgver}".tar.xz) #{xz,sign})
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha256sums=('39fea64b590c9492984a0c27a89fc203e1cdc74866086efb8f4698677ab2b574')
#validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

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
          --enable-hid2hci \
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
       install-dist_zshcompletionDATA \
       install-man1

  # add missing tools FS#41132, FS#41687, FS#42716
  for _dir in tools attrib ; do 
    for _files in $( find "$_dir"/ -type f -perm -755 ); do
      _filename="$( basename "${_files}" )"
      install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}/${_dir}/${_filename}" "${pkgdir}/usr/bin/${_filename}"
    done
  done

  rm -rf "${pkgdir}"/usr/lib

  # ship upstream mesh config file
  install -dm555 "${pkgdir}"/etc/bluetooth
  install -Dm644 "${srcdir}/${_pkgbase}-${pkgver}"/mesh/mesh-main.conf "${pkgdir}"/etc/bluetooth/mesh-main.conf
  
  # move the hid2hci man page out
  rm "${pkgdir}"/usr/share/man/man1/hid2hci.1
}
