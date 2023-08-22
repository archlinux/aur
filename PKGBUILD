# Maintainer: Matrix <thysupremematrix atttt tuta dottt io>

pkgname=hexchat-theme-manager-git
_root_pkgname=hexchat
pkgver=2.16.1.r34.gcda96128
pkgrel=3
pkgdesc='A simple application to manage HexChat themes'
arch=('i686' 'x86_64')
url='https://hexchat.github.io'
license=('GPL')
depends=('mono' 'hexchat>=2.16.1')
makedepends=('meson' 'msbuild')
source=("git+https://github.com/hexchat/hexchat.git" "thememan")
sha256sums=('SKIP'
            '2ac84fb550986eacaa45d2e16644589652101ab092fd7e1571d0726605efc889')

pkgver() {
	cd "${srcdir}/${_root_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_root_pkgname}/src/htm"

	_platform="x86"
	if [ "${CARCH}" == 'x86_64' ]; then
	    _platform="x64"
	    sed -i "s/x86/x64/g" htm.csproj
	fi

	msbuild /property:Configuration=Release /property:Platform="${platform}"
}

package() {
	install -Dm755 "${srcdir}/${_root_pkgname}/src/htm/obj/${_platform}/Release/thememan.exe" "${pkgdir}/usr/bin/thememan.exe"
	install -Dm755 "${srcdir}/thememan" "${pkgdir}/usr/bin/thememan"
	install -Dm644 "${srcdir}/${_root_pkgname}/data/misc/io.github.Hexchat.ThemeManager.desktop.in" "${pkgdir}/usr/share/applications/io.github.Hexchat.ThemeManager.desktop"
	install -Dm644 "${srcdir}/${_root_pkgname}/data/misc/io.github.Hexchat.ThemeManager.xml" "${pkgdir}/usr/share/mime/packages/io.github.Hexchat.ThemeManager.xml"
}


