# Maintainer: Warlock9000

pkgname=plasma-midna-theme-git
pkgver=r152.8359aaa
pkgrel=1
pkgdesc="KaOS grey KDM-Theme."
arch=('i686' 'x86_64')
url="http://kaosx.us"
license=('GPL')
groups=(plasma)
source=("git://github.com/KaOSx/midna.git")
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd midna
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../midna \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

# make QtCurve preset and color scheme available for KDE4 too
  install -d -m755 "$pkgdir"/usr/share/apps/{QtCurve,color-schemes}
  ln -sr "$pkgdir"/usr/share/QtCurve/Midna.qtcurve "$pkgdir"/usr/share/apps/QtCurve
  ln -sr "$pkgdir"/usr/share/color-schemes/Midna*.colors "$pkgdir"/usr/share/apps/color-schemes
}
