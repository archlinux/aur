# Maintainer: willemw <willemw12@gmail.com>

_pkgname=cpod
pkgname=$_pkgname-git
pkgver=1.22.6.r0.ge4362cb
pkgrel=1
pkgdesc="A simple, beautiful podcast app"
arch=('x86_64')
url="https://github.com/z-------------/cumulonimbus"
license=('Apache')
depends=('gconf' 'gtk-update-icon-cache')
makedepends=('git' 'gulp' 'python2' 'yarn')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=('cumulonimbus')
source=($pkgname::git+https://github.com/z-------------/cumulonimbus.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  yarn
  gulp
}

package() {
  cd $pkgname
  rm -rf dist
  yarn dist --linux deb   # --x64

  cd dist
  bsdtar xf CPod_*.deb data.tar.xz
  bsdtar xf data.tar.xz --directory "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/CPod/cumulonimbus "$pkgdir/usr/bin/cpod"
}

