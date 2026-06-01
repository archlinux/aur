# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=python-minny
pkgver=0.1.0a1_r20.2dcfefa
_commit=2dcfefae26b114d192db8ddb35fcfd4fefd578d6
pkgrel=1
pkgdesc="Package and project manager for MicroPython and CircuitPython"
arch=('any')
url="https://github.com/aivarannamaa/minny"
license=('MIT')
depends=('pyrefly' 'python-isort' 'python-paramiko' 'python-ptyprocess' 'python-pytest' \
         'python-ruff' 'python-syrupy' 'python-types-pyserial' 'python-uv' 'python-uv-build' 'ty')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname#*-}-${_commit}"
  sed -e '/requires.*uv_build/ s/,.*"/"/' \
      -e '/license-files/ s/\[C.*\*/SE/' \
      -i pyproject.toml
}

build() {
  cd "${srcdir}/${pkgname#*-}-${_commit}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname#*-}-${_commit}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 "LICENSE" \
                  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
