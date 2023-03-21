# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=minuimus
pkgver="3.8.1"
pkgrel=3
pkgdesc="file optimiser: makes files smaller without compromising content"
arch=(x86_64)
url="https://birds-are-nice.me/software/minuimus.html"
license=('GPL')
depends=(
  'brotli'
  'gif2png'
  'gifsicle'
  'imagemagick'
  'jpegoptim'
  'libjpeg'
  'libwebp'
  'mupdf-tools'
  'optipng'
  'p7zip'
  'poppler'
  'qpdf'
  'unrar'
  'zip'
)
optdeps=(
  'jbigkit'
  'leanify'        # AUR
  'png22pnm'       # AUR
  'pngout'         # AUR
  'pdfsizeopt-git' # AUR
)
source=("https://birds-are-nice.me/software/minuimus.zip"
        "minuimus_leanify_keep_icc.patch")
sha256sums=('50360a6ce8570bd8252c342517d23853af59164492b3e280147ea8120f39efc0'
            '463cbe3a0f3aa53e3dfccd515a53d101905b9d5beb98ec80b140cadd90e88ce0')

prepare() {
  cd "$srcdir"
  echo "Fixing minuimus.pl for imagemagick binary identify-im6 => identify and convert-im6 => convert"
  sed -i -e 's/convert-im6/convert/g' minuimus.pl
  sed -i -e 's/identify-im6/identify/g' minuimus.pl

  echo "Fixing minuimus.pl for leanify spurious option --keep-icc"
  patch minuimus.pl minuimus_leanify_keep_icc.patch
}

build() {
  cd "$srcdir"
  make all
}

package() {
  cd "$srcdir"
  # The makefile doesn't have any method for setting prefix, so we do the install section here
  mkdir -p "${pkgdir}/usr/bin/"
  cp minuimus_def_helper "${pkgdir}/usr/bin/minuimus_def_helper"
  cp minuimus_woff_helper "${pkgdir}/usr/bin/minuimus_woff_helper"
  cp cab_analyze "${pkgdir}/usr/bin/cab_analyze"
  cp minuimus.pl "${pkgdir}/usr/bin/minuimus.pl"
  cp minuimus_swf_helper "${pkgdir}/usr/bin/minuimus_swf_helper"
}
