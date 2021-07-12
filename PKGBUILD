# Maintainer: Campbell Barton <ideasman42@gmail.com>
export GIT_LFS_SKIP_SMUDGE=1
_pkgname=opentoonz
_version=git
pkgver=1.5.2982
pkgname=${_pkgname}-${_version}
pkgrel=1
pkgdesc="2D Animation software."
arch=('i686' 'x86_64')

url="https://github.com/${_pkgname}/${_pkgname}"
license=('BSD')
groups=()
depends=(
    'boost' 'boost-libs'
    'qt5-base' 'qt5-svg' 'qt5-script' 'qt5-tools' 'qt5-multimedia' 'qt5-serialport'
    'lz4' 'libusb' 'lzo' 'libjpeg-turbo'
    'glew' 'freeglut' 'sdl2' 'freetype2'
    'blas' 'cblas' 'superlu' 'libmypaint' 'opencv')
# NOTE: ideally we could avoid git-lfs since we don't need any files it provides.
makedepends=('cmake' 'make' 'git' 'git-lfs')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+${url}.git"
)
noextract=()
md5sums=(
'SKIP'
) #autofill using updpkgsums

pkgver() {
  # Uses: opentoonz_version.git_commit_count
  cd $_pkgname
  # extract:
  #
  #     const float applicationVersion  = 1.5;
  ver=$(cat toonz/sources/include/tversion.h | \
        grep -e "const float applicationVersion" | \
        cut -d' ' -f 8 | \
        cut -d ";" -f 1)
  git_count=$(git rev-list --all --count)

  echo $ver.$git_count
}


build() {
  # make libtiff
  cd $_pkgname/thirdparty/tiff-4.0.3
  ./configure --with-pic --disable-jbig && make $MAKEFLAGS
  cd -

  cmake -H$_pkgname/toonz/sources \
        -B$_pkgname-build \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_INSTALL_PREFIX:PATH=/opt/opentoonz

  cd $_pkgname-build
  make $MAKEFLAGS
}

package() {
  cd $_pkgname-build
  make DESTDIR="$pkgdir/" install
}
