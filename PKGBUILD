# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="network-sandbox-engine"
pkgver=2.5.1
pkgrel=1
pkgdesc="A Linux engine for deterministic nftables firewall testing inside isolated network namespaces"

_git_author="onyks-os"
_git_name="NetworkSandboxEngine"
_git_version="v${pkgver}"

_pypi_package="${pkgname}"
_pypi_version="${pkgver}"

_execname=nse-runner

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_git_author}/${_git_name}"
url="${_url_github}"

provides=("${_execname}")

makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
depends=('nftables' 'python' 'python-typing_extensions' 'python-pydantic' 'python-yaml')
optdepends=()

source=("git+${_url_github}.git#tag=${_git_version}")
# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/${_git_version}.tar.gz")
sha256sums=('e9b54c19abc962978107ab62e5b7f455c374d5015ff8b377aae1f941477dc715')

build() {
	cd "${srcdir}/${_git_name}/" || exit
	# cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit
	# cd "${srcdir}/${_git_name}-${_git_version#v}/" || exit

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_git_name}/" || exit
	# cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit
	# cd "${srcdir}/${_git_name}-${_git_version#v}/" || exit

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	cp -rfa "examples" "${pkgdir}/usr/share/${pkgname}/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
