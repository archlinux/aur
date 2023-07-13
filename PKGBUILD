# Maintainer: Matrix <thysupremematrix atttt tuta dottt io>

pkgname=hexchat-theme-manager-git
_root_pkgname=hexchat
pkgver=2.16.1.r33.g6155c183
pkgrel=1
pkgdesc='A simple application to manage HexChat themes'
arch=('i686' 'x86_64')
url='https://hexchat.github.io'
license=('GPL')
depends=('mono' 'hexchat>=2.16.1')
makedepends=('monodevelop' 'meson')
source=("git+https://github.com/hexchat/hexchat.git")
sha256sums=('SKIP')

_files=(
	"usr/share/applications/io.github.Hexchat.ThemeManager.desktop"
	"usr/share/mime/packages/io.github.Hexchat.ThemeManager.xml"
	"usr/bin/thememan.exe"
	"usr/bin/thememan"
)

pkgver() {
	cd "${srcdir}/$_root_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}"
	arch-meson $_root_pkgname build -Dtheme-manager=true
	meson compile -C build
}

package() {
	cd "${srcdir}"
	meson install -C build --destdir "${srcdir}/full" # It also builds stuff already in hexchat package
	
	# Only install stuff not in hexchat package
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/mime/packages"
	install -d "${pkgdir}/usr/share/applications"
	
	for file in "${_files[@]}"
	do
		echo $file
		cp "${srcdir}/full/${file}" "${pkgdir}/${file}"
	done
}


