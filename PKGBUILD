# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=appimage-git
_gitname=AppImageKit
pkgdesc="Package desktop applications as AppImages that run on common Linux-based operating systems, such as RHEL, CentOS, Ubuntu, Fedora, debian and derivatives."
pkgver=r458.acbd8bc
pkgrel=1
arch=('i686' 'x86_64')
url="http://appimage.org"
license=('MIT')
depends=('fuse' 'glib2' 'glibc' 'binutils' 'coreutils' 'zlib' 'lz4' 'zsync' 'inotify-tools' 'openssl' 'libarchive' 'xz')
makedepends=('git')
provides=('appimage')
conflicts=('appimage')
options=('!strip')
install="$pkgname.install"
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

  ./build.sh --clean

  sed -i "s/find /#find /g" build-appdirs.sh

  # Generate appimaged.service file
  echo "[Unit]" > appimaged.service
  echo "Description=AppImage daemon" >> appimaged.service
  echo "After=basic.target" >> appimaged.service
  echo "[Service]" >> appimaged.service
  echo "ExecStart=/usr/bin/appimaged" >> appimaged.service
  echo "Restart=always" >> appimaged.service
  echo "RestartSec=5s" >> appimaged.service
  echo "StartLimitInterval=0" >> appimaged.service
  echo "[Install]" >> appimaged.service
  echo "WantedBy=graphical.target" >> appimaged.service
}

build() {
  cd "${srcdir}/${_gitname}"
  ./build.sh --no-dependencies --use-shared-libs

  # Copy metainfo files
  mkdir -p appimagetool.AppDir/usr/share/metainfo/
  mkdir -p appimaged.AppDir/usr/share/metainfo/

  cp resources/usr/share/metainfo/appimagetool.appdata.xml appimagetool.AppDir/usr/share/metainfo/
  cp resources/usr/share/metainfo/appimaged.appdata.xml appimaged.AppDir/usr/share/metainfo/

  # Generate appimage files
  appimagetool.AppDir/AppRun -n appimagetool.AppDir appimagetool
  appimagetool.AppDir/AppRun -n appimaged.AppDir appimaged
}

package(){
  cd "$srcdir/${_gitname}"

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/appimage
  mkdir -p $pkgdir/usr/lib/systemd/user/

  cp appimagetool $pkgdir/usr/bin/
  cp appimaged $pkgdir/usr/bin/

  cp AppRun.c $pkgdir/usr/share/appimage/
  cp README.md $pkgdir/usr/share/appimage/

  cp appimaged.service $pkgdir/usr/lib/systemd/user/
}
