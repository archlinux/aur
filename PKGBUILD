# Maintainer: freijon <freijon@gmail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>, ZekeSulastin <zekesulastin@gmail.com>

pkgname=fs2_open-svn
pkgver=3.7.3
pkgrel=11334
pkgdesc="An enhancement of the original Freespace 2 engine - SVN version"
url="http://scp.indiegames.us"
arch=('i686' 'x86_64')
license=('custom:fs2_open')
depends=('libjpeg' 'libpng' 'libtheora' 'libvorbis' 'lua51' 'mesa' 'openal' 'sdl')
makedepends=('subversion')
conflicts=('fs2_open')
provides=('fs2_open')
install=fs2_open-svn.install
source=('fs2_open-svn')
md5sums=('c58bd3d0cf59b767066d89b5b053ecc0')

_svntrunk=svn://svn.icculus.org/fs2open/trunk/fs2_open
_svnmod=fs2_open

build()
{
	cd "$srcdir"
	msg "Connecting to SVN server...."

	if [[ -d "$_svnmod/.svn" ]]; then
		(cd "$_svnmod" && svn up)
	else
		svn co "$_svntrunk" --config-dir ./ "$_svnmod"
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"

	# Add --enable-debug to make a debug build.  These are NOT meant for general play;
	#  only make a debug build if generating logs/bugreports.  This is true even for
	#  these SVN builds, if you're using a mod that requires them.
	LDFLAGS="-l:liblua.so.5.1 $LDFLAGS" CXXFLAGS="-I/usr/include/lua5.1 $CXXFLAGS" ./autogen.sh --enable-speech
	make
}

package () {
	cd "$srcdir/$_svnmod-build"

	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	if [[ -x code/fs2_open_3.7.3 ]]; then
		install -D -m755 code/fs2_open_3.7.3 "$pkgdir/opt/fs2_open/fs2_open_3.7.3"
	else
		install -D -m755 code/fs2_open_3.7.3_DEBUG "$pkgdir/opt/fs2_open/fs2_open_3.7.3_DEBUG"
	fi
	install -D -m755 "$srcdir/fs2_open-svn" "$pkgdir/usr/bin/fs2_open"
}

