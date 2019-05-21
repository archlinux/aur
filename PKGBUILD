# Maintainer: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Alex Tharp <toastercup@gmail.com>

pkgname=high-fidelity-stable-git
pkgver=r77707.576f41f90c
pkgrel=1.11
pkgdesc="High Fidelity (Hifi) is an open-source software where you can create and share virtual reality (VR) experiences. Create and host your own VR world, explore other worlds and meet other users. (git - latest stable version)"
arch=('i686' 'x86_64')
url="https://github.com/highfidelity/hifi"
license=('Apache')
install="${pkgname}.install"

makedepends=('git' 'cmake>=3.2' 'python>=3.6')
provides=('hifi')  
conflicts=('hifi')
_qt5version=5.10.1 
depends=("qt5-base>=$_qt5version"
         "qt5-script>=$_qt5version"
         "qt5-tools>=$_qt5version"
         "qt5-multimedia>=$_qt5version"
         "qt5-svg>=$_qt5version"
         "qt5-websockets>=$_qt5version"
         "qt5-webengine>=$_qt5version"
         "qt5-graphicaleffects>=$_qt5version"
         "qt5-quickcontrols>=$_qt5version"
         "qt5-xmlpatterns>=$_qt5version"	 
)

source=(
	'hifi-interface.desktop'
	'hifi-interface.png'
	'hifi-interface.launcher'
	'hifi-assignment-client.launcher'
	'hifi-domain-server.launcher'
	'hifi-ice-server.launcher'
)

md5sums=(
	"9199bdb8e4e32bc16b90fe0d29c4ea7a"
	"a261965ec09a8dfd93175fdabb7cafbe"
	"ff5de09932f33f6e4f4e4093a4b5e1d8"
	"1eac79a3bc2179a4026ea1c6765fd44a"
	"ebb90bc133cb39d9d53b22fe8a954126"
	"8405ec1a861b25e92c9640cdae8a3776"
)

prepare() {
	cd "$srcdir"
	if [ ! -d ".git" ]; then
    	git init
    	git remote add origin "https://github.com/highfidelity/hifi.git"
    	version=`git ls-remote --heads origin | grep -oP 'v\d+?\.\d+?\.\d+?-rc' | tail -n 1`
   		git fetch origin $version:$version
   		git checkout $version
   fi
   
   mkdir -p "$srcdir/build"

   #Workaround ugly vcpkg error here...
   /usr/bin/python "$srcdir/prebuild.py" --build-root="$srcdir/build" || true
   /tmp/hifi/vcpkg/*/vcpkg install tbb:x64-linux
}

pkgver() {
  cd "$srcdir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/build"
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/opt/hifi" -DCMAKE_BUILD_TYPE:STRING="Release" -DQT_CMAKE_PREFIX_PATH:PATH="/usr/lib/cmake" ..
	make
}

package() {
	mkdir -p "$pkgdir/usr/share/hifi"
	mkdir -p "$pkgdir/usr/lib"
 	mkdir -p "$pkgdir/opt/hifi"


	cd "$srcdir/build"

	make install

	#copy polyvox library

	cd "$pkgdir/usr/lib"
	cp -p "$srcdir/build/ext/makefiles/polyvox/project/lib/Release/libPolyVoxCore.so.0.2.1" "$pkgdir/usr/lib/"
	ln -s "libPolyVoxCore.so.0.2.1" "libPolyVoxCore.so.0"
	ln -s "libPolyVoxCore.so.0.2.1" "libPolyVoxCore.so"

	cp -p "$srcdir/build/ext/makefiles/polyvox/project/lib/libPolyVoxUtil.so.0.2.1" "$pkgdir/usr/lib/"
	ln -s "libPolyVoxUtil.so.0.2.1" "libPolyVoxUtil.so.0"
	ln -s "libPolyVoxUtil.so.0.2.1" "libPolyVoxUtil.so"

	#copy quazip library
	cp -p "$srcdir/build/ext/makefiles/quazip/project/lib/libquazip5.so.1.0.0" "$pkgdir/usr/lib/"
	ln -s "libquazip5.so.1.0.0" "libquazip5.so.1"
	ln -s "libquazip5.so.1" "libquazip5.so"

	#copy steamworks libsdkencryptedappticket libsteam api
	cp -p "$srcdir/build/ext/makefiles/steamworks/project/src/steamworks/public/steam/lib/linux64/libsdkencryptedappticket.so" "$pkgdir/usr/lib/"
	cp -p "$srcdir/build/ext/makefiles/steamworks/project/src/steamworks/redistributable_bin/linux64/libsteam_api.so" "$pkgdir/usr/lib/"

	install -Dm644 "$srcdir/hifi-interface.png" "$pkgdir/usr/share/hifi/hifi-interface.png"
	install -Dm644 "$srcdir/hifi-interface.desktop" "$pkgdir/usr/share/applications/hifi-interface.desktop"
	install -Dm755 "$srcdir/hifi-interface.launcher" "$pkgdir/usr/bin/hifi-interface"

	install -Dm755 "$srcdir/hifi-domain-server.launcher" "$pkgdir/usr/bin/hifi-domain-server"

	install -Dm755 "$srcdir/hifi-ice-server.launcher" "$pkgdir/usr/bin/hifi-ice-server"

	install -Dm755 "$srcdir/hifi-assignment-client.launcher" "$pkgdir/usr/bin/hifi-assignment-client"
}
