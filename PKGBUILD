# Maintainer: BrainDamage
pkgname="zipunicode-git"
_dirname="${pkgname%-git}"
_basename="${pkgname%-git}"
pkgver=r10.412b942
pkgrel=1
pkgdesc="Extract zip file with correct encoding, standalone binary and python package"
arch=(any)
url="https://github.com/Dragon2fly/ZipUnicode"
license=("MIT")
depends=('python' 'python-chardet')
makedepends=(git python-build python-installer python-wheel)
source=("${_dirname}::git+https://github.com/Dragon2fly/ZipUnicode")
sha256sums=('SKIP')
# conflict/provide the same package as the non -git version
provides=("${_basename}")
conflicts=("${_basename}")

pkgver() {
	cd "${srcdir}/${_dirname}"

	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	# 0.9.9.r27.g2b039da # if tags exist
	# r1581.2b039da      # else fallback
}


build() {
	cd "${srcdir}/${_dirname}"
	export PYTHONHASHSEED=0
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_dirname}"
	find dist -name '*.whl' -exec python -m installer --compile-bytecode 1 --destdir="${pkgdir}" {} \;
}
