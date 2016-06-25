# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=appimage-git
_gitname=AppImageKit
pkgdesc="Package desktop applications as AppImages that run on common Linux-based operating systems, such as RHEL, CentOS, Ubuntu, Fedora, debian and derivatives."
pkgver=r325.a6efcca
pkgrel=1
arch=('i686' 'x86_64')
url="http://appimage.org"
license=('MIT')
depends=('fuse' 'glib2' 'glibc' 'binutils' 'coreutils' 'zlib' 'libpng' 'inotify-tools')
makedepends=('git' 'cmake')
provides=('appimage')
conflicts=('appimage')
options=('!strip')
source=(
  'git://github.com/probonopd/AppImageKit'
)
md5sums=(
  'SKIP'
)

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
  cmake .
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package(){
  cd "$srcdir/${_gitname}"

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/appimage

  cp AppImageAssistant $pkgdir/usr/bin/
  cp AppImageExtract $pkgdir/usr/bin/
  cp AppImageMonitor $pkgdir/usr/bin/

  cp desktopintegration $pkgdir/usr/share/appimage/
  cp AppRun.c $pkgdir/usr/share/appimage/
  cp README.md $pkgdir/usr/share/appimage/
}
