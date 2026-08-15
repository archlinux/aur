# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=elan-lean-git
pkgver=4.2.3.r2.g464c9d2
pkgrel=1
pkgdesc="Lean version manager"
arch=('x86_64')
url="https://github.com/leanprover/elan"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'libgcc' 'libcurl.so')
makedepends=('git' 'cargo' 'curl')
provides=("elan-lean=$pkgver")
conflicts=('elan-lean')
source=("git+https://github.com/leanprover/elan.git")
sha256sums=('SKIP')


prepare() {
  cd "elan"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "elan"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "elan"

  #cargo test \
  #  --frozen
}

package() {
  cd "elan"

  cargo install \
    --frozen \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  mv "$pkgdir/usr/bin/elan-init" "$pkgdir/usr/bin/elan"

  _binlinks=('lake' 'lean' 'leanchecker' 'leanpkg')
  for link in "${_binlinks[@]}"; do
    ln -s /usr/bin/elan "$pkgdir/usr/bin/${link}"
  done

  install -d \
    "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/fish/vendor_completions.d" \
    "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/elan" completions bash > "$pkgdir/usr/share/bash-completion/completions/elan"
  "$pkgdir/usr/bin/elan" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/elan.fish"
  "$pkgdir/usr/bin/elan" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_elan"

  install -Dm644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/elan-lean"
}
