# Maintainer: freijon <freijon@gmail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>, ZekeSulastin <zekesulastin@gmail.com>, Martin Merget <mergetmartin@gmail.com>

pkgname=fs2_open-git
pkgver=20.1.0.r20200319.caebad7.0
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
source=("${pkgname}::git+https://github.com/scp-fs2open/fs2open.github.com.git"
"cotire::git+https://github.com/sakra/cotire.git"
"cmake-modules::git+https://github.com/asarium/cmake-modules.git")

sha256sums=('SKIP'
'SKIP'
'SKIP')

version=20.1.0

pkgver () {
	cd "$srcdir/$pkgname"
	tag=`git describe --tags $(git rev-list --tags --max-count=1) | sed 's/nightly_/r/g;s/_/./g'`
    commits_since_tag=`git rev-list --count $(git describe --tags $(git rev-list --tags --max-count=1))..HEAD`
	echo ${version}.${tag}.${commits_since_tag}
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
	tag=`git describe --tags $(git rev-list --tags --max-count=1) | sed 's/nightly_/r/g'`
    commits_since_tag=`git rev-list --count $(git describe --tags $(git rev-list --tags --max-count=1))..HEAD`
	install -D -m644 Copying.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D -m755 build/bin/${binary} "$pkgdir/opt/fs2_open/${binary}_${tag}_${commits_since_tag}"
	msg "The output binary will be called '${binary}_${tag}_${commits_since_tag}'"
}

