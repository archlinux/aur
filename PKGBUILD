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
sha256sums_x86_64=('fbf05703ac12891f2a43cc04ed0e5dda3d199f9e2ec62bd470c211bfb7c9a2e0')
sha256sums_aarch64=('c9d928f2b532149b67b9da0c4d2f41cb3a65a076ae642841ba17335d974aed5a')

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
