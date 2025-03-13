# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>
# Contributor: freijon <freijon@gmail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>, ZekeSulastin <zekesulastin@gmail.com>, Martin Merget <mergetmartin@gmail.com>

pkgname=fs2_open-git
pkgver=24.2.0.RC8.20250311.a92368da9.0
pkgrel=1
pkgdesc="An enhancement of the original Freespace 2 engine - GIT version"
url="http://scp.indiegames.us"
arch=('i686' 'x86_64')
license=('custom:fs2_open')
depends=('libjpeg' 'libpng' 'libtheora' 'libvorbis' 'lua51' 'mesa' 'openal' 'sdl')
makedepends=('git' 'cmake' 'freetype2' 'doxygen' 'ffmpeg')
conflicts=('fs2_open')
provides=('fs2_open')
install=fs2_open-git.install
source=("${pkgname}::git+https://github.com/scp-fs2open/fs2open.github.com.git")

sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive
}

pkgver () {
	cd "$srcdir/$pkgname"
	version=`git tag --list | grep "release_.._" | sort -n | tail -n 1 | sed 's/release_//g;s/_/./g;s/-/./g'`
	tag=`git describe --tags $(git rev-list --tags --max-count=1) | sed 's/nightly_//g;s/_/./g;s/-/./g'`
	commits_since_tag=`git rev-list --count $(git describe --tags $(git rev-list --tags --max-count=1))..HEAD`
	echo ${version}.${tag}.${commits_since_tag}
}

build()
{
	cd "$srcdir/$pkgname"

	mkdir build
	cd build
	cmake ../
	make
}

package () {
	cd "$srcdir/$pkgname/build/bin"
	binary=`find fs2_open*`
	cd ../..

	install -D -m644 Copying.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D -m755 build/bin/${binary} "$pkgdir/opt/fs2_open/${binary}"
	msg "The output binary will be called '${binary}'"
}

