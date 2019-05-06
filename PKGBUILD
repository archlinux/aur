# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive-git
_pkgname=olive
pkgver=continuous.r0.gb819a30c
_commit=b819a30c
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
depends=('ffmpeg' 'opencolorio' 'qt5-multimedia' 'qt5-svg')
makedepends=('cmake' 'git' 'qt5-tools')

# Temporarily, the "olive-git" package is incompatible
# with the dependency "olive-community-effects-git".
# More information on the link:
# https://github.com/cgvirus/Olive-Editor-Community-Effects/blob/65b96e093c128f2bb9336e6b7ed93f801e73435d/README.md
# optdepends=('olive-community-effects-git')

provides=('olive')
conflicts=('olive')
source=("git+https://github.com/olive-editor/olive#commit=$_commit"
        "CMakeLists.txt.patch"
       )
sha512sums=('SKIP'
            'c14e14676d2c58de036df6b92876c64f60e5cdd7d9ffc822003c09d5b89b85d85defeb921258f7a96f452b2bec09367f8fc46c42b720965c10f519944fad1627'
           )

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  if [ -d build ]
  then
    rm -rf build
  fi

  mkdir build
  patch "$srcdir/$_pkgname/CMakeLists.txt" CMakeLists.txt.patch
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ../$_pkgname
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
