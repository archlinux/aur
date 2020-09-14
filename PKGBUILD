# Maintainer: Zhaofeng Li <hello@zhaofeng.li>

# The custom Xpdf binaries are only meant to be used by Zotero and will not
# be added to your PATH.

_commit=b71fe1f7213e261882703b0aee97c48591430c18

pkgname=zotero-xpdf
pkgdesc="A modified version of Xpdf used by Zotero"
pkgver=4.02
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/zotero/cross-xpdf"
license=('GPL')
depends=('libpaper' 'fontconfig' 'zlib' 'libpng')
makedepends=('cmake' 'git')

source=(
  "${pkgname}::git+https://github.com/zotero/cross-xpdf.git#commit=${_commit}"
  "https://xpdfreader-dl.s3.amazonaws.com/xpdf-${pkgver}.tar.gz"
)
md5sums=('SKIP'
         '22e0d7940e62c538ccdd75f75dca0acf')

prepare() {
  cd "xpdf-${pkgver}"
  cp ../${pkgname}/pdftotext.cc xpdf/pdftotext.cc
  cp ../${pkgname}/GlobalParams.h xpdf/GlobalParams.h
  cp ../${pkgname}/GlobalParams.cc xpdf/GlobalParams.cc
  cp ../${pkgname}/gfile.h goo/gfile.h
  cp ../${pkgname}/gfile.cc goo/gfile.cc

  # Well, don't point your finger at me - This is in their original Dockerfile
	sed -i "/^int\smain(/a if(argc!=3 || argv[1][0]=='-' || argv[2][0]=='-') {fprintf(stderr,\"This is a custom xpdf pdfinfo build. Please use the original version!\\\\n%s\\\\n%s\\\\npdfinfo <PDF-file> <output-file>\\\\n\",xpdfVersion,xpdfCopyright); return 1;} else {freopen( argv[argc-1], \"w\", stdout); argc--;}" xpdf/pdfinfo.cc
}

build() {
  cd "xpdf-${pkgver}"
  mkdir -p build
  cd build

  cmake .. -DCMAKE_EXE_LINKER_FLAGS="-pthread"

  make pdfinfo pdftotext
}

package() {
  cd "${srcdir}/xpdf-${pkgver}/build"

  TARGET="${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${TARGET}"

  install -Dm755 xpdf/pdfinfo "${TARGET}/pdfinfo"
  install -Dm755 xpdf/pdftotext "${TARGET}/pdftotext"
}

# vim: et ts=2 sw=2:
