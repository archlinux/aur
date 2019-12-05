# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on hplip from [extra]

pkgname='hplip-minimal'
pkgver=3.19.11
pkgrel=1
pkgdesc='The HP printer drivers, and not much else'
arch=('i686' 'x86_64' 'armv6h')
url="https://hplipopensource.com"
license=('GPL2' 'custom')
depends=('python-dbus' 'python-distro' 'ghostscript>=8.64-6' 'libidn' 'libjpeg-turbo')
makedepends=('cups' 'libusb')
optdepends=(
  'cups: for printing support'
  'libusb: for advanced usb support'
)
conflicts=('hplip')
options=('!docs')
source=("https://downloads.sourceforge.net/hplip/hplip-${pkgver}.tar.gz")
md5sums=('8e48067b21b59df3806dc321d22c93b9')
sha256sums=('3d75773eead54ecf850eb9cdbfae3cb55ae0fc030dd3a7b5c524b72244f5d551')

prepare() {
  cd "hplip-${pkgver}"
}

build() {
  cd "hplip-${pkgver}"

 AUTOMAKE='automake --foreign' \
 autoreconf --force --install
 export CFLAGS+=" $(python3-config --includes)" # Fix build with python 3.8
 ./configure --prefix=/usr \
             --disable-qt5 \
             --disable-qt4 \
             --enable-new-hpcups \
             --disable-cups-drv-install \
             --enable-pp-build \
             --disable-doc-build \
             --disable-dbus-build \
             --disable-network-build \
             --disable-scan-build \
             --disable-fax-build \
             --disable-foomatic-rip-hplip-install \
             --enable-foomatic-ppd-install \
             --enable-cups-ppd-install
 make -s -j1
}

package() {
 cd "hplip-${pkgver}"
 make -j1 DESTDIR="${pkgdir}/" install

 # remove config provided by sane and autostart of hp-daemon
 rm -rf "${pkgdir}"/etc/{sane.d,xdg}

 # remove HAL .fdi file because HAL is no longer used
 rm -vrf "${pkgdir}"/usr/share/hal

 # remove rc script
 rm -vrf "${pkgdir}"/etc/init.d

 # add mixed license file
 install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 COPYING
}
