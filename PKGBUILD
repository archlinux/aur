pkgname=btop-gpu-git
pkgver=1.2.13.r822.0bb8599
pkgrel=1
pkgdesc="A monitor of resources, forked for GPU support - merged into btop!"
arch=(any)
url="https://github.com/romner-set/btop-gpu"
license=('Apache-2.0')
makedepends=('gcc-libs' 'make' 'git' 'rocm-smi-lib')
source=("${pkgname}::git+https://github.com/romner-set/btop-gpu.git")
sha512sums=('SKIP')
provides=('btop')
conflicts=('btop')
options=(!strip)

pkgver() {
	cd "${srcdir}/${pkgname}"
	_pkgver="$(cat CHANGELOG.md | grep '^##' | sed 's/## v//g' | head -1)"

	printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	git submodule update --init --recursive
}

build() {
	cd "${pkgname}"
	make -j $(nproc) ADDFLAGS=-march=native VERBOSE=true GPU_SUPPORT=true
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="${pkgdir}" make PREFIX=/usr install

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
