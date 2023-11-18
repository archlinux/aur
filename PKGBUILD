# Author: Société des Arts Techologiques
# PKGBUILD Maintainer: Jean-Michaël Celerier <jmcelerier @ sat dot qc dot ca>
pkgname=shmdata-git
pkgver=r838.96e044d
pkgrel=2
pkgdesc="Library to share flows of data frames between processes via shared memory"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/sat-mtl/tools/shmdata"
license=('GNU Lesser General Public License 2.1 or Later')
groups=()
depends=()
makedepends=('git' 'cmake')
provides=('shmdata' 'libshmdata-1.3.so')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+https://gitlab.com/sat-mtl/tools/shmdata.git")
sha256sums=('SKIP')
noextract=()

_gitname=shmdata

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "$srcdir/$_gitname"

  # Fix wrong path in generated pc file (it gets the packaging path)
  sed -i 's|@CMAKE_INSTALL_PREFIX@|/usr|' shmdata/shmdata.pc.in

  # Fix that shmdata master forced absolute path to /usr
  sed -i $'39i execute_process( \
    COMMAND "${PYTHON_EXECUTABLE}" -c "if True:\
  from distutils import sysconfig as sc  \
  print(sc.get_python_lib(prefix=\'\', plat_specific=True)) \
" \
    OUTPUT_VARIABLE PYTHON_DIST_PACKAGES \
    OUTPUT_STRIP_TRAILING_WHITESPACE \
  )' wrappers/python/CMakeLists.txt

  cmake -S "$srcdir/$_gitname" \
        -B "$srcdir/$_gitname-build" \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_CXX_FLAGS="-Wno-error=maybe-uninitialized" \
        -DCMAKE_BUILD_TYPE=Release

  cmake --build "$srcdir/$_gitname-build" 
}

package() {
  cd "$srcdir/$_gitname-build"
  cmake --install "$srcdir/$_gitname-build" 
  install -D -m644 "$srcdir/$_gitname/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
