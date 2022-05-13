# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=caj2pdf-qt
pkgver=0.1.4
pkgrel=2
pkgdesc='CAJ 转 PDF 转换器（GUI 版本）'
arch=('x86_64')
url='https://caj2pdf-qt.sainnhe.dev'
license=('GPL')
depends=('qt6-base' 'gcc-libs' 'glibc' 'icu' 'zstd' 'glib2' 'systemd-libs' 'zlib' 'double-conversion' 'libb2' 'pcre2' 'libglvnd' 'fontconfig' 'libx11' 'libxkbcommon' 'libpng' 'harfbuzz' 'md4c' 'freetype2' 'pcre' 'xz' 'lz4' 'libcap' 'libgcrypt' 'expat' 'libxcb' 'dbus' 'graphite' 'bzip2' 'brotli' 'libgpg-error' 'libxau' 'libxdmcp' 'openssl' 'jbig2dec' 'mupdf-tools')
makedepends=('git' 'python' 'cmake')
provides=('caj2pdf-qt')
conflicts=('caj2pdf-qt')
source=("${pkgname}::https://github.com/sainnhe/caj2pdf-qt/archive/refs/tags/v${pkgver}.tar.gz"
        'dev.sainnhe.caj2pdf-qt.desktop')
md5sums=('a8701f20d3ee0ec30d220abd7b4114f1'
         '3068f1cbf4fb1d8c04a9f8afb3fb7d54')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rmdir caj2pdf mupdf && git clone --depth=1 https://github.com/caj2pdf/caj2pdf.git
  cd "${srcdir}/${pkgname}-${pkgver}/caj2pdf/lib"
  gcc -Wall -fPIC -shared -o libjbigdec.so jbigdec.cc JBigDecode.cc
  gcc -Wall -fPIC -shared -o libjbig2codec.so decode_jbig2data_x.cc
  cd "${srcdir}/${pkgname}-${pkgver}/caj2pdf"
  git apply ../caj2pdf.diff
  python3 -m venv venv
  ./venv/bin/python -m pip install pypdf2 pyinstaller
  ./venv/bin/pyinstaller -F caj2pdf
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build && cd build && cmake .. && make -j$(nproc)
}

package() {
  install -Dm 644 "${srcdir}/dev.sainnhe.caj2pdf-qt.desktop" "${pkgdir}/usr/share/applications/dev.sainnhe.caj2pdf-qt.desktop"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/icons/convert.png" "${pkgdir}/usr/share/${pkgname}/icon.png"
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/build/caj2pdf" "${pkgdir}/usr/share/${pkgname}/caj2pdf"
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/caj2pdf/dist/caj2pdf" "${pkgdir}/usr/share/${pkgname}/external/caj2pdf"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/caj2pdf/lib/libjbigdec.so" "${pkgdir}/usr/share/${pkgname}/external/libjbigdec.so"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/caj2pdf/lib/libjbig2codec.so" "${pkgdir}/usr/share/${pkgname}/external/libjbig2codec.so"
  ln -s /usr/bin/mutool "${pkgdir}/usr/share/${pkgname}/external/mutool"
  chmod a+w "${pkgdir}/usr/share/${pkgname}/external"
}
