# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=OpenFIRE-App
_QTver=Qt6
pkgname=openfireapp-git
pkgver=r259.68eef8a
pkgrel=3
pkgdesc='Configuration utility for the OpenFIRE lightgun system.'
arch=('x86_64' 'aarch64')
url='https://github.com/TeamOpenFIRE/OpenFIRE-App'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-serialport' 'qt6-svg' 'icu')
optdepends=(
            'qt5-base: Building with Qt5'
            'qt5-serialport: Building with Qt5'
            'qt5-svg: Building with Qt5'
)
makedepends=('cmake')
provides=('openfireapp')
conflicts=('openfireapp')
install=$pkgname.install
source=("$_name::git+https://github.com/TeamOpenFIRE/OpenFIRE-App.git")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_name"
  git submodule update --init
}

build() {
  mkdir "$srcdir/$_name/build"
  cd "$srcdir/$_name/build"
  cmake .. -DOFAPP_GITHASH=$(git rev-parse --short HEAD) -DOFAPP_QT_VERSIONS=$_QTver -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  install -Dm755 "$srcdir/$_name/build/OpenFIREapp" "$pkgdir/usr/bin/OpenFIREapp"
  install -Dm755 "$srcdir/$_name/img/ico/openfire.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.TeamOpenFIRE.OpenFIREapp.svg"
  install -Dm755 "$srcdir/$_name/org.TeamOpenFIRE.OpenFIREapp.desktop" "$pkgdir/usr/share/applications/org.TeamOpenFIRE.OpenFIREapp.desktop"
}
