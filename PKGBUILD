# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Co-Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=pi-coding-agent
pkgver=0.84.2
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
provides=('pi')
conflicts=('pi' 'pi-coding-agent-bin' 'pi-coding-agent-git')
options=('!strip' '!debug')
source=("pi-${pkgver}-source.tar.gz::${url}/releases/download/v${pkgver}/pi-${pkgver}-source.tar.gz")
sha256sums=('96a9efad258fa6fa89f661bbf830c356dd3baf6cd06c6543ce4e8253c143460e')

prepare() {
  cd "pi-$pkgver"
  # 将网络密集型操作移至 prepare()
  npm ci --ignore-scripts
}

build() {
  cd "pi-$pkgver"
  case "$CARCH" in
    x86_64)  platform=linux-x64 ;;
    aarch64) platform=linux-arm64 ;;
  esac
  # 继续使用官方脚本以确保多架构构建的正确性
  ./scripts/build-binaries.sh --platform "$platform" --skip-deps --offline-model-data --out "$srcdir/build"
}

package() {
  # 由于 makepkg 会重新 re-source，需要重新计算 platform
  case "$CARCH" in
    x86_64)  platform=linux-x64 ;;
    aarch64) platform=linux-arm64 ;;
  esac
  cd "$srcdir/build/$platform"

  # 遵循 Arch 标准，使用 /usr/lib 而非 /opt
  local _instdir="$pkgdir/usr/lib/$pkgname"

  # 安装整个应用包
  install -dm755 "$_instdir"
  cp -a --no-preserve=ownership . "$_instdir/"

  # 安装文档到 /usr/share/doc/
  # 注意：这是 monorepo，CHANGELOG.md 不在根目录，而在主包 packages/coding-agent/ 下
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -m644 "$srcdir/pi-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 "$srcdir/pi-$pkgver/packages/coding-agent/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  # 安装许可证
  install -Dm644 "$srcdir/pi-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 安装二进制符号链接到 /usr/bin/pi
  install -dm755 "$pkgdir/usr/bin"
  ln -s "../lib/$pkgname/pi" "$pkgdir/usr/bin/pi"
}
