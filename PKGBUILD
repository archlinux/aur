# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=minuimus
pkgver="4.1"
pkgrel=2
pkgdesc="file optimiser: makes files smaller without compromising content"
arch=(x86_64)
url="https://birds-are-nice.me/software/minuimus.html"
license=('GPL')
depends=(
  'advancecomp' # AUR
  'brotli'
  'glibc'
  'gif2apng' # AUR
  'gif2png'
  'gifsicle'
  'imagemagick'
  'jpegoptim'
  'libjpeg'
  'libwebp'
  'mupdf-tools'
  'optipng'
  'p7zip'
  'perl'
  'poppler'
  'qpdf'
  'unrar'
  'libwebp'
  'zip'
  'zlib'
)
optdeps=(
  'jbigkit'
  'leanify'        # AUR
  'png22pnm'       # AUR
  'pngout'         # AUR
  'pdfsizeopt-git' # AUR
)
source=("${pkgname}_${pkgver}.zip::${url//.html/.zip}"
        "minuimus_leanify_keep_icc.patch")
sha256sums=('9c1e2f1fd4a56d231e582f9fd6ba5f53dfc1165728638530e960bd1e562c1855'
            '8e4428e32dd1910726174573dd2fd7e25c328af0e5b4cc756b5dd8d4bc6445cf')

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
