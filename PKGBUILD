# Maintainer: Michał Lisowski <lisu@riseup.net>
# Contributor: Florian Pritz <flo@xssn.at>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgbasename=qt4
pkgname=lib32-$_pkgbasename
pkgver=4.8.7
pkgrel=8
pkgdesc='A cross-platform application and UI framework (32-bit)'
arch=('x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL')
depends=('lib32-fontconfig' 'lib32-sqlite' 'lib32-alsa-lib' 'lib32-glib2'
         'lib32-dbus' 'lib32-openssl' 'lib32-libpng' 'lib32-libtiff'
         'lib32-libmng' 'lib32-libgl' 'lib32-libsm' 'lib32-libxrandr'
         'lib32-libxv' 'lib32-libxi' $_pkgbasename)
optdepends=('lib32-libxinerama: Xinerama support'
            'lib32-libxcursor: Xcursor support'
            'lib32-libxfixes: Xfixes support'
            'lib32-sni-qt: StatusNotifierItem (AppIndicators) support')
makedepends=('cups' 'clang' 'gcc-multilib' 'lib32-mesa' 'lib32-libcups'
             'lib32-libxfixes' 'lib32-gtk2')
options=('staticlibs') # libQtUiTools builds as static only FS#36606
replaces=('lib32-qt<=4.8.4')
conflicts=(lib32-qt)
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/4.8/${pkgver}/${_pkgfqn}.tar.gz"
        "kubuntu_14_systemtrayicon.diff"
        "disable-sslv3.patch"
        "qt-everywhere-opensource-src-4.8.7-gcc6.patch")
md5sums=('d990ee66bf7ab0c785589776f35ba6ad'
         'a523644faa8f98a73f55c4aa23c114a6'
         '1803ab6313df762d807678e58fc85f53'
         '8ba77cd8f325c38daca8eadc982395a4')

export CC='clang'
export CXX='clang++'

prepare() {
  cd $srcdir/$_pkgfqn

  export QT4DIR=$srcdir/$_pkgfqn
  export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # http://blog.martin-graesslin.com/blog/2014/06/where-are-my-systray-icons/
  patch -p1 -i "${srcdir}"/kubuntu_14_systemtrayicon.diff

  # disable SSLv3
  patch -p1 -i "${srcdir}"/disable-sslv3.patch

  # patch from Fedora, otherwise webkit will not be built (FS#51523)
  patch -p1 -i "${srcdir}"/qt-everywhere-opensource-src-4.8.7-gcc6.patch

  # some of those are likely unnecessary, but I'm too lazy to find and remove them
  sed -i "/^QMAKE_LINK\s/s|g++|g++ -m32|g" mkspecs/common/g++-base.conf
  sed -i "s|-O2|${CXXFLAGS} -m32|" mkspecs/common/g++-base.conf
  sed -i "s|-O2|${CXXFLAGS} -m32|" mkspecs/common/gcc-base.conf
  sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" mkspecs/common/gcc-base-unix.conf
  sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS} -m32|g" mkspecs/common/gcc-base.conf
  sed -i "s|-Wl,-O1|-m32 -Wl,-O1|" mkspecs/common/g++-unix.conf
  sed -e "s|-O2|$CXXFLAGS -m32|" \
      -e "/^QMAKE_RPATH/s| -Wl,-rpath,||g" \
      -e "/^QMAKE_LINK\s/s|g++|g++ -m32|g" \
      -e "/^QMAKE_LFLAGS\s/s|+=|+= $LDFLAGS|g" \
      -i mkspecs/common/g++.conf
}

build() {
  cd $srcdir/$_pkgfqn
  export QT4DIR=$srcdir/$_pkgfqn
  export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure -confirm-license -opensource -v -platform linux-g++-32 \
    -prefix /usr \
    -bindir /usr/lib32/qt4/bin \
    -libdir /usr/lib32 \
    -plugindir /usr/lib32/qt4/plugins \
    -headerdir /usr/include/qt4-32 \
    -importdir /usr/lib32/qt4/imports \
    -datadir /usr/share/qt \
    -translationdir /usr/share/qt/translations \
    -sysconfdir /etc \
    -system-sqlite \
    -no-phonon \
    -no-phonon-backend \
    -no-webkit \
    -graphicssystem raster \
    -openssl-linked \
    -nomake demos \
    -nomake examples \
    -nomake docs \
    -optimized-qmake \
    -no-rpath \
    -dbus-linked \
    -reduce-relocations \
    -no-openvg

  make
}

package() {
  cd $srcdir/$_pkgfqn
  make INSTALL_ROOT=$pkgdir install

  # Fix wrong path in pkgconfig files
  find ${pkgdir}/usr/lib32/pkgconfig -type f -name '*.pc' \
    -exec perl -pi -e "s, -L${srcdir}/?\S+,,g" {} \;
  # Fix wrong path in prl files
  find ${pkgdir}/usr/lib32 -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/usr/{share,bin,tests}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
