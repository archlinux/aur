# Maintainer: freijon <freijon@gmail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>, ZekeSulastin <zekesulastin@gmail.com>

pkgname=fs2_open-git
pkgver=3.8.1.c109dc6ac
pkgrel=2
pkgdesc="An enhancement of the original Freespace 2 engine - GIT version"
url="http://scp.indiegames.us"
arch=('i686' 'x86_64')
license=('custom:fs2_open')
depends=('libjpeg' 'libpng' 'libtheora' 'libvorbis' 'lua51' 'mesa' 'openal' 'sdl')
makedepends=('git' 'cmake' 'freetype2' 'doxygen' 'ffmpeg')
conflicts=('fs2_open')
provides=('fs2_open')
install=fs2_open-git.install
source=("${pkgname}::git+https://github.com/scp-fs2open/fs2open.github.com.git"
"cotire::git+https://github.com/sakra/cotire.git"
"cmake-modules::git+https://github.com/asarium/cmake-modules.git")

sha256sums=('SKIP'
'SKIP'
'SKIP')

version=3.8.1

pkgver () {
	cd "$srcdir/$pkgname"
	rev=`git rev-parse --short HEAD`
	echo ${version}.${rev}
}

build()
{
	cd "$srcdir/$pkgname"

	git submodule init
	git config submodule.cotire $srcmodule/cotire
	git submodule update
	git submodule init
	git config submodule.cmake-modules $srcmodule/cmake-modules
	git submodule update

	mkdir build
	cd build
	cmake ../
	make
}

package () {
	cd "$srcdir/$pkgname/build/bin"
	binary=`find fs2_open*`
	cd ../..
	rev=`git rev-parse --short HEAD`
	install -D -m644 Copying.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D -m755 build/bin/${binary} "$pkgdir/opt/fs2_open/${binary}_${rev}"
	msg "The output binary will be called '${binary}_${rev}'"
}

