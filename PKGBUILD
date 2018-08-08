# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

_pkgname=ripole
pkgname=${_pkgname}-git
pkgver=r2.9a5d124
pkgrel=1
pkgdesc="OLE2 Attachment extraction tool"
license=('BSD')
arch=('i686' 'x86_64')
url="https://github.com/inflex/ripOLE"
conflicts=('ripole')
source=("git+https://github.com/inflex/ripOLE.git")
sha512sums=('SKIP')


pkgver() {
	cd "${srcdir}/ripOLE"
#	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	}

build() {
	cd "${srcdir}/ripOLE"

	make clean || return 1
	sed -i "s|-Werror||g" Makefile
	make || return 1
	}

package() {
	cd "${srcdir}/ripOLE"

	install -D -m 755 ripole ${pkgdir}/usr/bin/ripole
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	for _f in CHANGELOG CONTRIBUTORS README; do
		install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_f}"
	done
	}
