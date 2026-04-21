pkgname=icey-server
pkgver=0.1.3
pkgrel=1
pkgdesc='Self-hosted source-to-browser server built on icey'
arch=('x86_64')
url='https://0state.com/icey/'
license=('AGPL3')
depends=('ffmpeg' 'openssl')
makedepends=('cmake' 'gcc' 'make' 'nodejs' 'npm' 'pkgconf')
source=(
  "icey-cli-${pkgver}.tar.gz::https://github.com/nilstate/icey-cli/releases/download/v${pkgver}/icey-cli-${pkgver}-source.tar.gz"
  "icey-2.4.5.tar.gz::https://github.com/nilstate/icey-cli/releases/download/v${pkgver}/icey-2.4.5-source.tar.gz"
)
sha256sums=(
  '5a68f0c8493b0e82e1afa6fce7dba5a3e0bd8d3d334c6a37daf753f344ed3be0'
  'a4208d952ee5ddec35fa884bfaf5550b5b9a5273d7028e4ddc9990d5892376fb'
)

build() {
  cd "${srcdir}/icey-cli-${pkgver}"
  npm --prefix web ci
  npm --prefix web run build
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DICEY_SOURCE_DIR="${srcdir}/icey-2.4.5"
  cmake --build build -j1 --target icey-server
}

package() {
  cd "${srcdir}/icey-cli-${pkgver}"
  cmake --install build --prefix "${pkgdir}/usr" --component apps
}
