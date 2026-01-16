# Maintainer: Evan Sosenko <razorx@evansosenko.com>
pkgname=worktrunk-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="Worktrunk is a CLI for git worktree management, designed for running AI agents in parallel."
arch=('x86_64' 'aarch64')
url="https://github.com/max-sixty/worktrunk"
license=('MIT OR Apache-2.0')
source_x86_64=("https://github.com/max-sixty/worktrunk/releases/download/v$pkgver/worktrunk-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("https://github.com/max-sixty/worktrunk/releases/download/v$pkgver/worktrunk-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('b039d788aef109bb6ee48c6c1cc996497e5d90de9c201b21bb17e4091e51abea')
sha256sums_aarch64=('933b1c63751b47f0e97d6a7050c7eedeb47f5cc42387d44e29f87a2ec0032478')

build() {
  mkdir -p "home/.config/fish/conf.d/" \
    "home/.config/fish/conf.d/" \
    "home/.config/fish/completions/" \
    "home/.config/fish/functions/"

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
