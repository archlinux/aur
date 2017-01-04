# Maintainer: Kuldeep Singh Dhaka <kuldeep@madresistor.com>

pkgname=liab-studio-qt-git
_pkgname=liab-studio-qt
pkgver=103.e4e5243
pkgrel=1
pkgdesc="LiaB Studio is an Integerated Experimenting Enviroment (with data logging capabilities)."
arch=('i686' 'x86_64')
url="https://www.madresistor.com/box0"
license=('GPL')
provides=(liab-studio-qt)
conflicts=(liab-studio-qt)
replaces=(liab-studio-qt)
source=("git+https://gitlab.com/madresistor/$_pkgname.git" "liab-studio.desktop")
depends=('fftw' 'libbox0' 'libreplot' 'lmfit' 'muparser' 'qt5-base' 'qt5-svg' 'libcsv' 'adwaita-icon-theme')
makedepends=('cmake' 'git' 'imagemagick')
md5sums=('SKIP' "1f181303b158888043fbc7ee9e2414ac")


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
  install -Dm644 "$srcdir/app_icon.png" "$pkgdir/usr/share/pixmaps/liab-studio.png"
  install -Dm644 liab-studio.desktop "$pkgdir/usr/share/applications/liab-studio.desktop"

  make -C "$srcdir/$_pkgname/build" DESTDIR="${pkgdir}" install
}
