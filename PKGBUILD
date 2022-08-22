# Maintainer: <thysupremematrix@tuta.io>
pkgname=gnome-shell-extension-datetime-format-git
pkgver=r23.453e932
pkgrel=1
pkgdesc="Gnome extension which allows users to customise the datetime format on the status bar and date menu."
arch=(any)
url="https://github.com/nvlgit/datetime-format"
license=("GPL3")
depends=('gnome-shell>=1:40')
makedepends=('git' 'nodejs')
source=("git+https://github.com/nvlgit/datetime-format.git" "build.patch")
install="gnome-shell-extension.install"
sha256sums=('SKIP'
            'ca11b183e163eb143ea3a7ae937df07bd9759ff141764ac09117364cff8fc10d')

_gitname="datetime-format"

prepare(){
	cd $srcdir/${_gitname}
	patch -p1 -i "${srcdir}/build.patch"
}

pkgver() {
	cd $srcdir/${_gitname}
	( set -o pipefail
    		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
 	 )
}

build() {
	cd "$srcdir/${_gitname}"
	node build.js system
}

package() {
	cp -R $srcdir/${_gitname}/pkg/* $pkgdir
}
