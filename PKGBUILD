# Maintainer: Daan van Rossum <d.r.vanrossum at gmx dot de>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=llpp
pkgver=21
_pkgname=${pkgname}-f376f80
pkgrel=3
pkgdesc='Lightweight, fast and featureful PDF viewer based on MuPDF'
arch=('i686' 'x86_64')
url='http://repo.or.cz/w/llpp.git'
license=('custom')
depends=('mupdf' 'openssl' 'openjpeg2' 'libx11' 'desktop-file-utils')
makedepends=('ocaml' 'ninja' 'ocaml-lablgl')
source=(http://repo.or.cz/w/llpp.git/snapshot/f376f8000cdf01fcc0ae3aa1fed99f193d6e7909.tar.gz)
install=llpp.install
sha256sums=('SKIP')

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
  sed -i -e 's/openjpeg/openjp2 -lX11/' configure.sh
  sh configure.sh .
  echo "mujs=-lmujs" >>.config
  ninja $srcdir/$_pkgname/build/llpp.custom
}

package() {
  cd $_pkgname
  install -Dm755 build/llpp.custom "$pkgdir"/usr/bin/llpp
  install -m755 misc/llppac "$pkgdir"/usr/bin/llppac

  install -Dm0644 misc/llpp.desktop "$pkgdir"/usr/share/applications/llpp.desktop
  install -Dm0644 README "$pkgdir"/usr/share/licenses/llpp/README
}
