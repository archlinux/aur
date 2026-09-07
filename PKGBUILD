# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Co-Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=pi-coding-agent
pkgver=0.85.1
pkgrel=1
pkgdesc='Coding agent CLI with read, bash, edit, write tools and session management'
arch=('x86_64' 'aarch64')
url='https://github.com/earendil-works/pi'
license=('MIT')
depends=('fd' 'ripgrep' 'glibc' 'gcc-libs')
makedepends=('bun' 'nodejs' 'npm')
optdepends=(
    'git: repository-aware workflows and session integration'
)
provides=("pi=$pkgver")
conflicts=('pi' 'pi-coding-agent-bin' 'pi-coding-agent-git')
options=('!strip' '!debug')
source=("pi-${pkgver}-source.tar.gz::${url}/releases/download/v${pkgver}/pi-${pkgver}-source.tar.gz")
sha256sums=('f7ec92ed4f7b75369198398a3421732eae405183971450bc74cb8544f42d02ca')

prepare() {
  cd "pi-$pkgver"
  # Network access happens here per Arch packaging guidelines
  npm ci --ignore-scripts
}

build() {
  cd "pi-$pkgver"
  case "$CARCH" in
    x86_64)  platform=linux-x64 ;;
    aarch64) platform=linux-arm64 ;;
  esac
  # Official recipe handles both x86_64 and aarch64
  ./scripts/build-binaries.sh --platform "$platform" --skip-deps --offline-model-data --out "$srcdir/build"
}

package() {
  # makepkg re-sources the PKGBUILD for the package() step, so recompute the platform
  case "$CARCH" in
    x86_64)  platform=linux-x64 ;;
    aarch64) platform=linux-arm64 ;;
  esac
  cd "$srcdir/build/$platform"

  # Private app files belong in /usr/lib per Arch packaging standards
  local _instdir="$pkgdir/usr/lib/$pkgname"

  # Ship the bundle as-is: the binary resolves sibling assets relative to its real path
  install -dm755 "$_instdir"
  cp -a --no-preserve=ownership . "$_instdir/"

  # Install docs
  # Monorepo: CHANGELOG.md lives under packages/coding-agent/, not the repo root
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -m644 "$srcdir/pi-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 "$srcdir/pi-$pkgver/packages/coding-agent/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  # Install license
  install -Dm644 "$srcdir/pi-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Expose the CLI via /usr/bin/pi
  install -dm755 "$pkgdir/usr/bin"
  ln -s "../lib/$pkgname/pi" "$pkgdir/usr/bin/pi"
}
