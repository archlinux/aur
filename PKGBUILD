# Author: Société des Arts Techologiques
# PKGBUILD Maintainer: Jean-Michaël Celerier <jmcelerier @ sat dot qc dot ca>
pkgname=sat-switcher-git
pkgver=r3625.efd05eea
pkgrel=1
pkgdesc="Switcher for audio, video, data and network streams. Using the shmdata power !"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/sat-mtl/tools/switcher"
license=('GNU General Public License 3')
groups=()
depends=('libshmdata-1.3.so' 'python-socketio' 'python-aiohttp' 'python-requests' 'python-websocket-client')
makedepends=('git' 'cmake')
provides=('switcher')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+https://gitlab.com/sat-mtl/tools/switcher.git")
sha256sums=('SKIP')
noextract=()

_gitname=switcher

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  (
    cd "$srcdir/$_gitname" 
    git checkout develop
    git submodule update --init --recursive

    # Fix that switcher master forces absolute path to /usr
    sed -i '51d' wrappers/python/CMakeLists.txt
    sed -i $'51i execute_process( \
    COMMAND "${PYTHON_EXECUTABLE}" -c "if True:\
  from distutils import sysconfig as sc  \
  print(sc.get_python_lib(prefix=\'\', plat_specific=True)) \
" \
    OUTPUT_VARIABLE DESTSHARED \
    OUTPUT_STRIP_TRAILING_WHITESPACE \
    )' wrappers/python/CMakeLists.txt
  )
  cmake -S "$srcdir/$_gitname" \
        -B "$srcdir/$_gitname-build" \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DWITH_SWITCHER=ON \
        -DPLUGIN_GSOAP=OFF \
        -DPLUGIN_VRPN=OFF \
        -DCMAKE_BUILD_TYPE=Release

  cmake --build "$srcdir/$_gitname-build" 
}

package() {
  cmake --install "$srcdir/$_gitname-build" 
  install -D -m644 "$srcdir/$_gitname/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "$srcdir/$_gitname/wrappers/switcherio/server.py" "${pkgdir}/usr/bin/switcherio-server"
}
