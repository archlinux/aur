_pkgname=libav
pkgname=$_pkgname-git-no-libs
pkgver=v12_dev0.r2989.ga8fce24
pkgrel=1
pkgdesc='Open source audio and video processing tools'
arch=('i686' 'x86_64')
url='https://libav.org/'
license=('LGPL')
depends=('zlib' 'bzip2' 'openssl')
makedepends=('git' 'yasm')
source=("$_pkgname"::'git://git.libav.org/libav.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"

  ./configure \
    --prefix=/usr \
    --enable-openssl \
    --enable-nonfree

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{include,lib}
}
