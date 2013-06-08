# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=evas_generic_loaders-git
_pkgname=evas_generic_loaders
pkgver=1.7.99.92.5c4445b
pkgrel=1
pkgdesc="Loaders for Evas using the 'generic' module - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL2')
depends=('efl-git' 'poppler' 'libraw' 'libspectre' 'librsvg' 'gstreamer0.10')
makedepends=('git' 'gstreamer0.10-base')
optdepends=('gstreamer0.10-base-plugins: Video thumbnails'
            'gstreamer0.10-good-plugins: Video thumbnails'
            'gstreamer0.10-bad-plugins: Video thumbnails'
            'gstreamer0.10-ugly-plugins: Video thumbnails'
            'gstreamer0.10-ffmpeg: Video thumbnails')
provides=('evas_generic_loaders')
conflicts=('evas_generic_loaders' 'evas_generic_loaders-svn')
options=('!libtool' 'debug')
source=("git://git.enlightenment.org/core/$_pkgname.git")
md5sums=('SKIP')
buildflags="-fvisibility=hidden"

pkgver() {
  cd "$srcdir/$_pkgname"
  
  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done
  
  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  
  ./autogen.sh --prefix=/usr
  
  make
}

package() {
  cd "$srcdir/$_pkgname"
  
  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
  install -Dm644 NEWS "$pkgdir/usr/share/$pkgname/NEWS"
  install -Dm644 ChangeLog "$pkgdir/usr/share/$pkgname/ChangeLog"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  sed -n '1,/PARTICULAR PURPOSE/p' COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
