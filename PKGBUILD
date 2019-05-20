# Maintainer: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Alex Tharp <toastercup@gmail.com>

pkgname=high-fidelity-stable-git
pkgver=r77707.576f41f90c
pkgrel=1.01
pkgdesc="High Fidelity (Hifi) is an open-source software where you can create and share virtual reality (VR) experiences. Create and host your own VR world, explore other worlds and meet other users. (git - latest stable version)"
arch=('i686' 'x86_64')
url="https://github.com/highfidelity/hifi"
license=('Apache')
install="${pkgname}.install"

makedepends=('git' 'cmake>=3.2')
provides=('hifi')  
conflicts=('hifi')
_qt5version=5.5.1 
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

         'glm>=0.9.5.4'
         'openssl>=1.0.1m'
         'intel-tbb>=4.3'
         'freeglut>=2.8.0'
         'oglplus>=0.63'
         'glew'
         'alsa-lib'
         'libxmu'
         'jack'
         'polyvox-git'
         'sdl2>=2.0.3'
         'bullet>=2.82'
         'libsoxr>=0.1.1'
         'qxmpp'
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
	cmake -DQT_CMAKE_PREFIX_PATH="/usr/lib/cmake" ..
	make
}

package() {
	mkdir -p "$pkgdir/opt/hifi"
	mkdir -p "$pkgdir/usr/share/hifi"

	install -Dm644 "$srcdir/hifi-interface.png" "$pkgdir/usr/share/hifi/hifi-interface.png"
	install -Dm644 "$srcdir/hifi-interface.desktop" "$pkgdir/usr/share/applications/hifi-interface.desktop"
	install -Dm755 "$srcdir/hifi-interface.launcher" "$pkgdir/usr/bin/hifi-interface"
	install -Dm755 "$srcdir/build/interface/interface" "$pkgdir/opt/hifi/interface/interface"
	cp -R "$srcdir/build/interface/resources" "$pkgdir/opt/hifi/interface/"

	cp -R "$srcdir/build/interface/jsdoc" "$pkgdir/opt/hifi/interface/"
	cp -R "$srcdir/build/interface/scripts" "$pkgdir/opt/hifi/interface/"
	cp "$srcdir/build/interface/resources.qrc" "$pkgdir/opt/hifi/interface/"
  	cp "$srcdir/build/interface/resources.rcc" "$pkgdir/opt/hifi/interface/"
	install -Dm755 "$srcdir/build/domain-server/domain-server" "$pkgdir/opt/hifi/domain-server/domain-server"
	cp -R "$srcdir/build/domain-server/resources" "$pkgdir/opt/hifi/domain-server/"
	install -Dm755 "$srcdir/hifi-domain-server.launcher" "$pkgdir/usr/bin/hifi-domain-server"

	install -Dm755 "$srcdir/build/ice-server/ice-server" "$pkgdir/opt/hifi/ice-server"
	install -Dm755 "$srcdir/hifi-ice-server.launcher" "$pkgdir/usr/bin/hifi-ice-server"

	install -Dm755 "$srcdir/build/assignment-client/assignment-client" "$pkgdir/opt/hifi/assignment-client"
	install -Dm755 "$srcdir/hifi-assignment-client.launcher" "$pkgdir/usr/bin/hifi-assignment-client"
	install -Dm755 "$srcdir/build/assignment-client/oven" "$pkgdir/opt/hifi/assignment-client"
}
