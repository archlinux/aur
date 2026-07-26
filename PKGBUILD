# Maintainer: Undercat037 <deltacatdeveloper@gmail.com>
pkgname=aura-emerge
pkgver=1.33.0
pkgrel=1
pkgdesc="Portage-like wrapper for Arch Linux using Aura"
arch=('x86_64')
url="https://github.com/Undercat037/aura-emerge"
license=('GPL-3.0')
depends=('aura')
optdepends=('devtools: for --abs support (build from ABS source via pkgctl)'
  'gnupg: for PGP verification when building from ABS')
makedepends=('rust' 'cargo' 'git')
conflicts=('portage' 'portage-git')
provides=('portageq')
install=aura-emerge.install
backup=('etc/emerge/world.set')
#git tag -a v1.27.0 -m "..." && git push origin v1.27.0
source=("$pkgname::git+https://github.com/Undercat037/aura-emerge.git#tag=v$pkgver")
#updpkgsums
sha256sums=('91010ece9d468697d42a81d2cff0d9d55b969778eb84286b39c2afebd0c3ded8')
build() {
  cd "$pkgname"
  cargo build --release
}
package() {
  cd "$pkgname"
  local bin="target/release/aura-emerge"

  _gen_or_die() {
    local out="$1"
    shift
    if ! "$bin" "$@" >"$out" || [ ! -s "$out" ]; then
      error "\"$bin $*\" produced no output — refusing to package an empty file"
      return 1
    fi
  }

  install -Dm755 target/release/aura-emerge "$pkgdir/usr/bin/emerge"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 UA-README.MD "$pkgdir/usr/share/doc/$pkgname/UA-README.md"

  _gen_or_die man.1 --gen-manpage
  install -Dm644 man.1 "$pkgdir/usr/share/man/man1/emerge.1"

  install -dm755 "$pkgdir/etc/emerge"
  install -dm755 "$pkgdir/etc/emerge/sets.d"
  install -Dm644 /dev/null "$pkgdir/etc/emerge/world.set"

  _gen_or_die comp.bash --gen-completions bash
  install -Dm644 comp.bash "$pkgdir/usr/share/bash-completion/completions/emerge"
  _gen_or_die comp.zsh --gen-completions zsh
  install -Dm644 comp.zsh "$pkgdir/usr/share/zsh/site-functions/_emerge"
  _gen_or_die comp.fish --gen-completions fish
  install -Dm644 comp.fish "$pkgdir/usr/share/fish/vendor_completions.d/emerge.fish"
}
