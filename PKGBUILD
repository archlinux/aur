# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# from: pypi
# what: cleo

_pkgname=cleo
pkgname=python-cleo-v0
pkgver=2.0.1
pkgrel=1
pkgdesc="create beautiful and testable command-line interfaces"
arch=('any')
url="https://github.com/sdispater/${_pkgname}"
license=('MIT')
depends=('python-clikit')
makedepends=('python-pyproject2setuppy')
checkdepends=('python-pytest' 'python-pytest-mock')
provides=("python-cleo=$pkgver")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cb9b60c9559d26a289b0536b134f9efe1b59632f51dc38b20c8a9076b99e0f07')
b2sums=('dcaeff38c2dcb13b3c11200aa97cb2a1c16004558aabf9b44f1ba7ddd5d9c8c7784ea0ba1c50c19b015a6ff0659cb116b8ee926670091e39fd2b1cfd426cb72a')

prepare() {
	cd ${_pkgname}-${pkgver}

	sed -Ei '/^name =/s/"(cleo)"/"\1-v0"/' pyproject.toml
	[[ -d cleo ]] && mv cleo{,_v0}
	find \( -name '*.py' -or -name '*.rst' \) \
		-exec sed -Ei 's/(from cleo)\s/\1_v0 /;s/cleo\./cleo_v0./' '{}' +
}
build(){
    cd ${_pkgname}-${pkgver}
    python -m pyproject2setuppy build
}

check() {
    cd ${_pkgname}-${pkgver}
    python -m pytest
}

package() {
    cd ${_pkgname}-${pkgver}

    python -m pyproject2setuppy install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}
