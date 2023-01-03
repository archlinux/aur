# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pavers_Career <pavers_career_0d AT icloud DOT com>

pkgname=gerbera-mysql
pkgver=1.12.1
pkgrel=1
pkgdesc="UPnP Media Server (Based on MediaTomb) with MySQL backend"
arch=(x86_64)
url="https://gerbera.io/"
license=(GPL2)
depends=(taglib curl file libupnp duktape libexif fmt pugixml spdlog sqlite ffmpeg ffmpegthumbnailer libmatroska wavpack mariadb-libs exiv2)
makedepends=(cmake gtest)
provides=(gerbera)
conflicts=(gerbera)
install=gerbera.install
options=(emptydirs)
source=("gerbera-${pkgver}.tar.gz::https://github.com/gerbera/gerbera/archive/v${pkgver}.tar.gz"
        gerbera.sysusers
        gerbera.tmpfiles)
sha256sums=('2144a7c4a13e8b43aa0c911fbeae65f05e2c42254ddd03be5c41f5fcf103a93c'
            '0b55a4e1886f7aad0528446658433327815fd3f4d06e260518423f86dbe32dcc'
            '452f5d4b5661e0262cb4a48d62a54f5f26d53c6d3aebf502cde072214a8b30d8')
prepare() {
  cd "${srcdir}/gerbera-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/gerbera-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_FFMPEGTHUMBNAILER=1 \
    -DWITH_AVCODEC=1 \
    -DWITH_TESTS=1 \
    -DWITH_EXIV2=1 \
    -DWITH_WAVPACK=1 \
    -DWITH_MYSQL=1
  make
}

check() {
  cd "${srcdir}/gerbera-${pkgver}/build"
  make test
}

package() {
  cd "${srcdir}/gerbera-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  install -dm0755 "${pkgdir}"/var/lib/gerbera
  install -dm0755 "${pkgdir}"/etc/gerbera
  install -Dm0644 "${srcdir}/gerbera".tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/gerbera.conf
  install -Dm0644 "${srcdir}/gerbera".sysusers "${pkgdir}"/usr/lib/sysusers.d/gerbera.conf
}
