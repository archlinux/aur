# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=lib32-qtwebkit
pkgver=2.3.4
pkgrel=1
pkgdesc='An open source web browser engine (Qt4 port) (32-bit)'
arch=('x86_64')
url='http://trac.webkit.org/wiki/QtWebKit'
license=('LGPL2.1' 'GPL3')
depends=("${pkgname#lib32-}" 'lib32-qt4' 'lib32-systemd' 'lib32-gst-plugins-base-libs')
makedepends=('gperf' 'python2' 'ruby' 'git' 'lib32-mesa')
_qtver=4.8.7
source=("https://sources.archlinux.org/other/packages/${pkgname#lib32-}/${pkgname#lib32-}-${pkgver}.tar.xz"
        "https://download.qt.io/archive/qt/4.8/${_qtver}/qt-everywhere-opensource-src-${_qtver}.tar.gz"
        'use-python2.patch'
        'qtwebkit-gcc5.patch'
        'fix-execinfo.patch'
        'fix-mallinfo.patch'
        'fix-saturated_arithmetic.patch'
        'qwebview.patch')
sha512sums=('026378b18e91351def37c667e383a3c9f4fc07be92522957038afde66a5bc42d79c5bec0cbcbd800a575a88aa4b93f4e7fca1fe05312355bb05b1eec2b9742ce'
            'f9f81a2e7205e1fd05c8d923dc73244f29aa33f951fa6b7c5c8193449328b37084796b9b71ad0c317e4e6fd00017c10ea5d67b1b2032551cde00548522218125'
            '725f6a033ebc19b0b95eb830a3177b902182c97e5eaa108f7a75c717c68640ef4fb643fbc5e20279f605a0d181f711078da382f734c187796b600c279bf23db0'
            'b65bcb72418908bd4de8a2e6750b774d0d2f1a4f28259b57cfb438c35eee6feefe368a8225bb449db56e3da9b4a5e16521dabf08ae8fdad20eb981231ae7b73b'
            '2d6ff61589f1a0f472de180144725786c8bb82f6f5e50a16c4043a7576529f3a84104c6aef2eecf4b92daa43a9ce12afb8bc28382de655b4d544daf2b6db1640'
            '00c7be18755a52c7b2b5e7b115f1a117e6147b2537386697517471a31dadb3391ed7e7391c7a7e66819ed0803b51e78cd62e9ab2242a20ca17f2166d0a24e039'
            '5e0271a8edcc74d7ffdaace4086fcbcaa8c3133e42b22bd35a5b4d6a7fc47677b49f072807829425c24520395eccb7c3bc323e2de4984bdc0029b81999a75037'
            'f3d936f7c3ef1751a2c7cf52dd7f7e4da64158ae3298f4cb598957aa7fd05db566ebefc55a124d26e241c6814a55eb3bbe717c5ae265dcfd4c56a0fae3df1241')

prepare() {
  cd ${pkgname#lib32-}-${pkgver}
  patch -p1 -i "${srcdir}"/use-python2.patch

  # Fix build with GCC ≥ 5, private browsing and rpath derp (LFS/Fedora)
  patch -p1 -i "$srcdir"/qtwebkit-gcc5.patch
  
  # Include patches from Void Linux to fix additional issues and appease GCC 6.
  patch -p1 -i "$srcdir"/fix-execinfo.patch
  patch -p1 -i "$srcdir"/fix-mallinfo.patch
  patch -p1 -i "$srcdir"/fix-saturated_arithmetic.patch
  
  cd ../qt-everywhere-opensource-src-${_qtver}
  patch -p1 -i "${srcdir}"/qwebview.patch
}

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export CXXFLAGS+=" -std=gnu++98" # Mirror QT4
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
#  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd ${pkgname#lib32-}-${pkgver}

  export QTDIR=/usr
  export PATH="/usr/lib/qt4/bin:$PATH"
  Tools/Scripts/build-webkit --qt --release \
    --makeargs="${MAKEFLAGS}" \
    --prefix=/usr \
    --install-libs=/usr/lib32 \
    --no-webkit2 \
    --qmakearg="QMAKE_CFLAGS_ISYSTEM= " \
    --qmakearg="QMAKE_CFLAGS_RELEASE='$CFLAGS'" \
    --qmakearg="QMAKE_CXXFLAGS_RELEASE='$CXXFLAGS'" \
    --qmakearg="QMAKE_LFLAGS_RELEASE='$LDFLAGS'" 

  # Build the QWebView plugin (FS#27914)
  cd ../qt-everywhere-opensource-src-${_qtver}/tools/designer/src/plugins/qwebview
  qmake-qt4 QMAKE_CFLAGS_ISYSTEM= \
            QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
            QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
            QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd ${pkgname#lib32-}-${pkgver}
  make INSTALL_ROOT="${pkgdir}" -C WebKitBuild/Release install

  cd ../qt-everywhere-opensource-src-${_qtver}/tools/designer/src/plugins/qwebview
  make INSTALL_ROOT="${pkgdir}" install
  # Move plugin to final destination.
  mv ${pkgdir}/usr/lib/* ${pkgdir}/usr/lib32

  # Remove conflicting files.
  rm -rf "${pkgdir}"/usr/{include,lib,share}

  # Fix wrong path in prl file
  sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' "${pkgdir}"/usr/lib32/libQtWebKit.prl
}
