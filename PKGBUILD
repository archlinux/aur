# Maintainer: Magpiny <magpinyb@proton.me>
# Contributor: Wanjare S. <samuelwanjare@protonmail.com>

pkgname=malama
pkgver=0.3.0
pkgrel=1
pkgdesc="Native Linux chat client for local LLMs — no cloud, no browser, no compromise."
arch=('x86_64')
url="https://magpiny.github.io/malama"
license=('GPL-3.0-or-later')
depends=(
  'wxwidgets-gtk3'
  'sqlite'
  'poppler'
  'libarchive'
  'pugixml'
  'libpng'
  'libjpeg-turbo'
  'spdlog'
  'boost-libs'
)
makedepends=(
  'cmake'
  'ninja'
  'git'
  'gcc'
  'pkgconf'
  'boost'
  'appstream'
)
optdepends=(
  'ollama: default local LLM inference server'
)
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/magpiny/malama/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('390ea6dbddf82e26f339821cf608f8690843967aa311a896eb3f0695a87d29d5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build

  # Ensure icon, desktop entry, AppStream metadata and license are in place
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [ -f assets/malama.png ]; then
    install -Dm644 assets/malama.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/malama.png"
  fi
  if [ -f assets/malama.svg ]; then
    install -Dm644 assets/malama.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/malama.svg"
  fi
  if [ -f assets/org.magpiny.malama.metainfo.xml ]; then
    install -Dm644 assets/org.magpiny.malama.metainfo.xml "${pkgdir}/usr/share/metainfo/org.magpiny.malama.metainfo.xml"
  fi
}
