# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=dephell_changelogs
pkgname=python-dephell-changelogs
pkgver=0.0.2
pkgrel=6
pkgdesc="Find changelog for github repository, local dir, parse changelog"
arch=('any')
url="https://github.com/dephell/${_pkgname}"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        '0001-fix-expired-url-in-test-file.patch')
sha256sums=('e639a3d08d389e22fbac0cc64181dbe93c4b4ba9f0134e273e6dd3e26ae70b21'
            '2136a388bea5d373c87d3dca9f5a43bc0f8aa837be8aebde75629d7cf04a224e')
b2sums=('6ec5383ff411e944ea90ae1a47061fdbd3f8bb5cfe9342936a3bebe8fc1e1791f7a5b7dfdb6d2d25bcee3ab1bf28d8bbf9101bb5d317afb5705e909964c49f68'
        '1d8945e24e4708764a0765e202f057384c64915a9791ac7699ef6a48881a6d274baedaaee014a438cd9f38dfef55bbe5d6d62326582d9bf69068615e0711026a')

prepare() {
	cd "${srcdir}"/${_pkgname}-${pkgver}

	# https://github.com/dephell/dephell_changelogs/pull/6
	patch -Np1 -i ../0001-fix-expired-url-in-test-file.patch

}

build(){
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python -m pytest \
        --deselect 'tests/test_finder.py::test_get_changelog_url[pip-' \
        --deselect 'tests/test_finder.py::test_get_changelog_url[attrs-'
}

package() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
