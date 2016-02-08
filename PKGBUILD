# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
#
# Inspiration for this PKGBUILD:
#     https://gist.github.com/mohamed/4fa7eb75807463d4dfa3
#
pkgname='gn-git'
pkgdesc='Meta-build system which generates Ninja build files'
pkgver=r694.feb0c39
pkgrel=2
license=('BSD')
arch=('x86_64' 'i686')
depends=('glibc' 'gcc-libs')
makedepends=('python2')
source=(
	'https://chromium.googlesource.com/chromium/chromium/+archive/master/third_party/libevent.tar.gz'
	"git+https://chromium.googlesource.com/chromium/src/tools/gn"
	"git+https://chromium.googlesource.com/chromium/src/base"
	"git+https://chromium.googlesource.com/chromium/src/build"
	"git+https://chromium.googlesource.com/chromium/src/build/config"
	"git+https://chromium.googlesource.com/chromium/testing/gtest"
	LICENSE
)
noextract=('libevent.tar.gz' 'gn' 'base' 'build' 'config' 'gtest')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare () {
	rm -rf "${srcdir}/work"

	mkdir -p "${srcdir}/work/third_party/libevent"
	tar -xzf "${srcdir}/libevent.tar.gz" -C "${srcdir}/work/third_party/libevent"

	# Shuffle things around a bit to put everything where it is suppossed to be
	mkdir -p "${srcdir}/work"/{tools,testing}
	mv "${srcdir}/gn"     "${srcdir}/work/tools"
	mv "${srcdir}/base"   "${srcdir}/work"
	mv "${srcdir}/build"  "${srcdir}/work"
	mv "${srcdir}/config" "${srcdir}/work"
	mv "${srcdir}/gtest"  "${srcdir}/work/testing"
}

pkgver () {
	export GIT_DIR="${startdir}/gn"
	(
		set -o pipefail
		git --bare describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git --bare rev-list --count HEAD)" "$(git --bare rev-parse --short HEAD)"
  	)
}

build () {
	cd "${srcdir}/work/tools/gn"
	python2 bootstrap/bootstrap.py -s
}

package () {
	cd "${srcdir}/work"
	install -Dm755 out/Release/gn "${pkgdir}/usr/bin/gn"

	# Documentation
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
	cp -r tools/gn/README.md tools/gn/docs/*.md tools/gn/example \
		"${pkgdir}/usr/share/doc/${pkgname}/"

	# Vim support
	mkdir -p "${pkgdir}/usr/share/vim/vimfiles"
	cp -r tools/gn/misc/vim/{ftdetect,syntax} \
		"${pkgdir}/usr/share/vim/vimfiles/"

	# License
	install -Dm644 "${startdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

