# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel at archlinux dot net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Eric Belanger <eric@archlinux.org>
pkgname=plplot510
pkgver=5.10.0
pkgrel=3
pkgdesc="A cross-platform software package for creating scientific plots"
arch=('i686' 'x86_64')
url="http://plplot.sourceforge.net/"
license=("LGPL" "custom")
depends=('libtool' 'tk')
makedepends=('cmake')
conflicts=('plplot')
optdepends=('qhull: calculating convex hulls'
            'agg: high quality rendering engine in C++'
            'swig: connects Plplot C library to Python, Java and Lua (must be present at compile time for Java)'
            'gd: ability to output png, jpeg and gif files'
            'qt4: display plots, output various formats  using the Qt UI framework'
            'wxgtk: displays plots using wxWidgets library'
            'freetype2: enables use of ttf fonts for some drivers'
            'ttf-freefont: enables use of ttf fonts for some drivers'
            'cairo: displays plots and save to different file formats')
options=('!libtool' '!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/plplot/${pkgname%510}-${pkgver}.tar.gz \
    plplot.patch)

build() {
  cd ${srcdir}/${pkgname%510}-${pkgver}
  patch -p1 < ../../plplot.patch
  if [ -d build ]; then
      rm -r build
  fi
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DENABLE_octave=off \
      -DENABLE_tcl=ON \
      -DENABLE_tk=ON \
      -DPL_FREETYPE_FONT_PATH=/usr/share/fonts/TTF ..
  make 
}

package() {
    cd ${srcdir}/${pkgname%510}-${pkgver}/build
    make DESTDIR=${pkgdir} install
    install -D -m644 ../Copyright ${pkgdir}/usr/share/licenses/${pkgname%510}/LICENSE
}
md5sums=('ece8c0b4d5cd815968a6d56bed0fbe7b' \
    '03c47ad0933fbc127c80df823ba756c3')
