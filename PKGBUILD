# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on hplip from [extra]

pkgname=hplip-minimal
pkgver=3.19.6
pkgrel=1
pkgdesc="The HP printer drivers, and not much else"
arch=('i686' 'x86_64' 'armv6h')
url="https://hplipopensource.com"
license=('GPL')
depends=('ghostscript>=8.64-6')
makedepends=('cups' 'libusb')
optdepends=(
  'cups: for printing support'
  'libusb: for advanced usb support'
)
conflicts=('hplip')
options=('!docs')
source=("https://downloads.sourceforge.net/hplip/hplip-${pkgver}.tar.gz")
md5sums=('2796dd80255e4f583e253cebe3959765')
sha256sums=('fcdaedee9ed17d2e70f3aff9558a452d99443d1b93d6623132faf3f3ae61d66d')

prepare() {
  cd "hplip-${pkgver}"

  # https://bugs.archlinux.org/task/30085 - hack found in Gentoo
  # Use system foomatic-rip for hpijs driver instead of foomatic-rip-hplip
  # The hpcups driver does not use foomatic-rip
  local _i
  for _i in ppd/hpcups/*.ppd.gz ; do
    rm -f "${_i}.temp"
    gunzip -c "${_i}" | sed -e 's/foomatic-rip-hplip/foomatic-rip/g' | gzip > "${_i}.temp"
    mv "${_i}.temp" "${_i}"
  done

  export AUTOMAKE='automake --foreign'
  autoreconf --force --install
}

build() {
  cd "hplip-${pkgver}"

  ./configure --prefix=/usr --disable-qt4 --disable-doc-build --disable-dbus-build --disable-network-build \
              --disable-scan-build --disable-fax-build --disable-foomatic-rip-hplip-install \
              --enable-foomatic-ppd-install --enable-new-hpcups --disable-cups-drv-install \
              --enable-cups-ppd-install --enable-pp-build
  make -j1
}

package() {
  cd "hplip-${pkgver}"
  make -j1 DESTDIR="${pkgdir}/" install

  # remove config provided by sane and autostart of hp-daemon
  rm -rf "${pkgdir}"/etc/{sane.d,xdg}

  # remove HAL .fdi file because HAL is no longer used
  rm -rf "${pkgdir}"/usr/share/hal

  # remove rc script
  rm -rf "${pkgdir}"/etc/init.d
}
