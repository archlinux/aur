# Maintainer: Anthony Wang <a_at-exozy_dot-me>

_name='jupyter-server-proxy'
pkgname="python-$_name"
pkgver=4.2.0
pkgrel=1
pkgdesc="Jupyter notebook server extension to proxy web services"
url="https://github.com/jupyterhub/jupyter-server-proxy"
depends=(python python-aiohttp python-simpervisor)
makedepends=(python-build python-installer python-hatch-jupyter-builder python-hatch-nodejs-version jupyterlab)
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e4397eed637279a16ca7ab7c87bf276dc4422545f2d1aff9a0d10e5ebc7f012b')

build() {
    cd "${_name//-/_}-$pkgver"
    # Arch Linux's jupyerlab packaging is really bad and doesn't package the same dependencies as the PyPI version, so let's just --skip-dependency-check and hope for the best
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    mv "$pkgdir/usr/etc" "$pkgdir" # Move /usr/etc stuff to /etc where it actually belongs
}
