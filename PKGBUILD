# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=evas_generic_loaders
pkgname=$_pkgname-git
pkgver=1.17.99.202.ge8d5347
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
            'libreoffice: Office document thumbnails')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('debug')
source=("git://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local efl_version=$(grep -m1 EFL_VERSION configure.ac | awk -F [][] '{print $2 "." $4 "." $6}')
  efl_version=$(awk -F , -v efl_version=${efl_version%.} '/^AC_INIT/ {gsub(/efl_version/, efl_version); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "%s.%s.g%s" "$efl_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README
}
