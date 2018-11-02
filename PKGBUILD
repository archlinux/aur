# Maintainer: Katie Wolfe <katie@dnaf.moe>

pkgname=linerider-advanced-git
pkgver=1.04.r2.g8c9279a
pkgrel=1
pkgdesc="An open source spiritual successor to the flash game Line Rider 6.2 "
arch=("x86_64")
url="https://github.com/jealouscloud/linerider-advanced"
license=("GPL3")
depends=("mono")
makedepends=("git"
             "nuget")
source=("git+https://github.com/jealouscloud/linerider-advanced.git"
        "git+https://github.com/jealouscloud/gwen-lra.git"
        "linerider-advanced-launcher")
md5sums=('SKIP'
         'SKIP'
         '168c15cb67944b893f4dbdd87cec4c32')
provides=("linerider-advanced")
conflicts=("linerider-advanced")

prepare() {
	cd "$srcdir/linerider-advanced"
	git submodule init
	git config submodule.gwen-lra.url "$srcdir/gwen-lra"
	git submodule update
}

build() {
	cd "$srcdir/linerider-advanced/src"
	nuget restore
	xbuild linerider.sln
}

pkgver() {
	cd "$srcdir/linerider-advanced"
	git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

package() {
	# Wrapper script
	install -d "$pkgdir/usr/bin"
	install -m755 "linerider-advanced-launcher" "$pkgdir/usr/bin/${pkgname%-git}"

	# Install binaries and stuff to /opt/
	cd "$srcdir/linerider-advanced"
	install -d "$pkgdir/opt/${pkgname%-git}"
	cp -a "build/."  "$pkgdir/opt/${pkgname%-git}"
	chmod 755 "$pkgdir/opt/${pkgname%-git}/linerider.exe"

}
