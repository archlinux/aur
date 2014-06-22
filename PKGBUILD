# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=evas_generic_loaders
pkgname=$_pkgname-git
pkgver=1.10.99.138.3236aeb
pkgrel=1
pkgdesc="Evas external binary executable loaders - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL2')
depends=('efl-git' 'poppler' 'libraw' 'libspectre' 'librsvg')
makedepends=('git')
optdepends=('gst-plugins-base: Video thumbnails'
            'gst-plugins-good: Video thumbnails'
            'gst-plugins-bad: Video thumbnails'
            'gst-plugins-ugly: Video thumbnails'
            'gst-libav: Video thumbnails'
            'libreoffice-common: Office document thumbnails')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('debug')
source=("git://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for _i in v_maj v_min v_mic; do
    local v_ver=${v_ver#.}.$(grep -m1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  v_ver=$(awk -F , -v v_ver=$v_ver '/^AC_INIT/ {gsub(/v_ver/, v_ver); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  sed -n '1,/PARTICULAR PURPOSE/p' COPYING > "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
