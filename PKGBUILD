# Maintainer:Bjoern Bidar <theodorstormgrade@gmail.com
# Maintainer:Thomas Kowaliczek-Schmer <thomas.kowaliczek@posteo.de>
_build_server=true # set true to build server (default:false)
_build_client=true # set false to don't build client (default:true)
_CMAKE_COMMON_ARGS=('-DWITH_STATIC=OFF' '-DWITH_NEL_TOOLS=OFF' '-DWITH_NEL_TESTS=OFF' '-DWITH_LUA54=ON'  '-DWITH_NEL_SAMPLES=OFF' '-DWITH_RYZOM_TOOLS=OFF' '-DWITH_RYZOM_PATCH=ON' '-DWITH_RYZOM=ON' .) # cmake arguments for server and client
_CMAKE_SERVER_ARGS=('-DWITH_RYZOM_SERVER=ON' '-DWITH_RYZOM_CLIENT=OFF' '-DWITH_DRIVER_OPENGL=OFF' '-DWITH_DRIVER_OPENAL=OFF' ) # cmake args for building server
_CMAKE_CLIENT_ARGS=( '-DWITH_RYZOM_SERVER=OFF' '-DWITH_RYZOM_CLIENT=ON' '-DWITH_QT5=ON') # cmake args for building client
pkgname=ryzom-git 
pkgbase=ryzom-git
pkgver=r9767.a6139ade2
pkgrel=1
pkgdesc="Ryzom is a Free to Play MMORPG . This version is for playing on an official server or launch a server"
arch=('i686' 'x86_64')
url="http://www.ryzom.com/"
license=('AGPL3')
depends=('curl' 'freetype2' 'libx11' 'mesa' 'libxxf86vm' 'openal' 'freealut' 'libogg' 'libvorbis' 'libxml2'  'libpng' 'libjpeg' 'boost'  'luabind-ryzom' 'libsquish' 'lua' 'mariadb-clients' 'giflib' 'ffmpeg' 'libgsf' 'qt5-base' 'qt5-tools')
conflicts=('ryzom-client-latest-hg')
groups=('ryzom')
makedepends=('git' 'cpptest' 'cmake')
provides=('ryzom')
_git_name='ryzomcore' 
source=( 'ryzom.sh' 'ryzom.desktop' "git+https://github.com/ryzom/ryzomcore")
md5sums=('a6b3192d061a163e23a01a0b7a4d83fb'
         '71d5136d40ec4e76c2ac2b0c9e506aef'
         'SKIP')

pkgver() {
  cd "$_git_name"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_git_name
    
    if [ $_build_client = true ] ; then	
	mkdir -p "$srcdir/ryzomcore/build-client"
	cd "$srcdir/ryzomcore/build-client"
	cmake ${_CMAKE_COMMON_ARGS_ARGS[*]} ${_CMAKE_CLIENT_ARGS[*]} -DCMAKE_INSTALL_PREFIX=/usr -DRYZOM_ETC_PREFIX=/etc/ryzom -DRYZOM_SHARE_PREFIX=/usr/share/ryzom -DRYZOM_BIN_PREFIX=/usr/bin -DRYZOM_GAMES_PREFIX=/usr/bin ..
	make
	
    fi
   
    if [ $_build_server = true ] ; then
	mkdir -p "$srcdir/ryzomcore/build-server"
	cd "$srcdir/ryzomcore/build-server"
	cmake ${_CMAKE_COMMON_ARGS_ARGS[*]} ${_CMAKE_SERVER_ARGS[*]} -DCMAKE_INSTALL_PREFIX=/usr -DRYZOM_ETC_PREFIX=/etc/ryzom -DRYZOM_SHARE_PREFIX=/usr/share/ryzom -DRYZOM_BIN_PREFIX=/usr/bin -DRYZOM_GAMES_PREFIX=/usr/bin ..
	make
    fi
}

package_ryzom-git() {
    pkgdesc="Ryzom is a Free to Play MMORPG . This version is for playing on an official server or launch a server"
}

package_ryzom-client-git() {
  pkgdesc="Ryzom is a Free to Play MMORPG . This version is for playing on an official server"
  cd "$srcdir/ryzomcore/build-client"
  make DESTDIR="$pkgdir/" install
  install -Dm 644 ${srcdir}/ryzom.desktop ${pkgdir}/usr/share/applications
  sed -ie 's/\/usr\/bin\/ryzom_client/ryzom/' ${pkgdir}/usr/share/applications/ryzom.desktop # replace ryzom_client with our script
  install -Dm755  ${srcdir}/ryzom.sh  ${pkgdir}/usr/bin/ryzom	
}

package_ryzom-server-git() {
  pkgdesc="Ryzom is a Free to Play MMORPG . This is the version to run a server"
  cd "$srcdir/ryzomcore/build-server"
  make DESTDIR="$pkgdir/" install	
}

if [ $_build_client = true ] ; then
  true && pkgname=( 'ryzom-client-git'  )
fi

if [ $_build_server = true ] ; then
  true && pkgname=( 'ryzom-client-git' 'ryzom-server-git')
fi
