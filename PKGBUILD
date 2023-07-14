# Maintainer: JP Cimalando <jp-dev@inbox.ru>
# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=appimage-git
_gitname=AppImageKit
pkgdesc="Package desktop applications as AppImages that run on common Linux-based operating systems, such as RHEL, CentOS, Ubuntu, Fedora, debian and derivatives."
pkgver=r1724.701b711
pkgrel=1
arch=('i686' 'x86_64')
url="http://appimage.org"
license=('MIT')
depends=('fuse' 'glib2' 'glibc' 'binutils' 'coreutils' 'zlib' 'lz4' 'zsync' 'inotify-tools' 'openssl' 'libarchive' 'xz' 'cairo')
makedepends=('git' 'cmake' 'wget' 'vim' 'desktop-file-utils' 'squashfuse')
provides=('appimage')
conflicts=('appimage')
options=('!strip')
install=
source=("git+https://github.com/AppImage/AppImageKit"
	"git+https://github.com/AppImageCommunity/libappimage")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git log | head -n 1 | cut -d" " -f2 | awk '{print substr($0,0,7)}')"
  )
}

prepare() {
  cd "${srcdir}/${_gitname}"
  git submodule init
  git config submodule.lib/libappimage.url			"${srcdir}/libappimage"
  git -c protocol.file.allow=always submodule update

  cd "${srcdir}/${_gitname}/lib/libappimage/lib"
  git submodule init
  git -c protocol.file.allow=always submodule update

}

build() {
  cd "${srcdir}/${_gitname}"
  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUSE_SYSTEM_XZ=ON \
    -DUSE_SYSTEM_SQUASHFUSE=ON \
    -DUSE_SYSTEM_LIBARCHIVE=ON \
    -DBUILD_TESTING=OFF
  make
}

package(){
  cd "$srcdir/${_gitname}"
  DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}
