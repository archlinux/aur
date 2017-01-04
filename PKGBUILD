# Maintainer: Kuldeep Singh Dhaka <kuldeep@madresistor.com>

pkgname=box0-studio-qt-git
_pkgname=box0-studio-qt
pkgver=153.9768dc6
pkgrel=1
pkgdesc="Box0 Studio is the Common Instruments software for Box0"
arch=('i686' 'x86_64')
url="https://www.madresistor.com/box0"
license=('GPL')
provides=(box0-studio-qt)
conflicts=(box0-studio-qt)
replaces=(box0-studio-qt)
source=("git+https://gitlab.com/madresistor/$_pkgname.git" "box0-studio.desktop")
depends=('fftw' 'libbox0' 'libreplot' 'lmfit' 'muparser' 'qt5-base' 'qt5-svg' 'adwaita-icon-theme')
makedepends=('cmake' 'git' 'imagemagick')
md5sums=('SKIP' "6454ffd649c576a16397b7d9522848b0")


pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git rev-list --count HEAD).$(git describe --always )"
}

prepare() {
  cd "$srcdir/$_pkgname"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd "$srcdir"
  convert -background none "$_pkgname/src/res/app_icon/app_icon.svg" app_icon.png

  cd "$_pkgname/build"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DUSE_MULTI_PROC='TRUE' ..
  make
}

package() {
  #desktop file and icon
  install -Dm644 "$srcdir/app_icon.png" "$pkgdir/usr/share/pixmaps/box0-studio.png"
  install -Dm644 box0-studio.desktop "$pkgdir/usr/share/applications/box0-studio.desktop"

  make -C "$srcdir/$_pkgname/build" DESTDIR="${pkgdir}" install
}
