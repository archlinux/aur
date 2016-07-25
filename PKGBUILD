# Maintainer: Jack Random <jack (@) random.to>
# Contributor: Antonio Rojas <arojas@archlinux.org
# Contributor: Jerome Leclanche <jerome.leclanche+arch@gmail.com>

_gitname=akonadi
pkgname=$_gitname-git
pkgver=r10508.26d0626
pkgrel=1
pkgdesc="PIM layer, which provides an asynchronous API to access all kind of PIM data. builds with PostgreSQL backend"
arch=('i686' 'x86_64')
url="https://community.kde.org/KDE_PIM/akonadi"
license=('LGPL')
depends=('qt5-base' 'shared-mime-info' 'libxslt' 'postgresql' 'kdesignerplugin')
makedepends=('git' 'extra-cmake-modules' 'postgresql')
optdepends=('mariadb: MariaDB backend')
conflicts=("$_gitname")
provides=("$_gitname" 'akonadi-client')
source=("git+https://github.com/KDE/$_gitname")
install=$pkgname.install
sha256sums=("SKIP")

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DDATABASE_BACKEND=POSTGRES \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
