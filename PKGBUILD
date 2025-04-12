# Maintainer: robertfoster

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-vulkan"
pkgver=1.7.5 # renovate: datasource=github-tags depName=ggerganov/whisper.cpp
pkgrel=4
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with Vulkan optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('vulkan-driver' 'vulkan-icd-loader')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
makedepends=(
  'cmake'
  'git'
  'shaderc'
  'vulkan-headers'
)

source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  cmake \
    -B build \
    -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGGML_VULKAN=1

  cmake --build build
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${_pkgbase}"
}

sha256sums=('2fda42b57b7b8427d724551bd041616d85401fb9382e42b0349132a28920a34f')
