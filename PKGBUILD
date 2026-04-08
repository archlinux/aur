pkgbase='python-moviepy'
pkgname=('python-moviepy')
_module='moviepy'
pkgver='2.2.1'
pkgrel=4
pkgdesc="Video editing with Python"
url="https://zulko.github.io/moviepy/"
depends=('python' 'python-decorator' 'python-numpy' 'python-pillow' 'python-imageio' 'python-imageio-ffmpeg' 'python-proglog' 'python-dotenv')
optdepends=('ipython: display clips in Jupyter notebooks')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c80cb56815ece94e5e3e2d361aa40070eeb30a09d23a24c4e684d03e16deacb1')

latestver() {
    curl -fsSL "https://pypi.org/pypi/${_module}/json" | jq -r '.info.version'
}

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    sed -i "s/^__version__ = .*/__version__ = \"${pkgver}\"/" moviepy/version.py
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
	rm -rfv "tests/"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
