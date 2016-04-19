# Maintainer: zfo <zfoofz1 at gmail dot com>

pkgname=libmir-git
_gitname=mir
pkgver=245
pkgrel=1
pkgdesc="Generic Numeric Library for the D Programming language"
arch=('i686' 'x86_64')
url="https://github.com/DlangScience/mir"
license=('BSL')
depends=('libphobos-devel')
makedepends=('git')
source=("git://github.com/DlangScience/$_gitname.git")
md5sums=('SKIP')
conflicts=('libmir')

pkgver() {
	cd "$_gitname"
	git rev-list --count HEAD
}

build() {
	cd $srcdir/$_gitname
	sed -i 's/sourceLibrary/dynamicLibrary/' dub.json
	dub build
	sed -i 's/sourceLibrary/staticLibrary/' dub.json
	dub build
}

package() {
	install -Dm644 $srcdir/$_gitname/libmir.so $pkgdir/usr/lib/libmir.so
	install -Dm644 $srcdir/$_gitname/libmir.a $pkgdir/usr/lib/libmir.a

	mkdir -p $pkgdir/usr/include/dlang/dmd/mir
	cp -r $srcdir/$_gitname/source/mir/* $pkgdir/usr/include/dlang/dmd/mir/

    find $pkgdir/usr -type f | xargs chmod 0644

	install -Dm644 $srcdir/$_gitname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
