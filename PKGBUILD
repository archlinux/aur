# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
pkgname=opencode-dynamic-context-pruning
pkgver=3.0.4
pkgrel=1
pkgdesc="Dynamic context pruning plugin for OpenCode - intelligently manages conversation context to optimize token usage ."
arch=('any')
url="https://github.com/Opencode-DCP/opencode-dynamic-context-pruning"
license=('MIT')
depends=('opencode')
makedepends=('bun')
options=('!strip' '!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('80b30e4e0d9b3d9323a0530292f5d793005172d5fbf5c7a9cde17917342716b6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # 安装所有依赖（包括 devDependencies，因为构建 TypeScript 需要它们）
  bun install

  # 执行构建脚本，生成 dist 目录
  bun run build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # 清理包含 devDependencies 的庞大 node_modules
  rm -rf node_modules

  # 仅重新安装生产环境依赖 (dependencies)，大幅缩小插件体积
  bun install --production

  # 创建插件目标目录
  local plugindir="$pkgdir/usr/lib/opencode/plugins/$pkgname"
  mkdir -p "$plugindir"

  # 严格按照 package.json 中定义的 "files" 字段，只拷贝必要产物和依赖
  cp -r dist package.json node_modules "$plugindir/"

  # 安装许可证
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
