# Submbitter: Eric Bélanger <eric@archlinux.org>
# Maintainer: McNoggins <gagnon88 (at) gmail (dot) com>

pkgname=qt3
pkgver=3.3.8b
pkgrel=9
epoch=1
pkgdesc="A cross-platform application and UI framework"
arch=('i686' 'x86_64')
url="http://qt.io"
license=('GPL')
depends=('libpng' 'libxmu' 'libxcursor' 'libxinerama' 'glu' 'libxft'
         'libxrandr' 'libmng' 'libunistring')
makedepends=('mariadb' 'postgresql' 'unixodbc' 'sqlite' 'mesa')
optdepends=('qtchooser: set the default Qt toolkit'
            'libmariadbclient: MariaDB driver'
            'postgresql-libs: PostgreSQL driver'
            'unixodbc: ODBC driver')
options=('!docs')
source=(http://download.qt.io/archive/qt/3/qt-x11-free-${pkgver}.tar.gz
        qt3-png15.patch qt-copy-kde-patches.tar.bz2 qt-patches.tar.bz2
        eastern_asian_languagues.diff qt-odbc.patch gcc-4.6.patch 
        qt-x11-free-3.3.5-makelibshared.patch)
sha256sums=('1b7a1ff62ec5a9cb7a388e2ba28fda6f960b27f27999482ebeceeadb72ac9f6e'
            '1f8a1aa1d9c5eee8cdbc91b1c6d5a5bae62f422480fee383a1753bc7eac7741c'
            'bbef150acbb506eebb5e005fc0b5f3d3d7d970f673f4d3989c43947b52693a7e'
            '7cc99dee873d074efef18a637529fec5ba2dc96a7474febe7b85698e41d35c9b'
            '10a8449a55d02553ab8d61cbf51cbbb2cb9dc0e8c22036172c63a15736b8c5e0'
            '5e5e2bbbd6273caa2c350542365ab3b5f904c6049ba4cd96c7ae2fb47c1f2ac2'
            '49413093d37a0206870475943f14ac17e6309337eb02ce06de2e342f86523989'
            '27e1482308912323aa8cd603d7f719bce47ae7caa9df68569b26ed3ba1e39418')

# qt-copy-kde-patches come from http://websvn.kde.org/trunk/qt-copy/patches/
# other qt-patches come from fedora and gentoo

prepare() {
  cd qt-x11-free-${pkgver}
  # apply qt patches from kde.org
  for i in ../qt-copy-kde-patches/*; do
    patch -p0 -i $i 
  done
  # apply other qt patches and one security fix from debian/gentoo
  for i in ../qt-patches/*; do
    patch -p1 -i $i 
  done
  # fix CJK font/chars select error (FS#11245)
  patch -p1 -i "${srcdir}"/eastern_asian_languagues.diff 
  # fix build problem against new unixODBC
  patch -p1 -i "${srcdir}"/qt-odbc.patch 
  # fix build with gcc 4.6.0
  patch -p1 -i "${srcdir}"/gcc-4.6.patch
  patch -p0 -i "${srcdir}"/qt3-png15.patch 
 
  patch -p1 -i "${srcdir}"/qt-x11-free-3.3.5-makelibshared.patch

  sed -i "s|-O2|$CXXFLAGS|" mkspecs/linux-g++{,-32,-64}/qmake.conf
  sed -i "s|-I. |$CXXFLAGS -I. |" qmake/Makefile.unix
  sed -i "s|read acceptance|acceptance=yes|" configure
}

build() {
  export QTDIR="${srcdir}"/qt-x11-free-${pkgver}
  export PATH=${QTDIR}/bin:${PATH}
  export LD_LIBRARY_PATH=${QTDIR}/lib:${LD_LIBRARY_PATH}
  export QMAKESPEC=$QTDIR/mkspecs/linux-g++

  if [ "$CARCH" = "x86_64" ]; then
      export ARCH="-64"	
    else unset ARCH
  fi

  cd qt-x11-free-${pkgver}
  ./configure \
    -prefix /usr \
    -bindir /usr/lib/qt3/bin \
    -headerdir /usr/include/qt3 \
    -plugindir /usr/lib/qt3/plugins \
    -datadir /usr/share/qt3 \
    -translationdir /usr/share/qt3/translations \
    -I/usr/include/mysql -I/usr/include/postgresql/server \
    -platform linux-g++$ARCH \
    -system-zlib \
    -qt-gif \
    -release \
    -shared \
    -sm \
    -nis \
    -thread \
    -stl \
    -system-lib{png,jpeg,mng} \
    -no-g++-exceptions \
    -plugin-sql-{mysql,psql,sqlite,odbc}

  make
}

package() {
  cd qt-x11-free-${pkgver}
  make INSTALL_ROOT="${pkgdir}" install
  sed -i -e "s|-L${srcdir}/qt-x11-free-${pkgver}/lib ||g" -e "s|${srcdir}/||g" "${pkgdir}"/usr/lib/*.prl
  rm -rf "${pkgdir}"/usr/share/qt3/{phrasebooks,templates,translations}
  rm -rf "${pkgdir}"/usr/share/qt3/mkspecs/{aix*,*bsd*,cygwin*,dgux*,darwin*,hpux*,hurd*,irix*,linux-g++$ARCH/linux-g++$ARCH,lynxos*,macx*,qnx*,reliant*,sco*,solaris*,tru64*,unixware*,win32*} 

# install man pages
  install -d -m755 "${pkgdir}"/usr/share/man
  cp -r "${srcdir}"/qt-x11-free-${pkgver}/doc/man/{man1,man3} "${pkgdir}"/usr/share/man/
  for i in "${pkgdir}"/usr/share/man/man1/*; do
    mv $i ${i%.*}-qt3.1
  done

# Useful symlinks for cmake and configure scripts
  install -d "${pkgdir}"/usr/bin
  for b in "${pkgdir}"/usr/lib/qt3/bin/*; do
    ln -s /usr/lib/qt3/bin/$(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt3
  done
}
