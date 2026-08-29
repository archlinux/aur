# Maintainer: Undercat037 <deltacatdeveloper@gmail.com>
pkgname=lmv
pkgver=1.3.0
pkgrel=1
pkgdesc="Utility for moving a file/directory to a new location, leaving a symlink to it in the old location"
arch=('x86_64')
url="https://github.com/Undercat037/lmv"
license=('GPL-3.0-only')
makedepends=('cargo')
source=("$pkgname::git+https://github.com/Undercat037/lmv.git#tag=v$pkgver")
sha256sums=('9d0db53f828d266add85d28b912555ef444c777dd69b6c9f803a610510a45ed3')

build() {
  cd "lmv"
  cargo build --release
}

package() {
  cd "lmv"
  local bin="target/release/lmv"

  _gen_or_die() {
    local out="$1"
    shift
    if ! "$bin" "$@" >"$out" || [ ! -s "$out" ]; then
      error "\"$bin $*\" produced no output - refusing to package an empty file"
      return 1
    fi
  }

  install -Dm755 target/release/lmv "$pkgdir/usr/bin/lmv"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.md"

  _gen_or_die comp.bash --gen-completions bash
  install -Dm644 comp.bash "$pkgdir/usr/share/bash-completion/completions/lmv"
  _gen_or_die comp.zsh --gen-completions zsh
  install -Dm644 comp.zsh "$pkgdir/usr/share/zsh/site-functions/_lmv"
  _gen_or_die comp.fish --gen-completions fish
  install -Dm644 comp.fish "$pkgdir/usr/share/fish/vendor_completions.d/lmv.fish"
}
