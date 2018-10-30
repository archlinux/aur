# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=rua
pkgver=0.6.2
pkgrel=2
pkgdesc='convenient jailed AUR helper in rust'
url='https://github.com/vn971/rua'
source=("https://github.com/vn971/rua/archive/${pkgver}.tar.gz")
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('cargo')
depends=('bubblewrap' 'git')

sha256sums=(b232e7b57f5c10ad77d793272764bc363b2d223dfe7e198d81da173fd46d085d)

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
  COMPLETIONS_DIR=completions cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/rua "${pkgdir}/usr/bin/rua"

  install -Dm644 target/completions/rua.bash /usr/share/bash-completion/completions
  install -Dm644 target/completions/rua.fish /usr/share/fish/completions
  install -Dm644 target/completions/_rua /usr/share/zsh/functions/Completion/Linux
}
