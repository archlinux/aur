# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=rua
pkgver=0.6.4
pkgrel=2
pkgdesc='convenient jailed AUR helper in rust'
url='https://github.com/vn971/rua'
source=("https://github.com/vn971/rua/archive/${pkgver}.tar.gz")
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('cargo')
depends=('bubblewrap' 'git')

sha256sums=(771675c76dba1e07ff870adc67cbf401de68aa7f99bc34948ab49d4be941f2a3)

build () {
  cd "$srcdir/$pkgname-$pkgver"
  if command -v rustup && ! rustc --version; then
    rustup install stable  # make sure at least one toolchain is installed
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
