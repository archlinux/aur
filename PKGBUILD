# Maintainer: Gianluca Pettinello <g_pet@hotmail.com>

pkgname=kmame-git
pkgver=r79.4875338
pkgrel=1
pkgdesc="Frontend for MAME based on mamepgui"
arch=('x86_64')
license=('GPL-2')
depends=('qt5-base' 'quazip')
makedepends=('git')
optdepends=('mame')
source=('kmame::git+https://invent.kde.org/gianlucapettinello/kmame.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  
  # build included liblzma.a (system one is not compatible)
  cd lzma
  qmake
  make

  # build kmame
  cd ..
  lrelease kmame.pro
  qmake
  make
}

package() {
  # install executable
  install -Dm755 "$srcdir/${pkgname%-git}/bin/kmame" "$pkgdir/usr/bin/kmame"
}
