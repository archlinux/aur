# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=box86
pkgver=0.2.6
pkgrel=1
pkgdesc='Linux Userspace x86 Emulator with a twist'
arch=('armv7h')
url='https://github.com/ptitSeb/box86'
license=('MIT')
depends=('gcc-libs')
optdepends=('gl4es: OpenGL 2 for GLES 2 devices')
makedepends=('git' 'cmake' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ptitSeb/box86/archive/v${pkgver}.tar.gz")
sha256sums=('f975b423455d44f196547e9316dc493d0fa84a138ee76f8e8a504450496cdf4e')

build() {
  cd ${pkgname}-${pkgver}
  cmake -B build -S . \
        -DARM_DYNAREC=ON \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install

  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Install documentation
  install -d "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -R ../docs/* "${pkgdir}/usr/share/doc/${pkgname}/"

  find "${pkgdir}"/usr/share/doc/${pkgname} -type f -exec chmod 0644 {} \;
  find "${pkgdir}"/usr/share/doc/${pkgname} -type d -exec chmod 0755 {} \;
}

