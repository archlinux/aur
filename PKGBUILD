# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=cpp-utilities
pkgname=c++utilities-git
_name=${pkgname%-git}
pkgver=989.6390182
pkgrel=2
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Common C++ classes and routines such as argument parser, IO and conversion utilities'
license=('GPL')
depends=('gcc-libs')
optdepends=("$_name-doc: API documentation")
makedepends=('cmake' 'git' 'ninja')
checkdepends=('cppunit')
provides=(libc++utilities-git.so)
url="https://github.com/Martchus/${_reponame}"
source=("${_reponame}::${MARTCHUS_GIT_URL_PREFIX:-git+https://github.com/Martchus}/${_reponame}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCONFIGURATION_NAME:STRING='git' \
    -DCONFIGURATION_PACKAGE_SUFFIX:STRING='-git' \
    -DCONFIGURATION_TARGET_SUFFIX:STRING='git' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    .
  ninja
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  ninja check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  DESTDIR="${pkgdir}" ninja install
}
