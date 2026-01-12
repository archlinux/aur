# Maintainer: Evan Sosenko <razorx@evansosenko.com>
pkgname=worktrunk-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Worktrunk is a CLI for git worktree management, designed for running AI agents in parallel."
arch=('x86_64' 'aarch64')
url="https://github.com/max-sixty/worktrunk"
license=('MIT OR Apache-2.0')
makedepends=('bash' 'fish' 'zsh')
source_x86_64=("https://github.com/max-sixty/worktrunk/releases/download/v$pkgver/worktrunk-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("https://github.com/max-sixty/worktrunk/releases/download/v$pkgver/worktrunk-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('2bfb1b24b4479ae6bb53d748ad6b1080d8498d18aa51ae23dfe69473a304505e')
sha256sums_aarch64=('f8ba0c890776810c6482c90c5370e2d2ed144fde9d3ad461563be3327bd65519')

build() {
  mkdir -p home
  touch "home/.zshrc"
  echo "autoload -Uz compinit\ncompinit" > "home/.zshrc"
  touch "home/.bashrc"
  mkdir -p "home/.local/share/bash-completion/completions/"
  mkdir -p "home/.config/fish/conf.d/"
  mkdir -p "home/.config/fish/completions/"
  HOME="${srcdir}/home" \
    ZDOTDIR="${srcdir}/home" \
    XDG_CONFIG_HOME="${srcdir}/home/.config" \
    XDG_DATA_HOME="${srcdir}/home/.local/share" \
    "./worktrunk-$CARCH-unknown-linux-musl/wt" config shell install -y
}

package() {
  cd "./worktrunk-$CARCH-unknown-linux-musl"
  install -Dm755 "./wt" "${pkgdir}/usr/bin/wt"

  mkdir -p "${pkgdir}/usr/share/licenses/worktrunk/"
  install -Dm644 ./LICENSE* "${pkgdir}/usr/share/licenses/worktrunk/"

  # TODO: How to install bash completions?
  # install -Dm644 ./home/bash "${pkgdir}/usr/share/bash-completion/completions/wt.bash"

  # TODO: How to install zsh completions?
  # install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_wt"

  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 "../home/.config/fish/completions/wt.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/wt.fish"
}
