pkgname=ponscripter
pkgver=v3.0.1
_pkgver=`curl -s https://api.github.com/repos/07th-mod/ponscripter-fork/releases/latest|grep tag_name|cut -d\" -f4`
pkgrel=2
pkgdesc="Fork of the Ponscripter visual novel engine to take advantage of SDL2 and improve Steam integration"
arch=(x86_64 aarch64)
url=https://github.com/07th-mod/ponscripter-fork
license=(GPL)
depends=(sdl2_{image,mixer} smpeg freetype2)
makedepends=(xmlto docbook-xsl)
source=(git+https://github.com/07th-mod/ponscripter-fork.git#tag=$_pkgver)
md5sums=(SKIP)
pkgver(){
	echo $_pkgver
}
build(){
	cd $pkgname-fork
	./configure -with-external-sdl-mixer
	make
	sed -i 's/ *//;/^$/d' doc/*.[0-9]	# fix indentation
	A=doc/ponscr-ext.7;sed -i '219d;222,231d;'218r<(sed '287,323!d;287s/^d/D/' $A.xml) $A	# fix ponscr-ext
}
package(){
	cd $pkgname-fork
	make PREFIX="$pkgdir"/usr install
	install BUGS CHANGES MANUAL README.md TODO -Dt "$pkgdir"/usr/share/doc/$pkgname
	mv "$pkgdir"/usr/{man,share}
}
