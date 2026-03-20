# Maintainer: Firebleudark <firebleu AT tuta DOT com> 
pkgname=pkgit-git
_pkgname=pkgit
pkgver=r84.g71a8f69
pkgrel=1
pkgdesc="A simple package manager for installing tools directly from Git, written in Nim"
arch=('x86_64' 'aarch64')
url="https://github.com/dacctal/pkgit"
license=('GPL3')
depends=('nim' 'git')
makedepends=('git' 'nim' 'nimble')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/dacctal/pkgit.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  export NIMBLE_DIR="$srcdir/nimble_cache"
  nimble install -y parsetoml
  nim c -d:release --threads:on -o:pkgit src/pkgit.nim
}

package() {
  cd "$_pkgname"
  install -Dm755 pkgit "$pkgdir/usr/bin/pkgit"
  install -dm755 "$pkgdir/etc/pkgit"
  echo -e "[general]\nuser-level = false" > config.toml
  install -m644 config.toml "$pkgdir/etc/pkgit/config.toml"
}
