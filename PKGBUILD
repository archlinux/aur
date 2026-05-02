# Maintainer: Your Name <your.email@example.com>

pkgname=rime-llm-translator-git
pkgver=r16.903403e
pkgrel=1
pkgdesc="给Rime输入法接入大模型进行云拼音、联想候选词"
arch=('any')
url="https://github.com/SHORiN-KiWATA/rime-llm-translator"
license=('AGPL3') 
depends=('python' 'fcitx5-rime')
makedepends=('git')
provides=('rime-llm-translator')
conflicts=('rime-llm-translator')
install="$pkgname.install" 
source=("git+https://github.com/SHORiN-KiWATA/rime-llm-translator.git")
sha256sums=('SKIP')

pkgver() {
  cd rime-llm-translator
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd rime-llm-translator

  # 1. 安装主控脚本到系统可执行目录
  install -Dm755 src/rime-llm-config "$pkgdir/usr/bin/rime-llm-config"

  # 2. 安装默认状态文件
  install -Dm644 src/default_state.json "$pkgdir/usr/share/rime-llm-translator/default_state.json"

  # 3. 安装 Lua 翻译器脚本到 Rime 的 lua 子目录 (匹配 README)
  install -Dm644 src/llm_translator.lua "$pkgdir/usr/share/rime-data/lua/llm_translator.lua"

  # 4. 安装文档和许可证协议
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
