# Maintainer: Saghm Rossi <aur@saghm.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jesse Luehrs <archlinux@tozt.net>

_pkgname=rbw
pkgname=$_pkgname-client-header-fix
_branch=fix/client-name-header
_pkgver=1.12.1
pkgver=1.12.1.dd6b6542
pkgrel=1
pkgdesc='Unofficial Bitwarden CLI (forked branch for client header fix)'
arch=('x86_64')
conflicts=('rbw')
provides=('rbw')
url='https://git.tozt.net/rbw'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'pinentry'
)
makedepends=(
  'git'
  'rust'
)
options=('!lto')
source=("git+https://github.com/davla/rbw.git#branch=$_branch")
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git switch $_branch -q
    rev=$(git rev-parse -q --short=8 $_branch)
    echo "$_pkgver.$rev" 
}

prepare() {
  cd "$_pkgname"
  git switch $_branch -q
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  cargo build --frozen --release --all-features

  # generate shell auto-completions
  for completion in bash fish zsh; do
    cargo run --frozen --release --bin rbw -- \
      gen-completions "$completion" > "$completion-completions"
  done
}

check() {
  cd "$_pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"

  # binaries
  install -vDm755 -t "$pkgdir/usr/bin" target/release/rbw{,-agent}

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md

  # shell auto-completions
  install -vDm644 bash-completions "$pkgdir/usr/share/bash-completion/completions/rbw"
  install -vDm644 fish-completions "$pkgdir/usr/share/fish/vendor_completions.d/rbw.fish"
  install -vDm644 zsh-completions "$pkgdir/usr/share/zsh/site-functions/_rbw"
}
