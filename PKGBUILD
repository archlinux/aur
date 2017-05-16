# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: jus <jus@bitgrid.net>
# Contributor: jfperini <@jfperini>

_pkgname=vocal
pkgname=$_pkgname-git
pkgver=2.0.15.r0.g86d0456
pkgrel=1
pkgdesc="Podcast Client for the Modern Desktop"
arch=('i686' 'x86_64')
url="http://www.vocalproject.net"
license=('GPL3')
depends=('clutter-gst' 'clutter-gtk' 'dconf' 'desktop-file-utils' 'granite' 'gstreamer' 'gtk-update-icon-cache' 'gtk3' 'libnotify' 'libxml2' 'sqlite' 'webkit2gtk')
makedepends=('cmake' 'git' 'vala')
provides=($_pkgname)
conflicts=($_pkgname)
#source=($_pkgname::git://github.com/needle-and-thread/vocal.git)
source=($_pkgname::git://github.com/vocalapp/vocal.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  # Use newer version of webkit2gtk
  sed -i 's/webkit2gtk-3.0/webkit2gtk-4.0/g' CMakeLists.txt
}

build() {
  cd $_pkgname
  rm -rf build
  mkdir build

  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DGSETTINGS_COMPILE=0   # -DGSETTINGS_LOCALINSTALL=1
  make
}

package() {
  # Patch
  mv $_pkgname/build/com.github.needle-and-thread.vocal.desktop{.in,}
  mv $_pkgname/data/com.github.needle-and-thread.vocal.appdata.xml.in $_pkgname/build/com.github.needle-and-thread.vocal.appdata.xml

  cd $_pkgname/build
  make DESTDIR="$pkgdir/" install
}

