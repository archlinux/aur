# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu-git
pkgver=0.6.1.r1197.g5784976f
pkgrel=1
pkgdesc='一个活在终端里的二次元少女。开箱即用的开源 AI 助手，支持接入通讯平台。'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/miyu-agent'
license=('MIT' 'OFL-1.1')
options=('!lto' '!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('alsa-lib' 'chafa' 'gcc-libs' 'glibc' 'onnxruntime' 'python' 'ripgrep')
makedepends=('cargo' 'git' 'pkgconf' 'python')
optdepends=(
  'git: update default Shorin Wiki knowledge base'
  'libnotify: 桌面通知(kitty 以外的终端由它弹)'
  'libcanberra: 通知提示音(没有时退到 pw-play/paplay)'
  'fish: fish shell integration support'
  'bash: bash shell integration support'
  'zsh: zsh shell integration support'
  'python-playwright: 网页检索脚本(小红书/知乎/闲鱼/酒店比价)'
  'xorg-server-xvfb: 网页检索脚本后台运行所需的虚拟显示'
  'chromium: 网页检索脚本的浏览器(或改装 google-chrome)'
  'python-qrcode: 扫码登录时在终端里画二维码'
)
provides=('miyu')
conflicts=('miyu')
# 字体(Noto CJK / Noto Emoji / JetBrains Mono)自 0.4.4 起 vendor 在源码树
# assets/fonts 下,不再从上游单独拉取。
source=(
  'miyu::git+https://github.com/SHORiN-KiWATA/miyu-agent.git'
  'shorinwiki::git+https://github.com/SHORiN-KiWATA/Shorin-ArchLinux-Guide.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd miyu
  local version revision commit
  version="$(grep '^version = ' Cargo.toml | head -n1 | cut -d '"' -f2)"
  revision="$(git rev-list --count HEAD)"
  commit="$(git rev-parse --short HEAD)"
  printf '%s.r%s.g%s' "${version}" "${revision}" "${commit}"
}

prepare() {
  cd miyu
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd miyu
  cargo build --release --locked --target "${CARCH}-unknown-linux-gnu"
}

package() {
  local wiki_commit
  wiki_commit="$(git -C "${srcdir}/shorinwiki" rev-parse HEAD)"
  cd miyu
  python packaging/ci/lib/arch_package.py source-install \
    --source "${srcdir}/miyu" --wiki "${srcdir}/shorinwiki" \
    --wiki-commit "${wiki_commit}" --component core --destination "${pkgdir}/usr"
}
