#!/bin/bash
# PKGBUILD License Artistic 2.0 https://choosealicense.com/licenses/artistic-2.0/
# Maintainer: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

# PKGBUILD slightly ripped off ofrom exa-git PKGBUILD

_pkgname=brix
pkgname=${_pkgname}-git
pkgver=0.3.0.beta.1.r3.g059886c
pkgrel=2
pkgdesc='Brix Scaffolding System'
arch=('i686' 'x86_64')
url="https://github.com/miapolis/${_pkgname}"
license=('MIT')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd $_pkgname
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_pkgname
  export RUSTFLAGS="-C target-cpu=native"
  cargo build --frozen --release
}

package() {
  target="target/release"
  cd $_pkgname
  install -Dm755 "$target/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "$target/build/brix-"*/out/brix.bash -t "$pkgdir/usr/share/bash-completion/completions/brix"
  install -Dm644 "$target/build/brix-"*/out/brix.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
}
