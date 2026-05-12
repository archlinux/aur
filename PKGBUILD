# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: gilbus <aur (AT) tinkershell dot eu>

_upstreamver='0.9.2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='frogmouth'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Markdown browser for your terminal"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/frogmouth/'
_url_github='https://github.com/textualize/frogmouth'
url=${_url_github}

provides=("${_pypi_package}")
conflicts=("python-${pkgname}")

makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core' 'python-hatchling')
depends=('python' 'python-textual' 'python-httpx' 'python-typing_extensions' 'python-xdg-base-dirs' 'python-linkify-it-py')

_package="https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz"
# _package="${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz"

source=("${_package}" 'xdg-base-dirs.patch')
sha256sums=('0e8724cff43f6fe50408595936281d4d4b65b14c456d26e7ba7c401428812f08'
            '35c37c57ec45ed802365b3e6aff2f278118e0b1da45b8bd43e0e388d28435a85')

prepare() {
	cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

	patch -Np1 -i ${srcdir}/xdg-base-dirs.patch
}

build() {
	cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
