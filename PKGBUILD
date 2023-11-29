# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor rtfreedman (rob<d0t>til<d0t>freedman<aT>gmail<d0t>com
# 

pkgname=easytag-git
_gitname=easytag
pkgver=2.4.3.r155.ge7586fc
pkgrel=1
pkgdesc="Utility for viewing and editing tags for most audio formats - git version"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
url='http://projects.gnome.org/easytag/'
depends=('id3lib' 'taglib' 'libid3tag' 'flac' 'speex' 'opusfile' 'wavpack')
makedepends=('git' 'intltool' 'appdata-tools' 'autoconf-archive' 'yelp-tools')
provides=('easytag')
conflicts=('easytag')
source=("git+https://gitlab.gnome.org/GNOME/$_gitname.git")
sha1sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/^easytag-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_gitname"
  sed "s/(\[EasyTAG\], \[\([0-9]\).\([0-9]\).\([0-9]\)\],/(\[EasyTAG\], [\1.\2.\3-$(git rev-list --count master).$(git rev-parse --short master)], /" -i configure.ac
  ./autogen.sh
}

build() {
  cd "$_gitname"
  CXXFLAGS="$CXXFLAGS -Wno-error=deprecated-declarations -Wno-error"
  # Workaround for gcc 7 
  CFLAGS="$CFLAGS -Wno-error"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="${pkgdir}" install
}
