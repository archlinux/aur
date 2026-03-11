# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
pkgname=opencode-notifier
pkgver=0.1.32
pkgrel=1
pkgdesc="OpenCode plugin for desktop notifications and sounds on permission, completion, and error events."
arch=('any')
url="https://github.com/mohak34/opencode-notifier"
license=('MIT')
depends=('opencode' 'libnotify')
makedepends=('bun')
options=('!strip' '!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb87892556f9eda309ec862fcb2c636fc6696d88488d5ca78e47da80cb2d9993')

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
  cp -r dist sounds logos package.json node_modules "$plugindir/"

  # 安装许可证
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
