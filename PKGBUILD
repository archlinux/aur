# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: LinArcX <LinArcX at gmail . com>

_base=requests-cache
pkgname=python-${_base}-git
_pkgname=${pkgname%-git}
pkgdesc="Transparent persistent cache for http://python-requests.org library (git version)"
pkgver=r619.5e2abd0
pkgrel=1
arch=('any')
url="https://github.com/reclosedev/${_base}"
license=('custom:BSD-2-clause')
depends=('python-attrs' 'python-itsdangerous' 'python-requests' 'python-url-normalize' 'python-cattrs' 'python-boto3' 'python-redis' 'python-pymongo')
makedepends=('git' 'python-setuptools' 'python-dephell')
# checkdepends=(python-pytest python-requests-mock python-timeout-decorator redis python-ujson)
source=("${_pkgname}::git+${url}")
sha512sums=('SKIP')
provides=(${_pkgname})
conflicts=(${_pkgname})

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/" || return 1

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    ) 
}

prepare() {
  cd "${_pkgname}"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

# check() {
#   cd "${_pkgname}"
#   python setup.py install --root="${PWD}/tmp_install" --optimize=1
#   PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest
# }

package() { 
  cd "${_pkgname}"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}