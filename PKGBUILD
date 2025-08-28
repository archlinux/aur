# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>
# Contributor: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname='python-jira'
_pkgname='jira'
pkgdesc='Python library to work with Jira APIs'
pkgver=3.10.5
pkgrel=1
url='https://github.com/pycontribs/jira'
license=('BSD-2-Clause')
arch=('any')
# TODO not sure what to do about 'python-filemagic'
#   https://github.com/pycontribs/jira/blob/main/setup.cfg
#   https://archlinux.org/todo/replace-filepython-magic-aka-file-magic-with-ahupppython-magic/
depends=(
	'python-defusedxml'
	'python-requests-oauthlib'
	'python-packaging'
	'python-pillow'
	'python-typing_extensions'
	'python-requests'
	'python-requests-toolbelt')
optdepends=(
	'ipython: jirashell'
	'python-keyring: jirashell')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-wheel'
	'python-setuptools-scm'
	'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pycontribs/jira/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ca255690116b6161f131dcd230ad75ed18739db43e59aaf65d302eb9a131fafb')

build() {
	cd "${srcdir}/jira-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/jira-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	local _site_packages
	_site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	rm -rf "${pkgdir}/${_site_packages}/tests"
}
