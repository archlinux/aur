# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=gst-devtools-git
pkgver=0.0.1.1.635.dae0c4e
pkgrel=1
pkgdesc="Development and debugging tools for GStreamer: validate and mediainfo."
arch=('i686' 'x86_64')
license=('LGPL')
provides=('gst-devtools='$pkgver)
conflicts=('gst-devtools')
url="http://gstreamer.freedesktop.org/"
depends=('gstreamer')
makedepends=('git')
options=(!libtool !emptydirs)

source='git+git://anongit.freedesktop.org/gstreamer/gst-devtools'
sha256sums=('SKIP')

_gitname='gst-devtools'

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT validate/configure.ac | sed 's/AC_INIT(Gst-Validate, //' | sed 's/,//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
  cd $_gitname/validate
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
  
  # needs "gee-1.0", which is not existent
  #cd ../mediainfo
  #./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  #make
}

package() {
  cd $_gitname/validate
  make DESTDIR="${pkgdir}" install
  
  #cd ../mediainfo
  #make DESTDIR="${pkgdir}" install
}
