# Maintainer: Champion丶Alan <1246186978@qq.com>

_pkgname=bililocal-osx
pkgname=$_pkgname-git
pkgver=544.95dab3b
pkgrel=1
pkgdesc="Video player that can display barrage-like comments grabbed from danmaku websites like bilibili.com,acfun.tv and niconico.jp. "
arch=('x86_64' 'i686')
url="https://github.com/asahui/BiliLocal-OSX/"
license=('GPL')
depends=('qt5-base' 'vlc')
makedepends=('git' 'qt5-tools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git://github.com/asahui/$_pkgname.git"
        "bililocal-osx.svg"
         "bililocal-osx.desktop")
md5sums=('SKIP' 
		'2a6ab8d09913bb2494f687d8b9d0a449'
 		'b822cb779f2bcb20f54c2f1137305b47')
_gitname=$_pkgname

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}
prepare() {
     rm -rf ${srcdir}/build
     mkdir ${srcdir}/build
}
build() {
		cd "$srcdir/build"
		qmake-qt5 ../${_gitname}/BiliLocal.pro
		make
		cp ${srcdir}/bililocal-osx/res/*.ts ./
		lrelease-qt5 *.ts        
}

package() {
		cd "$srcdir/build"
		install -dm 755 ${pkgdir}/usr/{bin,share/applications,share/bililocal-osx}
		install -Dm 755 BiliLocal ${pkgdir}/usr/share/bililocal-osx/bililocal-osx
		install -m 644 ${srcdir}/bililocal-osx.desktop ${pkgdir}/usr/share/applications
		install -D -m 0644 ${srcdir}/bililocal-osx.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/bililocal-osx.svg
        echo '#!/bin/sh' >> ${pkgdir}/usr/bin/bililocal-osx
		echo 'exec /usr/share/bililocal-osx/bililocal-osx "$@"' >> ${pkgdir}/usr/bin/bililocal-osx
		chmod +x ${pkgdir}/usr/bin/bililocal-osx
        ls | grep -oP '[_a-zA-Z0-9]+(?=\.qm)' | while read locale 
        do 
			install -Dm 644 ${locale}.qm ${pkgdir}/usr/share/bililocal-osx/locale/${locale}/bililocal.qm
		done
}
