# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=caj2pdf-qt
pkgver=0.1.6
_caj2pdf_hash='acce7c9ffd919e67b447e7baa8df2ae17b450dd4'
pkgrel=1
pkgdesc='CAJ 转 PDF 转换器（GUI 版本）'
arch=('x86_64')
url='https://caj2pdf-qt.sainnhe.dev'
license=('GPL')
depends=('glibc'
         'jbig2dec'
         'mupdf-tools'
         'zlib'
         'mupdf-tools'
         'qt5-base'
         'gcc-libs'
         'libglvnd'
         'libpng'
         'harfbuzz'
         'md4c'
         'double-conversion'
         'icu'
         'pcre2'
         'zstd'
         'glib2'
         'freetype2'
         'graphite'
         'libcap'
         'libgcrypt'
         'xz'
         'lz4'
         'libx11'
         'bzip2'
         'brotli'
         'libgpg-error'
         'libxcb'
         'libxau'
         'libxdmcp')
makedepends=('git' 'python' 'cmake')
provides=('caj2pdf-qt')
conflicts=('caj2pdf-qt')
source=("${pkgname}::https://github.com/sainnhe/caj2pdf-qt/archive/refs/tags/v${pkgver}.tar.gz"
        "caj2pdf::https://github.com/caj2pdf/caj2pdf/archive/${_caj2pdf_hash}.zip"
        'dev.sainnhe.caj2pdf-qt.desktop')
md5sums=('337c441d8102cf2f5f45124ab938952a'
         '8fc97b57370fd00895049a80db37dd28'
         '3068f1cbf4fb1d8c04a9f8afb3fb7d54')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf caj2pdf
  mv "../caj2pdf-${_caj2pdf_hash}" ./caj2pdf
  cd caj2pdf
  git init
  git add .
  git config user.name "Anonymous"
  git config user.email "noreply@localhost"
  git commit -m "Init" || cd "."
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./build-unix.sh cli
  ./build-unix.sh qt
}

package() {
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/build/caj2pdf" "${pkgdir}/usr/share/${pkgname}/caj2pdf"
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/caj2pdf/dist/caj2pdf" "${pkgdir}/usr/share/${pkgname}/external/caj2pdf"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/caj2pdf/lib/libjbigdec.so" "${pkgdir}/usr/share/${pkgname}/external/libjbigdec.so"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/caj2pdf/lib/libjbig2codec.so" "${pkgdir}/usr/share/${pkgname}/external/libjbig2codec.so"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/caj2pdf-qt/caj2pdf "${pkgdir}/usr/bin/caj2pdf-qt"
  ln -s /usr/bin/mutool "${pkgdir}/usr/share/${pkgname}/external/mutool"
  install -Dm 644 "${srcdir}/dev.sainnhe.caj2pdf-qt.desktop" "${pkgdir}/usr/share/applications/dev.sainnhe.caj2pdf-qt.desktop"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/icons/convert.png" "${pkgdir}/usr/share/${pkgname}/icon.png"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPL3"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  chmod a+w "${pkgdir}/usr/share/${pkgname}/external"
}
