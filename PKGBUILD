# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgbase=discreet
pkgname=("discreet-gui" "discreet-daemon")
_pkgname0=${pkgname[0]}
_pkgname1=${pkgname[1]}
_githuborg="DiscreetNetwork"
pkgdesc="Discreet Cryptocurrency Wallet. discreet.net"
pkgver=0.2.23
_guiver="${pkgver}-3"
_daemonver=0.0.28-2
pkgrel=2
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
makedepends=('dotnet-sdk')
url="https://${_pkgpath}"
source=(
"git+https://github.com/DiscreetNetwork/DiscreetCore"
"git+https://github.com/DiscreetNetwork/discreet-gui"
"git+https://github.com/DiscreetNetwork/discreet"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
	cd ${srcdir}/discreet-gui/Discreet-GUI/
	dotnet restore
   dotnet publish --configuration Release --runtime linux-x64 --self-contained true -p:Version=0.0.28
#   cd ${srcdir}/DiscreetCore/DiscreetCore/
 #  sed -i "12s/.*/BOOST=\/usr\/include\/boost/" $_i | awk 'NR==12{ print; exit }' Makefile  || exit 1
  # sed -i "13s/.*/BOOST_LIB=\/usr\/lib/" $_i | awk 'NR==13{ print; exit }' Makefile  || exit 1
  # make core
   	cd ${srcdir}/discreet
	dotnet restore
	dotnet publish --configuration Release --runtime linux-x64 --self-contained true
}

package_discreet-gui() {
	depends=("discreet-daemon")
	#create directory trees
	cd ${pkgdir}
	mkdir -p ${pkgdir}/usr/lib/discreet-gui/ ${pkgdir}/usr/bin
	cp -a ${srcdir}/discreet-gui/Discreet-GUI/Discreet-GUI/bin/Release/net6.0/linux-x64/publish/* ${pkgdir}/usr/lib/discreet-gui/
	ln -rTsf ${pkgdir}/usr/lib/discreet-gui/Discreet-GUI ${pkgdir}/usr/bin/discreet-gui
}
package_discreet-daemon() {
	depends=( 'bzip2' 'snappy' 'lz4' 'zlib' 'zstd' 'glibc' 'lib32-glibc' 'tbb' 'liburing' 'jemalloc' 'libxcrypt' 'boost')
	#create directory trees
	cd ${pkgdir}
	mkdir -p ${pkgdir}/usr/lib/discreet/ ${pkgdir}/usr/bin
	cp -a ${srcdir}/discreet/Discreet/bin/Release/net6.0/linux-x64/publish/* ${pkgdir}/usr/lib/discreet
	install -Dm644 ${srcdir}/DiscreetCore/linux/DiscreetCore.so ${pkgdir}/usr/lib/discreet/Discreet
	ln -rTsf ${pkgdir}/usr/lib/discreet/Discreet ${pkgdir}/usr/bin/discreetd
	ln -rTsf ${pkgdir}/usr/lib/libdl.so.2 ${pkgdir}/usr/lib/discreet/libdl.so
}
