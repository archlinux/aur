# Maintainer: Thulinma <jaron@vietors.com>
pkgname=mistserver
pkgdesc="The MistServer media server toolkit"
pkgver=3.8
pkgrel=1
license=('Unlicense')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://mistserver.org"
# Note: mbedtls is not a dep since it must be build as a subproject.
# The reason for this is that the mbedtls package in Arch is not compiled with dTLS enabled.
# It's built statically so it does not conflict with the system version of mbedtls (if any).
# Similarly, libusrsctp has an AUR package available, but does not provide a pkgbuild file so the dependency check fails.
# For this reason we built it as a static subproject as well, to prevent conflicts.
depends=('srt' 'libsrtp' 'librist')
makedepends=('meson')
source=("https://github.com/DDVTECH/mistserver/archive/${pkgver}.tar.gz")
md5sums=('f1f3c11b02b1e4d0140cb1282c0ae6eb')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo ${pkgver} > VERSION
  meson setup build --buildtype release --prefix "${pkgdir}/usr" --force-fallback-for mbedtls,usrsctp -DRELEASE="Generic_${CARCH}"
  cd build
  meson configure -Dmbedtls:default_library=static -Dusrsctp:default_library=static
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  meson install --tags runtime
  cd ..
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install mistserver.service "${pkgdir}/usr/lib/systemd/system/"
}

