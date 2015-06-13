# Maintainer:Bjoern Bidar <theodorstormgrade@gmail.com
#_gui_toolkit=qt # qt or gtk
_build_server=true # set true to build server (default:false)
_build_client=true  # set false to don't build client (default:true)
_CMAKE_COMMON_ARGS=('-DWITH_STATIC=OFF' '-DWITH_NEL_TOOLS=OFF' '-DWITH_NEL_TESTS=OFF' '-DWITH_LUA51=ON'  '-DWITH_NEL_SAMPLES=OFF' '-DWITH_RYZOM_TOOLS=OFF'.) # cmake arguments for server and client
_CMAKE_SERVER_ARGS=('-DWITH_RYZOM_SERVER=ON' '-DWITH_RYZOM_CLIENT=OFF' '-DWITH_DRIVER_OPENGL=OFF' '-DWITH_DRIVER_OPENAL=OFF' ) # cmake args for building server
_CMAKE_CLIENT_ARGS=( '-DWITH_RYZOM_SERVER=OFF' '-DWITH_RYZOM_CLIENT=ON' ) # cmake args for building client
pkgname=ryzom-hg 
pkgbase=ryzom-hg
pkgver=r5901.5f82c8b8fbec
pkgrel=1
pkgdesc="Ryzom is a Free to Play MMORPG . This version is for playing on an official server or launch a server"
arch=('i686' 'x86_64')
url="http://www.ryzom.com/"
license=('AGPL3')
depends=('curl' 'freetype2' 'libx11' 'mesa' 'libxxf86vm' 'openal' 'freealut' 'libogg' 'libvorbis' 'libxml2'  'libpng' 'libjpeg' 'rrdtool' 'libwww' 'boost'  'luabind' 'libsquish' 'lua51'  'lua51-sql-mysql') 
conflicts=('ryzom-client-latest-hg')
groups=('ryzom')
makedepends=('mercurial' 'cpptest' 'cmake' 'bison')
provides=('ryzom')
_hg_name='ryzomcore' 
source=( 'ryzom.sh' 'ryzom.desktop' "hg+https://bitbucket.org/ryzom/$_hg_name")
md5sums=('a5ca7dfae7b9073f78cd1b0b7380755f'
         '71d5136d40ec4e76c2ac2b0c9e506aef'
         'SKIP')


pkgver() {
  cd "$_hg_name"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

case $_gui_toolkit in
  qt) _CMAKE_COMMON_ARGS=( ${_CMAKE_COMMON_ARGS_ARGS[*]} '-DWITH_QT=ON' ) ;;
  gtk) _CMAKE_COMMON_ARGS=( ${_CMAKE_COMMON_ARGS_ARGS[*]} '-DWITH_GTK=ON' ) ;;
esac 



prepare() {
    cd $srcdir/$_hg_name/code
  

    for lib in WWWCACHE WWWSTREAM WWWFTP WWWGOPHER WWWNEWS WWWTELNET WWWDIR \
			WWWINIT WWWMUX WWWXML WWWZIP XMLPARSE XMLTOK WWWSSL MD5
    do sed "s|LIB${lib}_LIBRARY OPTIONAL|LIB${lib}_LIBRARY REQUIRED|" \
	   -i CMakeModules/FindLibwww.cmake; done
}
build() {
    cd $_hg_name
    
    if [ $_build_client = true ] ; then	
	mkdir -p "$srcdir/build-client"
	cd "$srcdir/build-client"
	msg "client is $_build_client, building client"
	cmake -b "$srcdir/$_hg_name/code"  ${_CMAKE_COMMON_ARGS_ARGS[*]} ${_CMAKE_CLIENT_ARGS[*]} -DCMAKE_INSTALL_PREFIX=/usr -DRYZOM_ETC_PREFIX=/etc/ryzom -DRYZOM_SHARE_PREFIX=/usr/share/ryzom -DRYZOM_BIN_PREFIX=/usr/bin -DRYZOM_GAMES_PREFIX=/usr/bin
	msg "Starting make, to build client"
	make
	
    fi
   
    if [ $_build_server = true ] ; then
	mkdir -p "$srcdir/build-server"
	cd "$srcdir/build-server"
	msg "client is $_build_server, building server"w
	cmake -b "$srcdir/$_hg_name/code"  ${_CMAKE_COMMON_ARGS_ARGS[*]} ${_CMAKE_SERVER_ARGS[*]} -DCMAKE_INSTALL_PREFIX=/usr -DRYZOM_ETC_PREFIX=/etc/ryzom -DRYZOM_SHARE_PREFIX=/usr/share/ryzom -DRYZOM_BIN_PREFIX=/usr/bin -DRYZOM_GAMES_PREFIX=/usr/bin
	msg "Starting make, to build server"   
	make	
    fi
}

package_ryzom-hg() {
    pkgdesc="Ryzom is a Free to Play MMORPG . This version is for playing on an official server or launch a server"
}

package_ryzom-client-hg() {
  pkgdesc="Ryzom is a Free to Play MMORPG . This version is for playing on an official server"
  depends=( 'curl' 'freetype2' 'libx11' 'mesa' 'libxxf86vm' 'openal' 'freealut' 'libogg' 'libvorbis' 'libxml2' 'cmake' 'libpng' 'libjpeg' 'rrdtool' 'bison' 'libwww' 'boost' 'cpptest' 'luabind' 'libsquish' 'lua51'  'lua51-sql-mysql' 'ryzom-data' )
  cd "$srcdir/build-client"
  make DESTDIR="$pkgdir/" install
  install -Dm 644 ${srcdir}/ryzom.desktop ${pkgdir}/usr/share/applications
  sed -ie 's/\/usr\/bin\/ryzom_client/ryzom/' ${pkgdir}/usr/share/applications/ryzom.desktop # replace ryzom_client with our script
  install -Dm755  ${srcdir}/ryzom.sh  ${pkgdir}/usr/bin/ryzom	
}

package_ryzom-server-hg() {
  pkgdesc="Ryzom is a Free to Play MMORPG . This is the version to run a server"
  cd "$srcdir/build-server"
  make DESTDIR="$pkgdir/" install	
}

if [ $_build_client = true ] ; then
  true && pkgname=( 'ryzom-client-hg'  )
fi

if [ $_build_server = true ] ; then
  true && pkgname=( 'ryzom-client-hg' 'ryzom-server-hg')
fi

