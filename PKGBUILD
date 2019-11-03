# Maintainer: JP Cimalando <jp-dev@inbox.ru>
# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=appimage-git
_gitname=AppImageKit
pkgdesc="Package desktop applications as AppImages that run on common Linux-based operating systems, such as RHEL, CentOS, Ubuntu, Fedora, debian and derivatives."
pkgver=r1597.801e789
pkgrel=1
arch=('i686' 'x86_64')
url="http://appimage.org"
license=('MIT')
depends=('fuse' 'glib2' 'glibc' 'binutils' 'coreutils' 'zlib' 'lz4' 'zsync' 'inotify-tools' 'openssl' 'libarchive' 'xz' 'cairo')
makedepends=('git' 'cmake' 'wget' 'vim' 'desktop-file-utils')
provides=('appimage')
conflicts=('appimage')
options=('!strip')
install=
source=('git://github.com/probonopd/AppImageKit')
md5sums=('SKIP')

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

  ./build.sh --clean

  sed -i "s/ctest -V/echo 'Skip Tests...'/g" build.sh
}

build() {
  cd "${srcdir}/${_gitname}"
  ./build.sh --no-dependencies --use-shared-libs

  # Copy metainfo files
  mkdir -p appimagetool.AppDir/usr/share/metainfo/

  cp resources/usr/share/metainfo/appimagetool.appdata.xml appimagetool.AppDir/usr/share/metainfo/

  # Generate appimage files
  cd build/out
  appimagetool.AppDir/AppRun -n appimagetool.AppDir appimagetool
}

package(){
  cd "$srcdir/${_gitname}"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/appimage

  cp build/out/appimagetool "$pkgdir"/usr/bin/

  cp src/AppRun.c "$pkgdir"/usr/share/appimage/
  cp README.md "$pkgdir"/usr/share/appimage/

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
