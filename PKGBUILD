# Maintainer: wuxxin <wuxxin@gmail.com>
# Based on solo-python; original contributors:
# Contributor: mutantmonkey <aur@mutantmonkey.mx>

pkgname=solo1
_pkgname=solo1-cli
pkgver=0.1.1
pkgrel=7
pkgdesc="Python tool and library for SoloKeys Solo 1"
arch=('any')
url="https://github.com/solokeys/${_pkgname}"
license=('Apache-2.0' 'MIT')
depends=(
  'python'
  'python-click>=7.1'
  'python-cryptography'
  'python-ecdsa'
  'python-fido2'
  'python-intelhex'
  'python-pyserial'
  'python-pyusb'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=61.0'
)
replaces=('solo-python')
conflicts=('solo-python')
provides=('solo-python')
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}-169.patch"
  "pyproject-setuptools.patch"
  "fido2-2.x-compat.patch"
  "run_tests.py"
)
sha256sums=('377f0c244ee0efc741f18b3370cc0e5dcaff852db90102eeb258201128643c84'
            '06b4aed197f90604447f5f297f06c5784ede4fa33c90af851cd2ff3f62cf5abf'
            'e7fbbe5b370cfba33f52932e088c491f7ee9fcb732640c9b91276eab0de9746e'
            '71cd05cbd9732f035ab1a570fc5c662ec15d49194cd755bd5acc1e1030c0c17d'
            '9f8b1322f8a6e99848dfdb263d2a6a7d4813d5fc0dcd9a5922422d58042b49f4')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # patch api change in python-fido2 > 0.9
  # https://github.com/solokeys/solo1-cli/pull/169
  patch -Np1 -i "${srcdir}/${pkgname}-169.patch"
  # migrate pyproject.toml to standard setuptools build backend
  patch -Np1 -i "${srcdir}/pyproject-setuptools.patch"
  # patch compatibility for python-fido2 >= 2.0
  patch -Np1 -i "${srcdir}/fido2-2.x-compat.patch"
}
build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHONWARNINGS="ignore:pkg_resources is deprecated:UserWarning,ignore:The 'wheel' package is no longer:FutureWarning" \
    python -m build --wheel --no-isolation
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local test_dir="${srcdir}/test_env"
  rm -rf "${test_dir}"
  python -c "
import glob, sys
from installer import install
from installer.sources import WheelFile
from installer.destinations import SchemeDictionaryDestination

wheel = glob.glob('dist/*.whl')[0]
dest = SchemeDictionaryDestination(
    {'purelib': '${test_dir}/lib', 'platlib': '${test_dir}/lib', 'headers': '${test_dir}/h', 'scripts': '${test_dir}/bin', 'data': '${test_dir}/data'},
    interpreter=sys.executable,
    script_kind='posix'
)
with WheelFile.open(wheel) as source:
    install(source, dest, {})
"
  PYTHONPATH="${test_dir}/lib" python "${srcdir}/run_tests.py"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE-MIT \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm 644 LICENSE-APACHE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
