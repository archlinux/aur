# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: jus <jus@bitgrid.net>
# Contributor: jfperini <@jfperini>

_pkgname=vocal
pkgname=$_pkgname-git
pkgver=2.0.10.beta.r0.g395cdbb
pkgrel=1
pkgdesc="Podcast Client for the Modern Desktop"
arch=('i686' 'x86_64')
url="http://www.vocalproject.net"
license=('GPL3')
depends=('libnotify' 'libxml2' 'granite' 'gtk3' 'gstreamer' 'sqlite' 'clutter-gtk' 'clutter-gst' 'webkit2gtk')
makedepends=('git' 'vala' 'cmake')
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

  # Patch
  cd data
  mv com.github.{needle-and-thread,vocalapp}.vocal.desktop
  mv com.github.needle-and-thread.vocal.appdata.xml com.github.vocalapp.vocal.desktop.appdata.xml
}

build() {
  cd $_pkgname
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr    # -DGSETTINGS_LOCALINSTALL=1 -DGSETTINGS_COMPILE=1
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir/" install
}

