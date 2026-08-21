# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>
# Maintainer: Aurelle <aur@aurelle.dev>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
pkgname=vicinae
pkgver=0.26.3
pkgrel=1
pkgdesc="A focused launcher for your desktop — native, fast, extensible"
arch=('x86_64' 'aarch64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL3')
depends=(
  'nodejs'
  'qt6-base'
  'qt6-svg'
  'layer-shell-qt'
  'libqalculate'
  'qtkeychain-qt6'
  'qt6-declarative'
  'syntax-highlighting'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'npm'
  'jq'
  'glaze'
  'curl'
  'qt6-shadertools'
  'qt6-tools'
  'wayland-protocols'
  'cmark-gfm'
)
install=vicinae.install
provides=("vicinae")
conflicts=("vicinae")
source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
  "vicinae.hook"
)

sha256sums=('0717a31f0daac4872fb752e33db0fcdc4a9c2b64b145e1e9a444703b57ad23f2'
            '196fc6a6afea06fc94d6ca4ff45c422bdef02aa25b8f2a80579dce27e56a2ae1')

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
