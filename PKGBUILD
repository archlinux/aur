# Maintainer: Edmund Lodewijks <edmund [AT] proteamail [DOT] com>

pkgname=comodoro-git
_pkgname=comodoro
pkgver=r119.b70b360
pkgrel=1
pkgdesc="A CLI to manage timers"
arch=('x86_64')
url="https://github.com/pimalaya/comodoro"
license=('AGPL-3.0-or-later')
depends=('dbus' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('pimalaya')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
  mkdir -p {completions,man}
}

build() {
  cd "$_pkgname"
  CFLAGS+=" -ffat-lto-objects"
  cargo build --frozen --release
  target/release/$_pkgname completions bash fish zsh -d completions/
  target/release/$_pkgname manuals man/
}

check() {
  cd "$_pkgname"
  cargo test --frozen --lib
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  find man/ -type f -exec install -Dm 644 -t "$pkgdir/usr/share/man/man1" {} \;
}

# vim:set ts=2 sw=2 et:
