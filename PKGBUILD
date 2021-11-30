#!/bin/bash
# Maintainer: Ethan Lerner <ethanlerners@gmail.com>
# Contributor: Ethan Lerner <ethanlerners@gmail.com>

_pkgname=gogle
pkgname=${_pkgname}-git
pkgver=1.0.r2.b7eaa43
pkgrel=1
pkgdesc="Simple utility for quickly getting a Google search URL pasted to your clipboard."
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
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
