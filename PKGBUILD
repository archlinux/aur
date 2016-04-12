# Maintainer: PitBall

pkgname=ryzom-client
pkgver=0.12.0.r7512
pkgrel=1
pkgdesc="Ryzom is a Free to Play MMORPG .This version is for playing on an official server"
arch=('i686' 'x86_64')
url="http://www.ryzom.com/"
license=('AGPL3')
depends=('ryzom-data' 'curl' 'freealut' 'libvorbis' 'libjpeg' 'giflib' 'rrdtool'
         'boost' 'lua53bind' 'libsquish' 'libxrandr' 'libxcursor' 'hicolor-icon-theme')
conflicts=('ryzom-client-latest-hg' 'ryzom-client-hg')
makedepends=('mercurial' 'cpptest' 'cmake' 'bison' 'mesa')
provides=('libnel' 'ryzom' 'ryzomcore')
_hg_name='ryzomcore'
install=install                                     #branch=compatibility
source=( "hg+https://bitbucket.org/ryzom/${_hg_name}#branch=compatibility-develop"
         'ryzom.sh')
md5sums=('SKIP'
         '7f9befd9b4f864938648880375ff423e')

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

prepare() {

    mkdir -p $srcdir/$_hg_name/build
    cd $srcdir/$_hg_name

    sed '/o_xml.h/i#include <libxml/tree.h>' -i \
         code/nel/include/nel/logic/logic_state.h 

} 

build() {

    cd $srcdir/$_hg_name

    cmake -Hcode -Bbuild -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release \
    -DWITH_RYZOM_SERVER=OFF -DWITH_RYZOM_CLIENT=ON -DWITH_PCH=OFF \
    -DWITH_RYZOM_TOOLS=OFF -DWITH_RYZOM_STEAM=OFF -DWITH_RYZOM_PATCH=OFF \
    -DWITH_NEL_TOOLS=OFF -DWITH_NEL_TESTS=OFF -DWITH_NEL_SAMPLES=OFF \
    -DWITH_LUA53=ON -DWITH_LUA51=OFF -DWITH_LUA52=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr -DWITH_GCC_FPMATH_BOTH=ON \
    -DRYZOM_ETC_PREFIX=/etc/ryzom -DRYZOM_SHARE_PREFIX=/usr/share/ryzom \
    -DRYZOM_BIN_PREFIX=/usr/bin -DRYZOM_GAMES_PREFIX=/usr/bin

    cmake --build build

}

package() {
    cd "$srcdir/$_hg_name/build"
    make DESTDIR="$pkgdir/" install
    sed 's/\/usr\/bin\/ryzom_client/ryzom/' \
    -i ${pkgdir}/usr/share/applications/ryzom_client.desktop
    install -Dm755  ${srcdir}/ryzom.sh  ${pkgdir}/usr/bin/ryzom
    #correct config file for playing on an official server
    sed -r -e 's|^(PatchServer\s*=\s*).*|\1"";|' \
           -e '/PatchServer/aPatchWanted = 0;' \
           -e 's|^(PatchletUrl\s*=\s*).*|\1"";|' \
	   -e '/appzone.xml/d' \
           -i ${pkgdir}/etc/ryzom/client_default.cfg
}

