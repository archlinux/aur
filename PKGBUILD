# Maintainer: Guoyi Zhang <myname at malacology dot net>

_pkgname=MicroTex
pkgname="${_pkgname,,}-git"
pkgver=2022.12.23
pkgrel=1
provides=("clatexmath" "${_pkgname,,}")
pkgdesc="A dynamic, cross-platform, and embeddable LaTeX rendering library"
arch=("x86_64")
url="https://github.com/NanoMichael/${_pkgname}"
license=('MIT')
depends=("gtkmm3" "gtksourceviewmm" "tinyxml2")
makedepends=("git" "meson")
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf $(TZ=UTC git log --no-walk --pretty="%cd" --decorate=full --date=format-local:%Y.%m.%d | head -n 1)
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	arch-meson . _build
}

build() {
	cd "${srcdir}/${_pkgname}"
	ninja -C _build
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" meson install -C _build
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	sed -n '/The .* License/,/ SOFTWARE\./p' README.md > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
