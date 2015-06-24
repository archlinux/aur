
pkgname='mygui-git'
pkgver=3.2.1.20140829
pkgrel=1

pkgdesc="A library for creating Graphical User Interfaces for games and 3D applications"
arch=('i686' 'x86_64')
url="http://mygui.info/"
license=('LGPL')

_giturl='git://github.com/MyGUI/mygui.git'
_gitname='mygui'

#source=("$_giturl")
#md5sums=('SKIP')

source=()
md5sums=()

depends=('boost-libs' 'ogre' 'ois')
makedepends=('boost' 'cmake' 'doxygen' 'ttf-dejavu')
optdepends=('mygui-docs: documentation')
conflicts=('mygui' 'mygui-svn')
provides=('mygui')


_gitfetch() {
	cd "${srcdir}"
	if [[ -d $_gitname ]]; then
		cd $_gitname
		git pull -v origin master
	else
		git clone $_giturl
		#git clone $_giturl --depth 1
	fi
}

pkgver() {
	_gitfetch &> log.gitpull
	cd "${srcdir}/${pkgname%-git}"

	_hfile='MyGUIEngine/include/MyGUI_Prerequest.h'
	_maj=`cat $_hfile | grep MYGUI_VERSION_MAJOR | head -n1 | awk '{print $3;}'`
	_min=`cat $_hfile | grep MYGUI_VERSION_MINOR | head -n1 | awk '{print $3;}'`
	_rev=`cat $_hfile | grep MYGUI_VERSION_PATCH | head -n1 | awk '{print $3;}'`

	_gitlog=`git log -1 --format=%cd --date=short | tr -d '-'`
	#git log -1 --format=%cd.%h --date=short | tr -d '-'

	echo $_maj.$_min.$_rev.$_gitlog
}

build() {
	cd "${srcdir}/${pkgname%-git}"

	msg "CMake config so demos install to /opt..."

	sed -i 's:"bin:"../opt/MYGUI:' CMake/Utils/MyGUIConfigTargets.cmake
	sed -i -e 's:../share:/usr/share:' \
				 -e 's:"bin":"../opt/MYGUI":' \
				 CMake/InstallResources.cmake
	sed -i '71 i set(MYGUI_GCC_VISIBILITY_FLAGS "")' CMakeLists.txt
	sed -i 's/\${OIS_LIBRARIES}/${OIS_LIBRARIES} boost_system/g' Common/CMakeLists.txt

	msg "Get a clean build dir..."

	[[ -d build ]] && rm -rf build
	mkdir build && cd build

	msg "Generate CMake makefiles..."

	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DMYGUI_INSTALL_SAMPLES=TRUE \
		-DMYGUI_INSTALL_TOOLS=TRUE \
		-DMYGUI_INSTALL_MEDIA=TRUE \
		-DFREETYPE_INCLUDE_DIR=/usr/include/freetype2/ \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=TRUE

	msg "Starting make..."

	make
}

package() {
	cd "${srcdir}/${pkgname%-git}/build"

	make DESTDIR="$pkgdir" install

	# make demos work
	chown root:users $pkgdir/opt/MYGUI
	chmod 775 $pkgdir/opt/MYGUI
}

