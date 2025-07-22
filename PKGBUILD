# Maintainer: Huy Hoang <boydaihungst @gmail.com>
# Contributor: Sematre <sematre at gmx dot de>
# Keywords: videosubfinder

pkgname=videosubfinder-git
pkgver=r205.d6ca256
pkgrel=1
pkgdesc='Audio/Video processing software with focus on new generation HD formats, Blu-ray and HD DVD.'
url="https://github.com/SWHL/VideoSubFinder"
arch=('x86_64')
license=('GPL2')
provides=('videosubfinder')
depends=('gtk3' 'wxwidgets-gtk3' 'opencv' 'ffmpeg' 'tbb' 'vtk')
makedepends=('cmake' 'scdoc' 'git' 'imagemagick')
optdepends=(
  'cuda-tools: for CUDA support (Optional)'
)
backup=('usr/share/VideoSubFinder/previous_data.inf' 'usr/share/VideoSubFinder/settings/general.cfg')
source=(
  "${pkgname}::git+$url.git"
  "start-videosubfinder.sh"
  "videosubfinder.desktop"
)
sha512sums=('SKIP'
  '143b29725ea1afcc267d57510db33a317e2c377d86dbb742c6561bbb04ae04839a10d3decc7e4da542b2e63858559100ab6918aced574d620a6cd167ac11133b'
  '8d205f3d52e8b65c1a23354056880a29e07b97c17a21863effca60a6da7696153f9499074c5eb1934a457f2ac9cfc57c98da01819f61afbe6fb3bc4f6f74549f')
conflicts=(videosubfinder)

pkgver() {
  cd "${pkgname}"
  (
    set -o pipefail
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}"
  if pacman -Q opencv-cuda &>/dev/null; then
    echo "opencv-cuda is installed, forcing USE_CUDA=ON"
    echo "If you want to build without CUDA support, please install opencv instead"
    USE_CUDA=ON
  fi
  cmake -B build -S "${pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr/share' \
    -DUSE_CUDA=${USE_CUDA:-'OFF'}

  cmake --build build --config Release
  magick "${pkgname}/Interfaces/VideoSubFinderWXW/videosubfinder.ico" "build/${pkgname}.png"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install build

  # Install the start script
  install -Dm755 "start-videosubfinder.sh" "${pkgdir}/usr/bin/videosubfinder"
  ln -s "videosubfinder" "${pkgdir}/usr/bin/VideoSubFinderWXW"

  # Install project docs and assets
  mkdir -p "${pkgdir}/usr/share/doc"
  mv "${pkgdir}/usr/share/VideoSubFinder/Docs" "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 "build/${pkgname}-0.png" "${pkgdir}/usr/share/pixmaps/videosubfinder.png"
  install -Dm644 "videosubfinder.desktop" -t "${pkgdir}/usr/share/applications"

  touch report.log
  install -Dm777 "report.log" -t "${pkgdir}/usr/share/VideoSubFinder"

  touch previous_data.inf
  install -Dm777 "previous_data.inf" -t "${pkgdir}/usr/share/VideoSubFinder"
  chmod 777 "${pkgdir}/usr/share/VideoSubFinder/settings/general.cfg"
}
