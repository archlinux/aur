# Maintainer: freijon <freijon@gmail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>, ZekeSulastin <zekesulastin@gmail.com>

pkgname=fs2_open-git
pkgver=3.7.3
pkgrel=20151208
pkgdesc="An enhancement of the original Freespace 2 engine - GIT version"
url="http://scp.indiegames.us"
arch=('i686' 'x86_64')
license=('custom:fs2_open')
depends=('libjpeg' 'libpng' 'libtheora' 'libvorbis' 'lua51' 'mesa' 'openal' 'sdl')
makedepends=('git')
conflicts=('fs2_open')
provides=('fs2_open')
install=fs2_open-git.install

_gitrep='https://github.com/scp-fs2open/fs2open.github.com.git'
_pkg=fs2_open

build()
{
	cd "$srcdir"
	msg "Cloning git repository...."

	git clone $_gitrep

	msg "git clone done or server timeout"
	msg "Starting build..."

	cd "$srcdir/fs2open.github.com"

	# Add --enable-debug to make a debug build.  These are NOT meant for general play;
	#  only make a debug build if generating logs/bugreports.  This is true even for
	#  these GIT builds, if you're using a mod that requires them.
	LDFLAGS="-l:liblua.so.5.1 $LDFLAGS" CXXFLAGS="-I/usr/include/lua5.1 $CXXFLAGS" ./autogen.sh --enable-speech
	make
}

package () {
	cd "$srcdir/fs2open.github.com"

	_commit_hash=`git rev-parse HEAD`
	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	if [[ -x code/fs2_open_3.7.3 ]]; then
		install -D -m755 code/fs2_open_3.7.3 "$pkgdir/opt/fs2_open/fs2_open_3.7.3_${_commit_hash:0:7}"
		msg "The output binary will be called 'fs2_open_3.7.3_${_commit_hash:0:7}'"
	else
		install -D -m755 code/fs2_open_3.7.3_DEBUG "$pkgdir/opt/fs2_open/fs2_open_3.7.3_DEBUG_${_commit_hash:0:7}"
	fi
}

