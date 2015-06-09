# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Florian Pritz <flo@xssn.at>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=qt4-x11, repo=utopic
# vercheck-archlinux: name=lib32-qt4, repo=multilib, arch=x86_64

pkgname=lib32-qt4-ubuntu
_ubuntu='4.8.6+dfsg-1ubuntu2'
pkgver=4.8.6
pkgrel=1
pkgdesc='A cross-platform application and UI framework (32-bit)'
arch=('x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL')
depends=(lib32-{fontconfig,sqlite3,alsa-lib,glib2,libdbus,openssl}
         lib32-lib{png,tiff,mng,gl,sm,xrandr,xv,xi} qt4-ubuntu)
optdepends=('lib32-libxinerama: Xinerama support'
            'lib32-libxcursor: Xcursor support'
            'lib32-libxfixes: Xfixes support')
makedepends=(cups gcc-multilib lib32-{mesa,libcups,libxfixes,gtk2})
options=('staticlibs') # libQtUiTools builds as static only FS#36606
provides=(lib32-qtwebkit lib32-qt4)
replaces=(lib32-qtwebkit 'lib32-qt<=4.8.4')
conflicts=(lib32-qtwebkit lib32-qt lib32-qt4)
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/4.8/${pkgver}/${_pkgfqn}.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/qt4-x11_${_ubuntu}.debian.tar.gz"
        kubuntu_14_systemtrayicon.diff)
sha512sums=('c2d07c3cf9d687cb9b93e337c89df3f0055bd02bc8aa5ecd55d3ffb238b31a4308aeabc3c51a4f94ac76a1b00796f047513d02e427ed93ae8dd99f836fff7692'
            '7f403a580462f32b002d43d9b9c6e9d365c0f98c131a70806e32e865d9a7bfd97064234258299a99c2675d50fba8efb78e4066429b6faefae820e307ad5f42a6'
            'c987f478e6da84e26ef5085c2a354cf085227e75af84d24b1497cfb046cfed89858bfed21850cf9dc0f5df2b66f9eed3ca8955a8c9df81cdddc9b98257231319')

prepare() {
  cd $srcdir/$_pkgfqn

  # Apply Ubuntu patches
  patch -p1 -i ../kubuntu_14_systemtrayicon.diff

  export QT4DIR=$srcdir/$_pkgfqn
  export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

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
    -libdir /usr/lib32 \
    -plugindir /usr/lib32/qt/plugins \
    -importdir /usr/lib32/qt/imports \
    -datadir /usr/share/qt \
    -translationdir /usr/share/qt/translations \
    -sysconfdir /etc \
    -system-sqlite \
    -no-phonon \
    -no-phonon-backend \
    -webkit \
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

  rm -rf "${pkgdir}"/usr/{include,share,bin,tests}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
