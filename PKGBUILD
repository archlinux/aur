# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Co-Maintainer: Martin Rys <rys.pw/contact>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>
# Contributor: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>


pkgname='python-jira'
_pkgname='jira'
pkgdesc='Python library to work with Jira APIs'
pkgver=3.6.0
pkgrel=2
url='https://github.com/pycontribs/jira'
license=('BSD-2-Clause')
arch=('any')
depends=(
	'python-defusedxml'
	'python-magic'
	'python-requests-oauthlib'
	'python-packaging'
	'python-pillow'
	'python-typing_extensions'
	'python-requests'
	'python-requests-toolbelt')
optdepends=(
	'ipython: jirashell'
	'python-keyring: jirashell'
	)
makedepends=(
	'python-setuptools'
	'python-build'
	'python-wheel'
	'python-setuptools-scm'
	'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pycontribs/jira/archive/refs/tags/${pkgver}.tar.gz"
        'pyproject.toml.patch') # https://patch-diff.githubusercontent.com/raw/pycontribs/jira/pull/1776.patch

sha256sums=('879cb1eb6a84b0c7c94cd3c80c7740fc1d3b88d45b2a5f6c8e599b349a77ca3b'
            '8780ba09e1ab32f15f9cb59cbb51d029ba157da18169013f1c1e2d8d27053577')

prepare() {
	ls -lah "${srcdir}"
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/pyproject.toml.patch"
}

build() {
	cd "${srcdir}/jira-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/jira-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	rm -rf "${pkgdir}/${site_packages}/tests"
}
