# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: jus <jus@bitgrid.net>
# Contributor: jfperini <@jfperini>

pkgname=vocal-git
pkgver=2.4.2.r415.2cec1f1
pkgrel=1
pkgdesc="Powerful, beautiful and simple podcast client for Pantheon"
arch=('x86_64')
url="https://www.vocalproject.net"
license=('GPL3')
depends=('clutter-gst' 'clutter-gtk' 'granite' 'gst-libav' 'gst-plugins-good' 'gvfs' 'libnotify' 'webkit2gtk')
makedepends=('cmake' 'git' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/needle-and-thread/vocal.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "%s.r%s.%s" "$(git tag --sort=-version:refname | head -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname

  rm -rf build
  mkdir build

  # Patch: fix build with granite 6 by disabling the About dialog (https://github.com/needle-and-thread/vocal/issues/483)
  sed -i 's/controller.app.show_about (this);//' src/MainWindow.vala
}

build() {
  cd $pkgname/build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr   # -DGSETTINGS_COMPILE=0 -DGSETTINGS_LOCALINSTALL=1
  make
}

package() {
  cd $pkgname/build
  make DESTDIR="$pkgdir/" install
}

