pkgname=patchy-image-editor-git
pkgver=0.89.r890.g2ef0358
pkgrel=1
pkgdesc="PSD-oriented image editor built from the latest Git revision"
arch=('x86_64')
url="https://github.com/SethRobinson/Patchy"
license=('MIT')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-imageformats'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)
optdepends=(
  'kimageformats: additional image formats, including HEIC/HEIF'
  'libheif: HEIC/HEIF codec support'
)
provides=("patchy-image-editor=${pkgver}")
conflicts=('patchy-image-editor-bin')
options=('!debug')
source=('Patchy::git+https://github.com/SethRobinson/Patchy.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd Patchy

  local version
  version="$(sed -nE 's/^[[:space:]]*VERSION[[:space:]]+([0-9.]+).*$/\1/p' CMakeLists.txt | head -n1)"
  printf '%s.r%s.g%s' \
    "${version}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -S Patchy -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPATCHY_BUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 Patchy/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
