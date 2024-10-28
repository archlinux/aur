#Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=('tiny3d-n64-git' 'tiny3d-n64-gltf-importer-git')
pkgver=r136.662a099
pkgrel=1
url="https://github.com/HailToDodongo/tiny3d"
arch=('x86_64')
license=('MIT')
makedepends=('git')
depends=('libdragon-unstable-git')
source=("git+https://github.com/HailToDodongo/tiny3d")
sha256sums=('SKIP')

pkgver() {
  cd tiny3d
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd tiny3d
  CFLAGS="" CXXFLAGS="" LDFLAGS="" ASFLAGS="" N64_INST=/usr make
  N64_INST=/usr make -C tools/gltf_importer
}

package_tiny3d-n64-git(){
  pkgdesc="3D ucode/library for the N64 using libdragon"
  options=('!buildflags' '!strip' '!debug')
  provides=('tiny3d-n64')
  conflicts=('tiny3d-n64')
  arch=('any')
  depends=('libdragon-unstable-git')

  cd tiny3d

  mkdir -p "${pkgdir}/usr/mips64-elf/"{include,lib} "${pkgdir}/usr/include"
  make N64_INST=/usr INSTALLDIR="${pkgdir}/usr" install

  #install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_tiny3d-n64-gltf-importer-git() {
  pkgdesc="glTF model importer for the N64 and Tiny3D library"
  options=()
  provides=('tiny3d-n64-gltf-importer')
  conflicts=('tiny3d-n64-gltf-importer')
  arch=('i686' 'x86_64')
  depends=('gcc-libs')

  cd tiny3d
  mkdir -p "${pkgdir}/usr/bin"

  make INSTALLDIR="${pkgdir}/usr" -C tools/gltf_importer install

  #install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
