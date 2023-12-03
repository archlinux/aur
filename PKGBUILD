# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=cleo
pkgname=python-cleo-v0
pkgver=0.8.1
pkgrel=5
pkgdesc="create beautiful and testable command-line interfaces"
arch=('any')
url="https://github.com/sdispater/${_pkgname}"
license=('MIT')
depends=('python-clikit')
makedepends=(
	python-build
	python-poetry-core
	python-build
	python-installer
	python-wheel
)
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3ff6fe33d9e440dba4d9b0947e65ebebf95671d18d89b67bed1e1a09d2266bc1')
b2sums=('57971f6254a31ecf5101d89e96607b5915ab5138d727279d445172b89a10acd6b76619d344973fa2bdbc320866fa1dbdf05c889f4eca879839fa6bcbbad0af7c')

prepare() {
	cd ${_pkgname}-${pkgver}

	sed -Ei '/^name =/s/"(cleo)"/"\1-v0"/' pyproject.toml
	[[ -d cleo ]] && mv cleo{,_v0}
	find \( -name '*.py' -or -name '*.rst' \) \
		-exec sed -Ei 's/(from cleo)\s/\1_v0 /;s/cleo\./cleo_v0./' '{}' +
}
build(){
    python -m build --no-isolation --wheel "${_pkgname}-${pkgver}"
}

check() {
    cd ${_pkgname}-${pkgver}
    python -m pytest
}

package() {
    cd ${_pkgname}-${pkgver}

    python -m installer --destdir="$pkgdir" \
		"$srcdir/$_pkgname-$pkgver/dist/${_pkgname}_v0-${pkgver%.r*}-py2.py3-none-any.whl"
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}
