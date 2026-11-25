# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="transparent-tor-proxy"
pkgver=0.5.1
pkgrel=1
pkgdesc="A Linux CLI tool that transparently routes all system traffic through the Tor network using nftables"

_git_author="onyks-os"
_git_name="TransparentTorProxy"
_git_version="v${pkgver}"

_pypi_package="${pkgname}"
_pypi_version="${pkgver}"

_execname=ttp

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_git_author}/${_git_name}"
url="${_url_github}"

provides=("${_execname}")

makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
depends=('tor' 'nftables' 'python' 'python-stem' 'python-typer' 'python-rich' 'python-transitions')
optdepends=('apparmor: required for managed Tor when the kernel selects AppArmor'
			'networkmanager: required VPN mode'
			'wireguard-tools: required VPN mode')

backup=("etc/${_execname}/${_execname}.conf")

source=("git+${_url_github}.git#tag=${_git_version}")
# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/${_git_version}.tar.gz")
sha256sums=('21c7c748a5e8b7827a7ede3d20deba4295c980c654a76e85959a8ebf2bbfe549')

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

	install -Dm644 "assets/${_execname}.conf.example" "${pkgdir}/etc/${_execname}/${_execname}.conf"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/bridges.md" "${pkgdir}/usr/share/doc/$pkgname/BRIDGES.md"
	install -Dm644 "docs/profiles.md" "${pkgdir}/usr/share/doc/$pkgname/PROFILES.md"
	install -Dm644 "docs/interfaces.md" "${pkgdir}/usr/share/doc/$pkgname/INTERFACES.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
