# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Co-Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>
# Contributor: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname='python-jira'
_pkgname='jira'
pkgdesc='Python library to work with Jira APIs'
pkgver=3.9.1
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
sha256sums=('c5cf3fadf36c391d609e7e7dbf9af213acb4222d6674c7004d4037041ee529c6')

build() {
	cd "${srcdir}/jira-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/jira-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	local site_packages
	site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	rm -rf "${pkgdir}/${site_packages}/tests"
}
