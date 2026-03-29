pkgname=icey-server
pkgver=0.1.1
pkgrel=1
pkgdesc='Self-hosted source-to-browser server built on icey'
arch=('x86_64')
url='https://github.com/nilstate/icey-cli'
license=('AGPL3')
depends=('ffmpeg' 'openssl')
makedepends=('cmake' 'gcc' 'make' 'nodejs' 'npm' 'pkgconf')
source=(
  "icey-cli-${pkgver}.tar.gz::https://github.com/nilstate/icey-cli/releases/download/v0.1.1/icey-cli-0.1.1-source.tar.gz"
  "icey-2.4.0.tar.gz::https://github.com/nilstate/icey-cli/releases/download/v0.1.1/icey-2.4.0-source.tar.gz"
)
sha256sums=(
  'dd21750dfec9f0304477f3f0124d6cf2ec018b3c701b931439f5ef1acfc21cdd'
  '3fb3be6fe83685a22c7bf92a193fbe3416af9822cfa0f061cba571f4de620848'
)

build() {
  cd "${srcdir}/icey-cli-0.1.1"
  npm --prefix web ci
  npm --prefix web run build
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DICEY_SOURCE_DIR="${srcdir}/icey-2.4.0"
  cmake --build build -j1 --target icey-server
}

package() {
  cd "${srcdir}/icey-cli-0.1.1"
  cmake --install build --prefix "${pkgdir}/usr" --component apps
}
