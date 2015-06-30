# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="dahdi-tools"
pkgdesc="DAHDI tools for Asterisk (Digium, OpenVox, Allo and Yeastar cards)"
pkgver=2.10.1
pkgrel=3
arch=("i686" "x86_64")
url="http://www.asterisk.org/"
license=("LGPLv2")
depends=("dahdi-linux" "libusb" "perl")
backup=(
  "etc/dahdi/system.conf"
)
source=(
  "http://downloads.asterisk.org/pub/telephony/dahdi-tools/${pkgname}-${pkgver}.tar.gz"
  "dahdi-tools-2.10.1-allo.patch"
  "dahdi-tools-2.10.1-openvox.patch"
  "dahdi-tools-2.10.1-yeastar.patch"
  "dahdi-tools-2.10.1-gcc510.patch"
)
sha256sums=(
  "eac80535a0fa4f61fc7ba767bbbd726e0ad769e3d22c207e75d381fe578a6c21"
  "5176ab6f92da173e667b5f9b7c82131173dff61ae69ed3e51c743ac955a40cde"
  "fcc641ade28a1bd46a4c2abe45d6e19c25d08484421ddb3365bcb07f37cc183b"
  "b420dd3d4c0f08d0a696acc545f35e2157d9a50073581497b4d4093b7a23f32f"
  "f14128582ee6bf9695ef3eb700c62003a5167a77a124015043c0acaee23ce653"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # enable additional drivers.
  patch -Np1 -i "${srcdir}/dahdi-tools-2.10.1-allo.patch"
  patch -Np1 -i "${srcdir}/dahdi-tools-2.10.1-openvox.patch"
  patch -Np1 -i "${srcdir}/dahdi-tools-2.10.1-yeastar.patch"

  # compile fixes for latest gcc.
  patch -Np1 -i "${srcdir}/dahdi-tools-2.10.1-gcc510.patch"

  # fix wrong installation paths.
  sed 's,$(prefix)/sbin,$(prefix)/bin,' -i xpp/Makefile

  # compile.
  ./configure --with-dahdi --sbindir=/usr/bin
  make DESTDIR="${pkgdir}" all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
