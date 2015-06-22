# Contributor: Philipp Schmidt <philschmidt@gmx.net>

pkgname=kio-mtp-git
pkgver=20130309
pkgrel=1
pkgdesc="MTP KIO Slave - Access MTP Devices in Dolphin or Konqueror"
arch=("i686" "x86_64")
url="https://projects.kde.org/projects/playground/base/kio-mtp"
license=('GPL')
depends=('qt4' 'kdebase-runtime' 'kdelibs' 'libmtp')
makedepends=('pkgconfig' 'git' 'automoc4' 'cmake')
conflicts=('kio-mtp')

_gitroot="git://anongit.kde.org/kio-mtp"
_gitname="kio-mtp"

source=()
md5sums=()

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [ -d ${_gitname}/.git ] ; then
		cd ${_gitname}
		
		git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done or server timeout"

	mkdir -p "$srcdir/build"
	cd "$srcdir/build"

	echo ${srcdir}/${_gitname}

	msg "Starting make..."

	cmake -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
		  -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) \
		  -DCMAKE_BUILD_TYPE=Debug \
		  ${srcdir}/${_gitname}

	make
}

package(){
	cd "$srcdir/build"

	make DESTDIR=${pkgdir} install
}
