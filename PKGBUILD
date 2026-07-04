# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu-git
pkgver=0.1.5.r126.g6405f21
pkgrel=1
pkgdesc='活在终端里的二次元少女'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('MIT')
options=('!lto' '!strip' '!debug')
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
source=('miyu::git+https://github.com/SHORiN-KiWATA/Miyu.git')
sha256sums=('SKIP')

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
}
