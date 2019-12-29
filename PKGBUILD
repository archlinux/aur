# Maintainer: Kaare Jenssen <kaare at jenssen dot it>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='fd-git'
pkgver=7.4.0.r13.g762f551
pkgrel=1
pkgdesc='A simple, fast and user-friendly alternative to find.'
arch=('i686' 'x86_64')
url='https://github.com/sharkdp/fd'
license=('APACHE' 'MIT')
makedepends=('git' 'rust')
provides=('fd')
conflicts=('fd')
source=($pkgname::git+https://github.com/sharkdp/fd.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  git describe --long --tags \
    | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cargo build --release --locked
}

check() {
  cd $pkgname
  cargo test --release
}

package() {
  cd $pkgname
  install -Dm755 target/release/fd "$pkgdir"/usr/bin/fd
  install -Dm644 target/release/build/fd-find-*/out/fd.bash "$pkgdir"/usr/share/bash-completion/completions/fd
  install -Dm644 target/release/build/fd-find-*/out/fd.fish "$pkgdir"/usr/share/fish/vendor_completions.d/fd.fish
  install -Dm644 target/release/build/fd-find-*/out/_fd "$pkgdir"/usr/share/zsh/site-functions/_fd
  install -Dm644 doc/fd.1 "$pkgdir"/usr/share/man/man1/fd.1
  install -Dm644 LICENSE-APACHE "$pkgdir"/usr/share/licenses/fd/LICENSE-APACHE
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/fd/LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
