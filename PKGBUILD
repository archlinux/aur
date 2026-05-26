# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
pkgname=vicinae
pkgver=0.21.2
pkgrel=1
pkgdesc="A focused launcher for your desktop — native, fast, extensible"
arch=('x86_64' 'aarch64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL3')
depends=(
  'nodejs'
  'qt6-base'
  'qt6-svg'
  'cmark-gfm'
  'layer-shell-qt'
  'libqalculate'
  'minizip'
  'qtkeychain-qt6'
  'libxml2'
  'qt6-declarative'
  'syntax-highlighting'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'npm'
  'rapidfuzz-cpp'
  'jq'
  'glaze'
  'curl'
  'qt6-shadertools'
)
install=vicinae.install
provides=("vicinae")
conflicts=("vicinae")
source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
  "vicinae.hook"
)

sha256sums=('f12d32786f8e8b5a2ba0c11cf5b45c2594d38692c9e72436c2fb76f870cb69ee'
            'cc595dadd95ebfaa4c47f837e69f87394a2d73e63234a6e95a828b8efad9d186')

prepare() {
  curl "https://api.github.com/repos/vicinaehq/vicinae/git/ref/tags/v${pkgver}" \
    --output "${pkgname}-v${pkgver}-meta.yml" \
    --silent \
    --follow
}

build() {
  SHA=$(jq .object.sha "${pkgname}-v${pkgver}-meta.yml" -r)

  cd $pkgname-$pkgver || exit
  cmake -G Ninja \
    -DVICINAE_GIT_TAG="v${pkgver}" \
    -DVICINAE_GIT_COMMIT_HASH="${SHA:0:7}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DVICINAE_PROVENANCE=aur \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -B build

  cmake --build build
}

package() {
  cd "$pkgname-$pkgver" || exit
  DESTDIR="$pkgdir" cmake --install build

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-git}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-git}.hook"
}
