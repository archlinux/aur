# Maintainer: PitBall

pkgname=ryzom-client
pkgver=0.12.0.r6270
pkgrel=1
pkgdesc="Ryzom is a Free to Play MMORPG .This version is for playing on an official server"
arch=('i686' 'x86_64')
url="http://www.ryzom.com/"
license=('AGPL3')
depends=('ryzom-data' 'curl' 'freealut' 'libvorbis' 'libjpeg' 'rrdtool' 'boost'
         'luabind' 'libsquish' 'libxrandr' 'libxcursor' 'hicolor-icon-theme')
conflicts=('ryzom-client-latest-hg' 'ryzom-client-hg') #lua51
makedepends=('mercurial' 'cpptest' 'cmake' 'bison' 'mesa')
provides=('libnel' 'ryzom' 'ryzomcore')
_hg_name='ryzomcore'
install=install                                     #branch=compatibility
source=( "hg+https://bitbucket.org/ryzom/${_hg_name}#branch=compatibility-develop"
         'hg+http://hg.kervala.net/libwww'
         'ryzom.sh')
md5sums=('SKIP' 'SKIP' 'a5ca7dfae7b9073f78cd1b0b7380755f')


pkgver() {
  cd "$_hg_name"
  printf "%s.%s.%s.r%s" \
  "$(grep -o -P "NL_VERSION_MAJOR [0-9]+" code/CMakeLists.txt | \
                  awk '{print $2}' | head -n 1)" \
  "$(grep -o -P "NL_VERSION_MINOR [0-9]+" code/CMakeLists.txt | \
                  awk '{print $2}' | head -n 1)" \
  "$(grep -o -P "NL_VERSION_PATCH [0-9]+" code/CMakeLists.txt | \
                  awk '{print $2}' | head -n 1)" \
  "$(hg identify -n)"
}

build() {
    cd $srcdir/libwww
    ./autogen.sh || true
    sed -i 's|\${CC-cc}|${CC-cc} -O2 |g' ./configure
    LDFLAGS="" CFLAGS="$CFLAGS -fPIC" ./configure --with-ssl=no \
    --with-zlib --with-expat --prefix=$srcdir/w3c
    make -j1
    make  install
    ln -sf ../wwwconf.h $srcdir/w3c/include/w3c-libwww/wwwconf.h

    mkdir -p $srcdir/$_hg_name/build
    cd $srcdir/$_hg_name/build

   PATH="$srcdir/w3c/bin:$PATH" \
   cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release \
    -DWITH_RYZOM_SERVER=OFF -DWITH_RYZOM_CLIENT=ON \
    -DWITH_NEL_TOOLS=OFF -DWITH_NEL_TESTS=OFF -DWITH_PCH=OFF \
    -DWITH_NEL_SAMPLES=OFF -DLIBWWW_LIBRARIES=$srcdir/w3c/lib \
    -DLIBWWW_INCLUDE_DIR=$srcdir/w3c/include/w3c-libwww  -DWITH_LIBWWW_STATIC=ON \
    -DWITH_RYZOM_TOOLS=OFF -DCMAKE_INSTALL_PREFIX=/usr \
    -DRYZOM_ETC_PREFIX=/etc/ryzom -DRYZOM_SHARE_PREFIX=/usr/share/ryzom \
    -DRYZOM_BIN_PREFIX=/usr/bin -DRYZOM_GAMES_PREFIX=/usr/bin \
    -DLUA_INCLUDE_DIR=/usr/include/lua5.1 ../code
   make

}

package() {
  cd "$srcdir/$_hg_name/build"
  make DESTDIR="$pkgdir/" install
  sed 's/\/usr\/bin\/ryzom_client/ryzom/' \
  -i ${pkgdir}/usr/share/applications/ryzom_client.desktop
  install -Dm755  ${srcdir}/ryzom.sh  ${pkgdir}/usr/bin/ryzom
}
