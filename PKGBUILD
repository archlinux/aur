# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=box86
pkgver=0.3.4
pkgrel=1
pkgdesc='Linux Userspace x86 Emulator with a twist'
arch=('armv7h')
url='https://github.com/ptitSeb/box86'
license=('MIT')
install='box86.install'
depends=('gcc-libs')
optdepends=('gl4es: OpenGL 2 for GLES 2 devices')
makedepends=('git' 'cmake' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ptitSeb/box86/archive/v${pkgver}.tar.gz"
        "box86.install")
sha256sums=('226532793a6f991c456f792bc416490a5461df3831a8dd58c7db3a1e5d79456d'
            'ecd38bdad06c256b2655bd4707d7b5248611073f751357424f2fc6327743e299')
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

