# Maintainer: jus <jus@bitgrid.net>
# Contributor: jfperini <@jfperini>

pkgname=vocal-git
_gitname=vocal
pkgver=2.0-master
pkgrel=1
pkgdesc="Vocal. The podcast client for the modern free desktop."
arch=('i686' 'x86_64')
url="http://www.vocalproject.net"
license=('GPLv3')
depends=('libnotify' 'libunity' 'libxml2' 'granite' 'gtk3' 'gstreamer' 'sqlite3' 'clutter-gtk' 'icu' 'webkit2gtk')
makedepends=('git' 'vala' 'cmake')
install="$pkgname.install"
source=('git://github.com/vocalapp/vocal.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}
  echo $(git describe --tags | sed 's+v++g'|sed 's+-+.+g').$(git rev-list --count HEAD)
}

build() {
  cd ${srcdir}/${_gitname}

  # fix dependency until it is not fixed upstream
  sed -i 's/webkit2gtk-3.0/webkit2gtk-4.0/g' CMakeLists.txt

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make

}

package() {
  cd ${srcdir}/${_gitname}/build
  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
