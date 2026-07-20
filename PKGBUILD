# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=soifunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=151.f261ea5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://gitlab.com/shssoichiro/soifunc'
license=('MIT')
depends=(
	'vapoursynth'
	'vapoursynth-plugin-neo_f3kdb-git'
	'vapoursynth-plugin-vsjetpack'
	'vapoursynth-plugin-vszip'
	'vapoursynth-plugin-znedi3'
)
optdepends=(
	'vapoursynth-plugin-bm3dcuda: BM3D support, GPU version'
	'vapoursynth-plugin-bm3dcuda-cpu: BM3D support, CPU version'
	'vapoursynth-plugin-dfttest2: dfttest support, GPU version'
	'vapoursynth-plugin-dfttest2-cpu: dfttest support, CPU version'
	'vapoursynth-plugin-mlrt: frame interpolation functions'
	'vapoursynth-plugin-mlrt-ext-models-rife: frame interpolation functions'
)
makedepends=(
	'git'
	'python-poetry'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://gitlab.com/shssoichiro/soifunc.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_plug}"

	_rev=$(git rev-list --count --all)
	_hash=$(git rev-parse --short HEAD)
	printf "%s.%s" "$_rev" "$_hash"
}

build() {
	cd "${_plug}"
	rm -rf dist/
	poetry build -f wheel
}

package() {
	cd "${_plug}"
	pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

	install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
