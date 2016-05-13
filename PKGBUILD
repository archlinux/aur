# Maintainer: Daan van Rossum <d.r.vanrossum at gmx dot de>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=llpp
pkgver=22
_pkgname=${pkgname}-1beb003
pkgrel=3
pkgdesc='Lightweight, fast and featureful PDF viewer based on MuPDF'
arch=('i686' 'x86_64')
url='http://repo.or.cz/w/llpp.git'
license=('custom')
depends=('openjpeg2' 'jbig2dec' 'freetype2' 'harfbuzz' 'libjpeg' 'openssl' 'zlib' 'desktop-file-utils' 'mesa')
makedepends=('ocaml' 'libmupdf')
source=(http://repo.or.cz/llpp.git/snapshot/1beb003ca0f4ed90fda2823cb07c2eb674fc3ca4.tar.gz)
sha256sums=('92723eabd3521cb16d60b8dd6191ec8737240f35bf1fa9a0f82f32f8fd8f32a4')

optdepends=(
  # llpp
  'xsel: Text selection'
  # llppac
  'file: automatic file type recognition'
  "gzip: handling of MIME types 'application/x-{gzip,compress}'"
  "xz: handling of MIME type 'application/x-xz'"
  "bzip2: handling of MIME type 'application/x-bzip2'"
  'djvulibre: djvu conversion'
  'ghostscript: ps, dvi, and djvu conversion'
  'princexml: html conversion'
  'unoconv: conversion of office documents'
  'librsvg: preferred option for svg conversion'
  'inkscape: alternative option for svg conversion'
  'imagemagick: image conversion'
  'antiword: conversion of Microsoft Word (.doc) documents (option 2)'
  'zip: png and jpeg conversion'
  'texlive-core: dvi conversion'
)
options=('!strip')

build() {
  cd $_pkgname
  sed -i -e 's+-I \$srcdir/mupdf/include -I \$srcdir/mupdf/thirdparty/freetype/include+-I /usr/include/freetype2+' build.sh
  sed -i -e 's+-lmupdf +-lfreetype -lz -lharfbuzz -ljbig2dec -lopenjp2 -ljpeg -lmupdf +' build.sh
  sed -i -e 's+-L\$srcdir/mupdf/build/native ++' build.sh
  sh build.sh build/
}

package() {
  cd $_pkgname
  install -Dm755 build/llpp "$pkgdir"/usr/bin/llpp
  install -Dm755 misc/llppac "$pkgdir"/usr/bin/llppac

  install -Dm0644 misc/llpp.desktop "$pkgdir"/usr/share/applications/llpp.desktop
  install -Dm0644 README "$pkgdir"/usr/share/licenses/llpp/README
}
