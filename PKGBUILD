# Maintainer: kpcyrd <git@rxv.cc>

_gitname=sn0int
pkgname=sn0int-git
pkgver=0.3.0.r0.g6669e3b
pkgrel=1
pkgdesc="OSINT framework and package manager"
url="https://github.com/kpcyrd/sn0int"
depends=('libcap' 'sqlite' 'libseccomp')
makedepends=('cargo' 'git')
provides=('sn0int')
conflicts=('sn0int')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
install='sn0int.install'
source=("git+https://github.com/kpcyrd/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  cargo build --release --locked
}

check() {
  cd "$_gitname"
  cargo test --release --locked
}

package() {
  cd "$_gitname"
  install -Dm755 "target/release/$_gitname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_gitname"

  install -d "$pkgdir/usr/share/bash-completion/completions" \
             "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/sn0int" completions bash > "$pkgdir/usr/share/bash-completion/completions/sn0int"
  "$pkgdir/usr/bin/sn0int" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_sn0int"
}

# vim:set ts=2 sw=2 et:
