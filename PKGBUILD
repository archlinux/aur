# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=pi-coding-agent
pkgver=0.84.2
pkgrel=1
pkgdesc="Coding agent CLI with read, bash, edit, write tools and session management"
arch=('x86_64' 'aarch64')
url="https://github.com/earendil-works/pi"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('bun' 'nodejs' 'npm')
optdepends=(
    'git: repository-aware workflows and session integration'
    'ripgrep: faster in-repository search'
)
provides=('pi')
conflicts=('pi-coding-agent-bin' 'pi-coding-agent-git')
options=('!strip' '!debug')
source=("pi-${pkgver}-source.tar.gz::${url}/releases/download/v${pkgver}/pi-${pkgver}-source.tar.gz")
sha256sums=('96a9efad258fa6fa89f661bbf830c356dd3baf6cd06c6543ce4e8253c143460e')

build() {
  cd "$srcdir/pi-$pkgver"
  case "$CARCH" in
    x86_64)  platform=linux-x64 ;;
    aarch64) platform=linux-arm64 ;;
  esac
  # Official recipe (scripts/build-binaries.sh): npm ci, tsgo build of all
  # workspace packages with bundled model data, then bun build --compile into
  # a standalone binary. --skip-deps keeps the single current-platform build
  # (npm ci already installs the matching clipboard binding).
  ./scripts/build-binaries.sh --platform "$platform" --skip-deps --offline-model-data --out "$srcdir/build"
}

package() {
  # makepkg re-sources the PKGBUILD for the fakeroot package() step, so the
  # platform chosen in build() is not available here — recompute it.
  case "$CARCH" in
    x86_64)  platform=linux-x64 ;;
    aarch64) platform=linux-arm64 ;;
  esac
  cd "$srcdir/build/$platform"
  # The compiled binary resolves its sibling assets (package.json,
  # node_modules, theme, export-html, wasm) relative to the real binary path,
  # so ship the bundle untouched under /opt and expose it via /usr/bin/pi.
  install -d "$pkgdir/opt/$pkgname"
  cp -a --no-preserve=ownership . "$pkgdir/opt/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s "../../opt/$pkgname/pi" "$pkgdir/usr/bin/pi"

  install -Dm644 "$srcdir/pi-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
