# Maintainer: PitBall

pkgname=ryzom-client
pkgver=0.12.0.r6790
pkgrel=1
pkgdesc="Ryzom is a Free to Play MMORPG .This version is for playing on an official server"
arch=('i686' 'x86_64')
url="http://www.ryzom.com/"
license=('AGPL3')
depends=('ryzom-data' 'curl' 'freealut' 'libvorbis' 'libjpeg' 'giflib' 'rrdtool'
         'boost' 'lua52bind' 'libsquish' 'libxrandr' 'libxcursor' 'hicolor-icon-theme')
conflicts=('ryzom-client-latest-hg' 'ryzom-client-hg') #lua52
makedepends=('mercurial' 'cpptest' 'cmake' 'bison' 'mesa')
provides=('libnel' 'ryzom' 'ryzomcore')
_hg_name='ryzomcore'
install=install                                     #branch=compatibility
source=( "hg+https://bitbucket.org/ryzom/${_hg_name}#branch=compatibility-develop"
         'ryzom.sh')
md5sums=('SKIP' 'a5ca7dfae7b9073f78cd1b0b7380755f')


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

    mkdir -p $srcdir/$_hg_name/build
    cd $srcdir/$_hg_name/build

    # error in linking time "undefined reference to xml*"
    for dir in georges gui ligo logic net pacs sound; do
    sed 's/nelmisc/nelmisc ${LIBXML2_LIBRARIES}/' -i \
         ../code/nel/src/$dir/CMakeLists.txt; done

    # error with gcc-5.3.0
    sed '/<climits>/a#include <limits>' -i \
         ../code/nel/include/nel/misc/types_nl.h

   cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release \
    -DWITH_RYZOM_SERVER=OFF -DWITH_RYZOM_CLIENT=ON \
    -DWITH_NEL_TOOLS=OFF -DWITH_NEL_TESTS=OFF -DWITH_PCH=OFF \
    -DWITH_NEL_SAMPLES=OFF -DWITH_LUA51=OFF -DWITH_LUA52=ON \
    -DWITH_RYZOM_TOOLS=OFF -DCMAKE_INSTALL_PREFIX=/usr \
    -DRYZOM_ETC_PREFIX=/etc/ryzom -DRYZOM_SHARE_PREFIX=/usr/share/ryzom \
    -DRYZOM_BIN_PREFIX=/usr/bin -DRYZOM_GAMES_PREFIX=/usr/bin \
    -DLUA_INCLUDE_DIR=/usr/include/lua5.2 ../code

   make

}

package() {
  cd "$srcdir/$_hg_name/build"
  make DESTDIR="$pkgdir/" install
  sed 's/\/usr\/bin\/ryzom_client/ryzom/' \
  -i ${pkgdir}/usr/share/applications/ryzom_client.desktop
  install -Dm755  ${srcdir}/ryzom.sh  ${pkgdir}/usr/bin/ryzom
  #correct config file
  sed -r -e 's|^(PatchServer\s*=\s*).*|\1"";|' \
         -e '/PatchServer/aPatchWanted = 0;' \
         -e 's|^(PatchletUrl\s*=\s*).*|\1"";|' \
         -i ${pkgdir}/etc/ryzom/client_default.cfg
}
