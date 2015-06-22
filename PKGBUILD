# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=gst-plugins-good-git
pkgver=1.3.1.1.14242.077fcbc
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Good Plugins"
arch=('i686' 'x86_64')
license=('LGPL')
provides=('gst-plugins-good='$pkgver)
conflicts=('gst-plugins-good')
url="http://gstreamer.freedesktop.org/"
depends=('libpulse' 'jack' 'libsoup' 'gst-plugins-base-git' 'wavpack' 'aalib' 'taglib' 'libdv' 'libshout' 'libvpx' 'gdk-pixbuf2' 'libcaca' 'libavc1394' 'libiec61883' 'libxdamage' 'v4l-utils' 'cairo')
makedepends=('gstreamer' 'speex' 'flac' 'libraw1394')
options=(!libtool !emptydirs)

source='git://anongit.freedesktop.org/gstreamer/gst-plugins-good'
sha256sums=('SKIP')

_gitname='gst-plugins-good'

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(\[GStreamer Good Plug-ins\],\[//' | sed 's/\],\[http:\/\/bugzilla.gnome.org\/enter_bug.cgi?product=GStreamer\],\[gst-plugins-good\])//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
  cd $_gitname
  export CFLAGS="-Wno-error"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --disable-fatal-warnings
  make
}

package() {
  cd $_gitname
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
}
