# Maintainer: CubeTheThird <cubethethird@gmail.com>

pkgname=e4rat-lite-git
_gitname=e4rat-lite
pkgdesc="An improved version of e4rat, a toolset to accelerate the boot process and application startups."
url=https://github.com/ShyPixie/$_gitname
pkgver=2.7.r87.0881c2e
pkgrel=4

arch=(i686 x86_64)
license=('GPL3')
depends=('e2fsprogs>=1.41' 'gettext>=0.18' 'boost-libs>=1.41' 'audit>=0.1.7')
makedepends=('git' 'cmake>=2.6' 'boost' 'perl')

optdepends=('bootchart2: A "startup" graphing tool')

conflicts=('ureadahead' 'e4rat-preload-lite' 'e4rat-preload-lite-git' 'e4rat-lite')

source=("git://github.com/ShyPixie/$_gitname.git"
        "$pkgname.install"
        "e4rat-lite-git-update.hook")

md5sums=('SKIP'
         'e0deb0fc92359da3a1970bbab467ffdf'
         'b889cd20982a0d95fb694719174f5a11')
         
install=$pkgname.install
backup=('etc/e4rat-lite.conf')

pkgver() {
  cd "$srcdir"/$_gitname
  printf "2.7.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir"

	#Edit the cmd to automatically re-build the package
	cmd="echo 'NOTICE: Boost has been updated. Please re-build $pkgname.'"
	sed -i "/Exec=/ s/$/$cmd/" 'e4rat-lite-git-update.hook'

	if [ -d "build" ]; then
		rm -rf build/*
	else
		mkdir build
	fi
}

build() {
	cd "$srcdir"/build
	
	cmake "$srcdir"/$_gitname -DCMAKE_BUILD_TYPE=release \
	                          -DCMAKE_INSTALL_PREFIX="/usr"
	
	make
	
	rm -rf "$srcdir"/$_gitname/lib${pkgname}-core.a
}

package() {
	cd "$srcdir/build"
	
	make DESTDIR="$pkgdir" install
	
	mkdir -p "$pkgdir/usr/share/doc/${pkgname}/"
	mkdir -p "$pkgdir/usr/share/license/${pkgname}/"

	install -m644 "$srcdir"/$_gitname/README* 				"$pkgdir"/usr/share/doc/${pkgname}/
	install -m644 "$srcdir"/$_gitname/LICENSE* 				"$pkgdir"/usr/share/license/${pkgname}/
	install -vDm644 "$srcdir"/e4rat-lite-git-update.hook	"$pkgdir"/usr/share/libalpm/hooks/e4rat-lite-git-update.hook
}
