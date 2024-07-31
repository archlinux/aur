# Maintainer: Thulinma <jaron@vietors.com>
pkgname=mistserver
pkgdesc="The MistServer media server toolkit"
pkgver=3.4
pkgrel=1
license=('Unlicense')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://mistserver.org"
# Note: mbedtls is not a dep since it must be build as a subproject.
# The reason for this is that the mbedtls package in Arch is not compiled with dTLS enabled.
depends=('srt' 'libsrtp' 'librist')
makedepends=('meson' 'srt' 'libsrtp' 'librist')
source=("https://github.com/DDVTECH/mistserver/archive/${pkgver}.tar.gz")
md5sums=('11122dcd9ae208616f0a9daa5074fbfe')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo ${pkgver} > VERSION
  meson setup build --buildtype release --prefix "${pkgdir}/usr" --force-fallback-for mbedtls -DRELEASE="Generic_${CARCH}"
  cd build
  meson configure -Dmbedtls:default_library=static
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  meson install --tags runtime
  cd ..
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install mistserver.service "${pkgdir}/usr/lib/systemd/system/"
}

