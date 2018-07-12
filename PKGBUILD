# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Alexandre Macabies <web+oss@zopieux.com>
#
pkgname='gn-git'
pkgdesc='Meta-build system which generates Ninja build files'
pkgver=r1438.8ce4e49a
pkgrel=1
license=('BSD')
arch=('x86_64' 'i686')
conflicts=('gn-bin')
provides=('gn')
depends=('glibc' 'gcc-libs')
makedepends=('python2' 'ninja' 'clang')
url='https://gn.googlesource.com/gn'
source=("gn::git+${url}")
sha512sums=(SKIP)

pkgver () {
	export GIT_DIR="${startdir}/gn"
	printf "r%s.%s" "$(git --bare rev-list --count HEAD)" "$(git --bare rev-parse --short HEAD)"
}

build () {
	cd gn
	python2 build/gen.py
	ninja -C out
}

package () {
	install -Dm755 gn/out/gn "${pkgdir}/usr/bin/gn"

	# Documentation
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		gn/tools/gn/docs/*.md

	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/example" \
		gn/tools/gn/example/*.*
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/example/build" \
		gn/tools/gn/example/build/*.*

	# Vim support
	local item
	for item in autoload ftplugin ftdetect syntax ; do
		install -Dm 644 -t "${pkgdir}/usr/share/vim/vimfiles/${item}" \
			"gn/tools/gn/misc/vim/${item}"/*.vim
	done
		
	# License
	install -m 644 -D gn/LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
