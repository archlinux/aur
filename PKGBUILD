# Maintainer: Thulinma <jaron@vietors.com>
pkgname=mistserver
pkgdesc="The MistServer media server toolkit"
pkgver=3.13
pkgrel=1
license=('Unlicense')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://mistserver.org"
# Note: mbedtls is not a dep since it must be build as a subproject.
# The reason for this is that the mbedtls package in Arch is not compiled with dTLS enabled.
# It's built statically so it does not conflict with the system version of mbedtls (if any).
# Similarly, libusrsctp has an AUR package available, but does not provide a pkgbuild file so the dependency check fails.
# For this reason we built it as a static subproject as well, to prevent conflicts.
# Finally - srt is a static subproject as well: we apply a patch to detect remote connection close properly, and this patch isn't upstream (yet). It _can_ build with the unpatched upstream srt version as well, but that disables the corresponding functionality.
depends=('libsrtp' 'librist')
makedepends=('meson' 'git')
source=("https://r.mistserver.org/dl/mistserver_sourceV${pkgver}.tar.gz")
sha256sums=('e8eaa5255f4c9e718d02026e684514d1e8694b5f2cf3ea1fb5bc9a13d067cbae')
build() {
  cd "${srcdir}"
  meson setup build --buildtype release --prefix "${pkgdir}/usr" --force-fallback-for mbedtls,usrsctp,srt -DRELEASE="Generic_${CARCH}"
  cd build
  meson configure -Dmbedtls:default_library=static -Dusrsctp:default_library=static -Dsrt:default_library=static
  ninja
}

package() {
  cd "${srcdir}/build"
  meson install --tags runtime
  cd ..
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install mistserver.service "${pkgdir}/usr/lib/systemd/system/"
}

