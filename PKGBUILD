# Maintainer: Chris Nixon <chris.nixon@sigma.me.uk>
pkgname="tesseract-ocr-git"
pkgver=4.00.00dev.r677.gd962d344
pkgrel=1
pkgdesc="OCR Engine developed at HP Labs and now sponsored by Google."
arch=('i686' 'x86_64')
url="https://code.google.com/p/tesseract-ocr/"
license=('Apache')
groups=()
depends=('gcc-libs' 'libtiff' 'libpng' 'leptonica' 'giflib' 'libjpeg')
optdepends=('cairo' 'icu' 'pango')
source=('tesseract-ocr::git+https://github.com/tesseract-ocr/tesseract')
makedepends=('git' 'pango' 'icu' 'cairo' 'autoconf-archive')
provides=('tesseract')
conflicts=('tesseract')
sha256sums=('SKIP')

pkgver() {
  cd tesseract-ocr
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

pkgver() {
  cd tesseract-ocr
  echo $(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
  cd tesseract-ocr
  git checkout master
  ./autogen.sh
  ./configure --prefix=/usr
  make clean
  make
}

package() {
  cd tesseract-ocr
  make DESTDIR="$pkgdir/" install
}
