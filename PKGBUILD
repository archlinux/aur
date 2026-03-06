# Maintainer: Whyme Lyu <callme5long@gmail.com>

# The name `rv` is occupied by an R package manager
pkgname=rv-ruby-bin
pkgver=0.5.3
pkgrel=1
pkgdesc='Extremely fast Ruby version and gem manager'
url=https://rv.dev/
arch=(x86_64 aarch64)
license=(Apache-2.0 MIT)

source_x86_64=("rv-$pkgver-x86_64.tar.xz::https://github.com/spinel-coop/rv/releases/download/v${pkgver}/rv-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("rv-$pkgver-aarch64.tar.xz::https://github.com/spinel-coop/rv/releases/download/v${pkgver}/rv-aarch64-unknown-linux-gnu.tar.xz")
b2sums_x86_64=('59ae8fb4523a14440882c2d2e17cc12e0d7b1c836671f476d47980bc391f8a1714f12ce2849b51ea4b185791a80461c71253db49dde63ba67c20e6c625d0edbe')
b2sums_aarch64=('d727b7f70504d2554cb65dafe5cfcb2f0a95c40080b9c0a9df032e4c37430983564c060dff8b804c60751cf1facd66b73359e1d58535d04f021d076796b728f6')

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
  install -Dm644 -T rv.bash "$pkgdir/usr/share/bash-completion/completions/rv"
  install -Dm644 -T rv.zsh "$pkgdir/usr/share/zsh/site-functions/_rv"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    README.md CHANGELOG.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE-APACHE LICENSE-MIT
}
