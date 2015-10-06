# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=multirust-git
_pkgname=multirust
pkgver=0.7.0.r0.gb222fcd
pkgrel=2
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
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.rust-installer.url "$srcdir/multirust/src/rust-installer"
  git config submodule.rustup.url "$srcdir/multirust/src/rustup"
  git submodule update
}

build() {
  cd "$_pkgname"
  ./build.sh
}

package() {
  cd "$_pkgname"
  ./install.sh --prefix="${pkgdir}/usr/"
}
