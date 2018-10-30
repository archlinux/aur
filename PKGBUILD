# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=rua
pkgver=0.6.3
pkgrel=4
pkgdesc='convenient jailed AUR helper in rust'
url='https://github.com/vn971/rua'
source=("https://github.com/vn971/rua/archive/${pkgver}.tar.gz")
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('cargo')
depends=('bubblewrap' 'git')

sha256sums=(8f0b73357f4c6506ad48825cd6fe24c76072b58cf6246d0b6b70e4efe914a621)

build () {
  cd "$srcdir/$pkgname-$pkgver"
  if ! rustc --version; then
    if command -v rustup; then
      rustup install stable
      rustup default stable
    else
      echo "Failed to run rustc and rustup. Is default toolchain configured correctly?" 1>&2
    fi
  fi
  mkdir -p target/completions
  COMPLETIONS_DIR=target/completions cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/rua "${pkgdir}/usr/bin/rua"

  install -Dm644 target/completions/rua.bash "${pkgdir}/usr/share/bash-completion/completions/rua.bash"
  install -Dm644 target/completions/rua.fish "${pkgdir}/usr/share/fish/completions/rua.fish"
  install -Dm644 target/completions/_rua "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_rua"
}
