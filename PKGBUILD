# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
gitname=billig-sweeper
pkgname=billig-sweeper-git
pkgver=v1.2.1.11.gc990239
pkgrel=1
pkgdesc="A cheap Minesweeper clone"
arch=('x86_64' 'aarch64')
url="https://github.com/riscygeek/billig-sweeper"
license=('GPL3')
depends=('sdl2' 'sdl2_image')
makedepends=('git' 'meson' 'ninja')
source=("git+https://github.com/riscygeek/${gitname}" "git+https://github.com/cktan/tomlc99")
sha256sums=(SKIP SKIP)
provides=("${gitname}")
conflicts=("${gitname}")

pkgver() {
	cd "${srcdir}/${gitname}"
	local ver="$(git describe --tags)"
	printf "%s" "${ver//-/.}"
}

prepare() {
	rmdir "${gitname}/tomlc99"
	ln -sf "${srcdir}/tomlc99" "${gitname}/tomlc99"
}

build() {
	cd "${gitname}"

	rm -rf _build
	meson setup _build --prefix=/usr
	meson compile -C _build
}

package() {
	cd "${gitname}"
	meson install -C _build --destdir="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
