# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu-git
pkgver=0.4.0.r436.gacc3a91
pkgrel=1
pkgdesc='一个活在终端里的二次元少女。开箱即用的开源 AI 助手，支持接入通讯平台。'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('MIT' 'OFL-1.1')
options=('!lto' '!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('alsa-lib' 'chafa' 'gcc-libs' 'glibc' 'ripgrep')
makedepends=('cargo' 'git' 'pkgconf')
optdepends=(
  'git: update default Shorin Wiki knowledge base'
  'fish: fish shell integration support'
  'bash: bash shell integration support'
  'zsh: zsh shell integration support'
)
provides=('miyu')
conflicts=('miyu')
_cjk_version='Sans2.004'
_emoji_version='v2.051'
source=(
  'miyu::git+https://github.com/SHORiN-KiWATA/Miyu.git'
  'shorinwiki::git+https://github.com/SHORiN-KiWATA/Shorin-ArchLinux-Guide.git'
  "NotoSansCJK-Regular.ttc::https://raw.githubusercontent.com/notofonts/noto-cjk/${_cjk_version}/Sans/OTC/NotoSansCJK-Regular.ttc"
  "NotoColorEmoji.ttf::https://raw.githubusercontent.com/googlefonts/noto-emoji/${_emoji_version}/fonts/NotoColorEmoji.ttf"
  "NotoSansCJK.LICENSE::https://raw.githubusercontent.com/notofonts/noto-cjk/${_cjk_version}/LICENSE"
  "NotoColorEmoji.LICENSE::https://raw.githubusercontent.com/googlefonts/noto-emoji/${_emoji_version}/LICENSE"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'b76b0433203017ca80401b2ee0dd69350349871c4b19d504c34dbdd80541690a'
  '72a635cb3d2f3524c51620cdde406b217204e8a6a06c6a096ff8ed4b5fd6e27b'
  '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2'
  '500bb1ccf43df7bbb522112f9133a52b16e1c35e809632f5d8609b179152de5b'
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
  install -Dm644 "${srcdir}/NotoSansCJK-Regular.ttc" "${pkgdir}/usr/share/miyu/fonts/NotoSansCJK-Regular.ttc"
  install -Dm644 "${srcdir}/NotoColorEmoji.ttf" "${pkgdir}/usr/share/miyu/fonts/NotoColorEmoji.ttf"
  install -Dm644 "${srcdir}/NotoSansCJK.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NotoSansCJK.LICENSE"
  install -Dm644 "${srcdir}/NotoColorEmoji.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NotoColorEmoji.LICENSE"

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
