# Maintainer: Shupei Fan <dymarkfan@outlook.com>
# Contributor: Jiuyang Liu <jiuyang.liu@sifive.com>

pkgname=openroad-git
pkgver=r19869.1bb904876
pkgrel=1
pkgdesc='A framework for RTL synthesis'
arch=('x86_64')
url='https://theopenroadproject.org/'
license=('BSD')
conflicts=('openroad' 'opensta')
provides=('openroad')
depends=('blas' 'boost-libs' 'tcl' 'python' 'zlib' 'or-tools' 'coin-or-lemon' 'spdlog' 'qt5-base')
makedepends=('git' 'cmake' 'boost' 'swig' 'bison' 'flex')
source=('git+https://github.com/The-OpenROAD-Project/OpenROAD.git'
        'git+https://github.com/The-OpenROAD-Project/OpenSTA.git'
        'git+https://github.com/The-OpenROAD-Project/abc.git'
        )

sha256sums=('SKIP'
           'SKIP'
           'SKIP'
           )

pkgver() {
  cd $srcdir/OpenROAD
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/OpenROAD
  git submodule init
  git config submodule.module/OpenSTA.url $srcdir/OpenSTA
  git config submodule.src/abc.url $srcdir/abc
  git -c protocol.file.allow=always submodule update
  # git apply ../0001-fmt-deprecated-ostream.patch
}

build() {
  cd $srcdir/OpenROAD
  cmake -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_INSTALL_RPATH=YES \
    -Wno-dev
  cmake --build build
}

# check() {
# }

package() {
  cd $srcdir/OpenROAD
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/OpenROAD/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

