# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=multirust-git
pkgver=0.0.6.r36.g011bb72
pkgrel=1
pkgdesc="A tool for managing multiple Rust installations"
arch=('any')
url="https://github.com/brson/multirust"
license=('MIT')
source=('git+https://github.com/brson/multirust'
        'git+https://github.com/rust-lang/rust-installer'
        'git+https://github.com/rust-lang/rustup')
md5sums=('SKIP'
         'SKIP'
         'SKIP')
depends=('bash' 'curl')
builddepends=('git')
optdepends=('gnupg: to verify signatures')
conflict=('cargo-bin' 'cargo-git' 'rust' 'rust-git' 'rust-nightly' 'rust-nightly-bin' 'multirust')
provides=('rust' 'cargo')

pkgver() {
  cd multirust
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/multirust"
  git submodule init
  git config submodule.rust-installer.url "$srcdir/multirust/src/rust-installer"
  git config submodule.rustup.url "$srcdir/multirust/src/rustup"
  git submodule update
}

build() {
  cd "$srcdir/multirust"

  ./build.sh
}

package() {
  cd "$srcdir/multirust"

  ./install.sh --destdir="$pkgdir"
}
