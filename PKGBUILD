# Maintainer: maz-1 <loveayawaka@gmail.com>

_pkgname=bililocal
pkgname=$_pkgname-git
pkgver=467.595c40c
pkgrel=1
pkgdesc="Video player that can display barrage-like comments grabbed from danmaku websites like bilibili.com,acfun.tv and niconico.jp. "
arch=('x86_64' 'i686')
url="http://github.com/AncientLysine/BiliLocal"
license=('GPL')
depends=('qt5-base' 'vlc')
makedepends=('git' 'qt5-tools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git://github.com/AncientLysine/$_pkgname.git"
        "bililocal.svg"
         "bililocal.desktop")
md5sums=('SKIP' 
		'2a6ab8d09913bb2494f687d8b9d0a449'
 		'64d8e7db2aadaa28e2333a97a477e6ba')
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
		cp ${srcdir}/bililocal/res/*.ts ./
		lrelease-qt5 *.ts        
}

package() {
		cd "$srcdir/build"
		install -dm 755 ${pkgdir}/usr/{bin,share/applications,share/bililocal}
		install -Dm 755 BiliLocal ${pkgdir}/usr/share/bililocal/bililocal
		install -m 644 ${srcdir}/bililocal.desktop ${pkgdir}/usr/share/applications
		#install -m 644 ${srcdir}/logo.png ${pkgdir}/usr/share/bililocal
		install -D -m 0644 ${srcdir}/bililocal.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/bililocal.svg
        echo '#!/bin/sh' >> ${pkgdir}/usr/bin/bililocal
		echo 'exec /usr/share/bililocal/bililocal "$@"' >> ${pkgdir}/usr/bin/bililocal
		chmod +x ${pkgdir}/usr/bin/bililocal
        ls | grep -oP '[_a-zA-Z0-9]+(?=\.qm)' | while read locale 
        do 
			install -Dm 644 ${locale}.qm ${pkgdir}/usr/share/bililocal/locale/${locale}/bililocal.qm
		done
}
