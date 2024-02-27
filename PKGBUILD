# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgbase=discreet
pkgname=("discreet-gui" "discreet-daemon")
_pkgname0=${pkgname[0]}
_pkgname1=${pkgname[1]}
_githuborg="DiscreetNetwork"
pkgdesc="Discreet Cryptocurrency Wallet. discreet.net - SCAM WARNING!"
pkgver=1.0.0
_guiver="${pkgver}"
_daemonver="${pkgver}"
pkgrel=5
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
  echo -e "
  \e[1;31mThe maintainer of this package was scammed out of thousands of dollars
  by the founder of the discreet project FRED MARKTOR!

  The maintainer of this package endured harassment
  at the hands of toxic community elements in the official discreetnetwork telegram channel.

  The maintainer of this package reported threats of sexual violence
  made against children by community member 'Discreet Priest'.

  The maintainer of this package
  was banned from https://t.me/discreetnetwork by FRED MARKTOR for reporting this

  The maintainer of this package was left with no ability to participate in the testnet
  nor any alternative for transferring presale tokens to mainnet coins.

  The maintainer of this package takes this opportunity to warn fellow arch users against this project.

  If this situation or assessment should change, the build shall be fixed and this warning rescinded.
  \e[0m"
  exit 0
  msg2 'building discreet core'
  cd ${srcdir}/DiscreetCore/DiscreetCore/
  rm ../linux/*
  sed -i "12s/.*/BOOST=\/usr\/include\/boost/" Makefile | awk 'NR==12{ print; exit }' Makefile  || exit 1
  sed -i "13s/.*/BOOST_LIB=\/usr\/lib/" Makefile | awk 'NR==13{ print; exit }' Makefile  || exit 1
  make core
  msg2 'building discreet daemon'
  cd ${srcdir}/discreet/Discreet/
	dotnet restore
	dotnet publish --configuration Release --runtime linux-x64 --self-contained true --framework net6.0
  msg2 'building discreet-gui'
  cd ${srcdir}/discreet-gui/Discreet-GUI
  dotnet restore
  dotnet publish --configuration Release --runtime linux-x64 --self-contained true --framework net6.0
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
	install -Dm644 ${srcdir}/DiscreetCore/linux/DiscreetCore.so ${pkgdir}/usr/lib/discreet
	ln -rTsf ${pkgdir}/usr/lib/discreet/Discreet ${pkgdir}/usr/bin/discreetd
  chmod +x ${pkgdir}/usr/bin/discreetd
	ln -rTsf ${pkgdir}/usr/lib/libdl.so.2 ${pkgdir}/usr/lib/discreet/libdl.so
}
