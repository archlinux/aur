pkgname=btop-gpu-git
pkgver=1.3.0.r836.0d35746
pkgrel=3
pkgdesc="A monitor of resources compiled with gpu support flags!"
arch=(any)
url="https://github.com/aristocratos/btop"
license=('Apache-2.0')
makedepends=('gcc-libs' 'make' 'git')
optdepends=(
	'rocm-smi-lib: AMD GPU Support'
	'nvidia-utils: Nvidia GPU Support'
	)
source=("${pkgname}::git+https://github.com/aristocratos/btop.git")
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
	if ! pacman -Qq 'rocm-smi-lib' &>/dev/null && ! pacman -Qq 'nvidia-utils' &>/dev/null; then
		echo "ERROR: Either 'rocm-smi-lib' (for AMD) or 'nvidia-utils' (for Nvidia) must be installed."
		false
  	fi

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
