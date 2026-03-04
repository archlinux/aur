# Maintainer: Whyme Lyu <callme5long@gmail.com>

# The name `rv` is occupied by an R package manager
pkgname=rv-ruby-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='Extremely fast Ruby version and gem manager'
url=https://rv.dev/
arch=(x86_64 aarch64)
license=(Apache-2.0 MIT)

source_x86_64=("rv-$pkgver-x86_64.tar.xz::https://github.com/spinel-coop/rv/releases/download/v${pkgver}/rv-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("rv-$pkgver-aarch64.tar.xz::https://github.com/spinel-coop/rv/releases/download/v${pkgver}/rv-aarch64-unknown-linux-gnu.tar.xz")
b2sums_x86_64=('e6b1bab77f3db654a1aee728832dc806eb2358ef6a96baf8440064de45251d8e884f36eb8e63e1dbc8037c8a64b3b5abd5be4e4bde56263ab5a2fc9d83397fcf')
b2sums_aarch64=('90f0b55a1004021f7f00c0aaee412bc2472aeffb730a03c98f5398aea067221cc22a1f850e1a10551ac7e809196618f93c8d20255d640d1e73ed9aa81360fd33')

depends=(glibc libgcc)
# rv-ruby doesn't exist on AUR yet but we better be safe
provides=(rv-ruby)
conflicts=(rv-ruby)

build() {
  cd "$srcdir/rv-$CARCH-unknown-linux-gnu"

  for shell in bash fish zsh; do
    ./rv shell completions $shell > rv.$shell
  done
}

package() {
  cd "$srcdir/rv-$CARCH-unknown-linux-gnu"

  install -Dm755 -t "$pkgdir/usr/bin/" rv rvx

  install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" rv.fish
  install -Dm644 -T rv.bash "$pkgdir/usr/share/bash-completion/completions/rg"
  install -Dm644 -T rv.zsh "$pkgdir/usr/share/zsh/site-functions/_rg"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    README.md CHANGELOG.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE-APACHE LICENSE-MIT
}
