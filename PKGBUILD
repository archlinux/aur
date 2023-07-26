# Maintainer: Thulinma <jaron@vietors.com>
pkgname=mistserver
pkgdesc="The MistServer media server toolkit"
pkgver=3.2.2
pkgrel=2
license=('Unlicense')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://mistserver.org"
depends=('srt' 'libsrtp')
makedepends=('meson' 'srt' 'libsrtp')
source=("https://github.com/DDVTECH/mistserver/archive/${pkgver}.tar.gz")
md5sums=('d09f18591a0d2d4c374a9a1ac4213674')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo ${pkgver} > VERSION
  meson setup build --buildtype release --prefix "${pkgdir}/usr" --force-fallback-for librist,mbedtls -DRELEASE="Generic_${CARCH}"
  cd build
  meson configure -Dlibrist:default_library=static -Dmbedtls:default_library=static
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  meson install --tags runtime
  cd ..
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install mistserver.service "${pkgdir}/usr/lib/systemd/system/"
}

