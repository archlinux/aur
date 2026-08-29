# Maintainer: Undercat037 <deltacatdeveloper@gmail.com>
pkgname=aura-emerge
pkgver=2.4.1
pkgrel=1
pkgdesc="A standalone Gentoo-style emerge for Arch Linux - installs from official repos, the AUR, and ABS, scans PKGBUILDs for supply-chain red flags before building, and runs untrusted build steps inside a bwrap sandbox."
arch=('x86_64')
url="https://github.com/Undercat037/aura-emerge"
license=('GPL-3.0-only')
depends=('git' 'sudo')
optdepends=('devtools: for --abs support (pkgctl repo clone)'
  'gnupg: for PGP verification when building from ABS'
  'bubblewrap: sandboxed builds (falls back to unsandboxed with --no-sandbox)')
makedepends=('rust' 'cargo')
conflicts=('portage' 'portage-git' 'aura-emerge-git')
provides=('portageq')
install=aura-emerge.install
backup=('etc/emerge/world.set')
#git tag -a v1.27.0 -m "..." && git push origin v1.27.0
source=("$pkgname::git+https://github.com/Undercat037/aura-emerge.git#tag=v$pkgver")
#updpkgsums
sha256sums=('26380a4aaa1dff32b630a66d71dbbfd337c772bc39dc41263c12c10f21fd61b1')

build() {
  cd "aura-emerge"
  cargo build --release
}

package() {
  cd "aura-emerge"
  local bin="target/release/aura-emerge"

  _gen_or_die() {
    local out="$1"
    shift
    if ! "$bin" "$@" >"$out" || [ ! -s "$out" ]; then
      error "\"$bin $*\" produced no output - refusing to package an empty file"
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
