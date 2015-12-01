# Maintainer: maz-1 <loveayawaka@gmail.com>

_pkgname=oinut
pkgname=$_pkgname-git
pkgver=20151109.g4aba7bf
pkgrel=1
pkgdesc="Animation Software for Linux."
arch=('x86_64' 'i686')
url="http://oinut.org/"
license=('GPL3')
depends=('opencv' 'zlib' 'qtwebkit' 'sane' 'quazip-qt5' 'qt5-svg' 'qt5-multimedia' 'qt5-base')
makedepends=('git')
optdepends=('ffmpeg: import video and render video')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git://github.com/purplehuman/$_pkgname.git")
sha256sums=('SKIP')
_gitname=$_pkgname

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git show -s --format="%ci"|grep -oP '\d{4}-\d{2}-\d{2}'|sed 's:-::g').g$(git describe --always)"
}


prepare() {
        rm -rf "${srcdir}/build"
        mkdir "${srcdir}/build"
        cd "${srcdir}/${_gitname}"
        find ./ -type f -exec sed -i 's:#include <quazip/:#include <quazip5/:g' {} \;
        sed -i 's:-lquazip-qt5:-lquazip5:g' oinut.pro
}
build() {
	cd "${srcdir}/build"
	qmake-qt5 ../${_gitname}/oinut.pro
	make
}

package() {
	cd "$srcdir/build"
	INSTALL_ROOT="$pkgdir" make install
}
