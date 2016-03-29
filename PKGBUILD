# Maintainer: freijon <freijon@gmail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>, ZekeSulastin <zekesulastin@gmail.com>

pkgname=fs2_open-git
pkgver=3.7.5.r1280
pkgrel=1
pkgdesc="An enhancement of the original Freespace 2 engine - GIT version"
url="http://scp.indiegames.us"
arch=('i686' 'x86_64')
license=('custom:fs2_open')
depends=('libjpeg' 'libpng' 'libtheora' 'libvorbis' 'lua51' 'mesa' 'openal' 'sdl')
makedepends=('git')
conflicts=('fs2_open')
provides=('fs2_open')
install=fs2_open-git.install
source=("${pkgname}::git+https://github.com/scp-fs2open/fs2open.github.com.git")
sha256sums=('SKIP')

version=3.7.5

pkgver () {
	cd "$srcdir/$pkgname"
	rev=`git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'`
	echo ${version}.${rev:10:5}
}

build()
{
	cd "$srcdir/$pkgname"

	# Add --enable-debug to make a debug build.  These are NOT meant for general play;
	#  only make a debug build if generating logs/bugreports.  This is true even for
	#  these GIT builds, if you're using a mod that requires them.
	LDFLAGS="-l:liblua.so.5.1 $LDFLAGS" CXXFLAGS="-I/usr/include/lua5.1 $CXXFLAGS" ./autogen.sh --enable-speech
	make
}

package () {
	cd "$srcdir/$pkgname/code"
	binary=`find fs2_open*`
	cd ..
	rev=`git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'`
	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D -m755 code/${binary} "$pkgdir/opt/fs2_open/${binary}_${rev:10:5}"
	msg "The output binary will be called '${binary}_${rev:10:5}'"
}

