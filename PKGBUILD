# Maintainer: Jesse McClure <code at jessemcclure dot org>
_fossil=tabby
pkgname=${_fossil}-fossil
pkgver=1.2r54.ff6db57fc2
pkgrel=1
pkgdesc='Tabbed tiling wayland compositor'
arch=('x86_64')
license=('MIT')
depends=(cairo fontconfig glibc libxkbcommon wayland wlroots)
makedepends=(fossil)
url=https://code.jessemcclure.org/${_fossil}
source=(fossil+${url})
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${_fossil}"
	printf '%sr%s.%s\n' \
		$(fossil tag list | grep '[0-9\.*]' | sort -r | sed 1q) \
		$(fossil info | sed -n '$s/[a-z:-]* *//p') \
		$(fossil timeline -n 1 -t ci -F %h | sed 1q)
}

build() {
	cd "${srcdir}/${_fossil}"
	make protocols
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/${_fossil}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

