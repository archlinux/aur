# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu-git
pkgver=0.5.0.r794.g8b88e3c5
pkgrel=1
pkgdesc='一个活在终端里的二次元少女。开箱即用的开源 AI 助手，支持接入通讯平台。'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('MIT' 'OFL-1.1')
options=('!lto' '!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('alsa-lib' 'chafa' 'gcc-libs' 'glibc' 'onnxruntime' 'ripgrep')
makedepends=('cargo' 'git' 'pkgconf')
optdepends=(
  'git: update default Shorin Wiki knowledge base'
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
  'miyu::git+https://github.com/SHORiN-KiWATA/Miyu.git'
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
  cargo build --release --locked
}

package() {
  cd miyu
  install -Dm755 "target/release/miyu" "${pkgdir}/usr/bin/miyu"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "assets/fonts/NotoSansCJK-Regular.ttc" "${pkgdir}/usr/share/miyu/fonts/NotoSansCJK-Regular.ttc"
  install -Dm644 "assets/fonts/NotoColorEmoji.ttf" "${pkgdir}/usr/share/miyu/fonts/NotoColorEmoji.ttf"
  install -Dm644 "assets/fonts/JetBrainsMono-Regular.ttf" "${pkgdir}/usr/share/miyu/fonts/JetBrainsMono-Regular.ttf"
  install -Dm644 "assets/fonts/NotoSansCJK.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NotoSansCJK.LICENSE"
  install -Dm644 "assets/fonts/NotoColorEmoji.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NotoColorEmoji.LICENSE"
  install -Dm644 "assets/fonts/JetBrainsMono.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/JetBrainsMono.LICENSE"

  # 内置本地 embedding 模型（语义检索辅助；运行库来自 onnxruntime-cpu）
  while IFS= read -r -d '' file; do
    local rel="${file#assets/models/}"
    install -Dm644 "${file}" "${pkgdir}/usr/share/miyu/models/${rel}"
  done < <(find assets/models -mindepth 2 -type f -print0 | sort -z)
  install -Dm644 "assets/models/bge-small-zh-v1.5-int8/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/bge-small-zh-v1.5.LICENSE"

  if [[ -d src/memes ]]; then
    while IFS= read -r -d '' file; do
      local rel="${file#src/memes/}"
      install -Dm644 "${file}" "${pkgdir}/usr/share/miyu/memes/${rel}"
    done < <(find src/memes -type f \( -name '*.json' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.gif' -o -name '*.webp' \) -print0 | sort -z)
  fi

  if [[ -d src/scripts ]]; then
    while IFS= read -r -d '' file; do
      local rel="${file#src/scripts/}"
      install -Dm755 "${file}" "${pkgdir}/usr/share/miyu/scripts/${rel}"
    done < <(find src/scripts -type f -print0 | sort -z)
  fi

  # Default knowledge base: kb (from miyu repo)
  local kb_dir="${srcdir}/miyu/kb"
  if [[ -d "${kb_dir}" ]]; then
    while IFS= read -r -d '' file; do
      local rel="${file#${kb_dir}/}"
      case "/${rel}" in
        */.git/*|*/pictures/*|*/legacy/*|*/Legacy/*|*/lagacy/*|*/Lagacy/*|*/Wikis/*) continue ;;
      esac
      install -Dm644 "${file}" "${pkgdir}/usr/share/miyu/default-kb/kb/${rel}"
    done < <(find "${kb_dir}" -type f -name '*.md' -print0 | sort -z)
  fi

  # Default knowledge base: shorinwiki (from shorinwiki source, wiki/ subdir)
  local wiki_dir="${srcdir}/shorinwiki/wiki"
  if [[ -d "${wiki_dir}" ]]; then
    while IFS= read -r -d '' file; do
      local rel="${file#${wiki_dir}/}"
      case "/${rel}" in
        */.git/*|*/pictures/*|*/legacy/*|*/Legacy/*|*/lagacy/*|*/Lagacy/*|*/Wikis/*) continue ;;
      esac
      install -Dm644 "${file}" "${pkgdir}/usr/share/miyu/default-kb/shorinwiki/${rel}"
    done < <(find "${wiki_dir}" -type f -name '*.md' -print0 | sort -z)
  fi

  # Default knowledge base: manifest
  install -d "${pkgdir}/usr/share/miyu/default-kb/manifest"
  cat > "${pkgdir}/usr/share/miyu/default-kb/manifest/manifest.json" <<EOF
{
  "name": "miyu-default-kb",
  "generated_by": "miyu-git PKGBUILD"
}
EOF
  local sw_commit
  sw_commit="$(git -C "${srcdir}/shorinwiki" rev-parse HEAD 2>/dev/null || echo '')"
  printf '%s\n' "${sw_commit}" > "${pkgdir}/usr/share/miyu/default-kb/manifest/shorinwiki.commit"
}
