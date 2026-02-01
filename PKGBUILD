# Hydra CAD – AUR (generiert von packaging/arch/aur-upload.sh)
pkgname=hydracad
pkgver=3.0.22
pkgrel=1
pkgdesc="Professional CAD application (C++/Qt6)"
arch=("x86_64")
url="https://github.com/drixber/CAD"
license=("custom")
depends=('qt6-base' 'qt6-tools' 'qt6-translations')
optdepends=('qt6-network: in-app updates without curl')
makedepends=('cmake' 'git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/drixber/CAD/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/CAD-${pkgver}"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCAD_USE_QT=ON
  cmake --build build -j"$(nproc)"
}

package() {
  cd "${srcdir}/CAD-${pkgver}"
  if [ -f packaging/linux/cad_desktop.wrapper ]; then
    install -Dm755 build/cad_desktop -t "${pkgdir}/usr/lib/hydracad"
    install -Dm755 packaging/linux/cad_desktop.wrapper "${pkgdir}/usr/bin/cad_desktop"
  else
    install -Dm755 build/cad_desktop -t "${pkgdir}/usr/bin"
  fi
  ln -s cad_desktop "${pkgdir}/usr/bin/hydracad"
  install -Dm644 packaging/linux/HydraCAD.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 installer/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
