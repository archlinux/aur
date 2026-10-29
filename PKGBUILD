pkgname=icey-server
pkgver=0.2.5
pkgrel=1
pkgdesc='Self-hosted source-to-browser server built on icey'
arch=('x86_64')
url='https://auscaster.com/icey/'
license=('AGPL3')
depends=('ffmpeg' 'openssl')
makedepends=('cmake' 'gcc' 'make' 'nodejs' 'npm' 'pkgconf')
source=(
  "icey-server-${pkgver}.tar.gz::https://github.com/auscaster/icey-server/releases/download/v0.2.5/icey-server-0.2.5-source.tar.gz"
  "icey-2.5.1.tar.gz::https://github.com/auscaster/icey-server/releases/download/v0.2.5/icey-2.5.1-source.tar.gz"
)
sha256sums=(
  '861c1c267b539c66a84f63f1c3e322c77188b2fa0c41e189bd0d4b8aca034d6f'
  '36f15c43b5720c51fa0af450b0e495f851b5872359d8bc3b80188f65c6382e5a'
)

build() {
  cd "${srcdir}/icey-server-0.2.5"
  npm --prefix web ci
  npm --prefix web run build
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DICEY_SOURCE_DIR="${srcdir}/icey-2.5.1"
  cmake --build build -j1 --target icey-server
}

package() {
  cd "${srcdir}/icey-server-0.2.5"
  cmake --install build --prefix "${pkgdir}/usr" --component apps
}
