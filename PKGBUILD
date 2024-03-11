# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Ellie Huxtable <e@elm.sh>

pkgname=atuin-lily-git
_pkgname=atuin-lily
__pkgname=atuin
pkgver=r968.9d91564
pkgrel=1
pkgdesc="Magical shell history ( lilydjwg fork )"
arch=('x86_64')
url="https://github.com/atuinsh/atuin"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
optdepends=('bash-preexec: bash integration')
source=("${_pkgname}::git+https://github.com/lilydjwg/atuin.git")
sha256sums=('SKIP')
options=('!lto')
conflicts=('atuin')
provides=('atuin')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  mkdir -p completions/
}

build() {
  cd "$_pkgname"
  cargo build --release --frozen --all-features
  for sh in 'bash' 'fish' 'zsh'; do
    "target/release/$__pkgname" gen-completions -s "$sh" -o completions/
  done
}

check() {
  cd "$_pkgname"
  cargo test --frozen --all-features --workspace --lib
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$__pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 "completions/$__pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "completions/$__pkgname.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/_$__pkgname" -t "${pkgdir}/usr/share/zsh/site-functions"
}

# vim: ts=2 sw=2 et:
