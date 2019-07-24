# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer-git
pkgver=1.17.0.1.18629.b50abd9f4
pkgrel=1
pkgdesc='GStreamer Multimedia Framework (Git version)'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://gstreamer.freedesktop.org/'
depends=('libxml2' 'glib2' 'libcap' 'libunwind' 'libelf')
optdepends=('sh: feedback script')
makedepends=('intltool' 'pkgconfig' 'gtk-doc' 'gobject-introspection' 'git')
provides=('gstreamer='$pkgver)
conflicts=('gstreamer')
options=('!libtool')

_gitname='gstreamer'

source=('git+git://anongit.freedesktop.org/gstreamer/gstreamer')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(\[GStreamer\],\[//' | sed 's/\],\[http:\/\/bugzilla.gnome.org\/enter_bug.cgi?product=GStreamer\],\[gstreamer\])//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --enable-gtk-doc --disable-static
  make
}

#check() {
#  cd $_gitname
#  make check
#}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}
