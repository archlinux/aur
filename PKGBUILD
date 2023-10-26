# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=brightness
pkgname=${_pkgname}-git
pkgver=20230924.r18.30d3269
pkgrel=1
pkgdesc="A small Rust program that uses ddcutil to control your monitor's brightness"
url='https://gitlab.com/Devorlon/brightness'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('ddcutil')
makedepends=('cargo' 'pandoc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci main | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  pandoc README.md -s -t man -o "${_pkgname}.1"
}

build() {
  cd $_pkgname
  cargo build --release --locked
}

package() {
  cd $_pkgname
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "${_pkgname}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
}
