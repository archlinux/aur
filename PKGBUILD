# Maintainer: Konstantin Gizdov <arch@kge.pw>

pkgname=(tensorflow_metadata)
_name=metadata
pkgver='0.15.1'
pkgrel=1
url="https://github.com/tensorflow/metadata"
pkgdesc="Utilities for passing TensorFlow-related metadata between tools"
depends=('python-tensorflow')
makedepends=('bazel' 'python-setuptools')
license=('Apache')
arch=('any')
source=("${_name}-${pkgver}::https://github.com/tensorflow/metadata/archive/v${pkgver}.tar.gz")
sha256sums=('0b321e2185891b066d2ab76d85f46e360fe3668ce97112c051116624fed87354')

get_pyver () {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

check_dir() {
  if [ -d "${1}" ]; then
    return 0
  else
    >&2 echo Directory "${1}" does not exist or is a file! Exiting...
    exit 1
  fi
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    bazel build //tensorflow_metadata:build_pip_package
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    local _src_dir="bazel-bin/${pkgname}/proto/v0"/
    local _dst_dir="${pkgdir}/usr/lib/python$(get_pyver)/site-packages/${pkgname}/proto/v0"
    install -d "${_dst_dir}"
    check_dir "${_src_dir}"
    find "${_src_dir}" -maxdepth 1 -mindepth 1 -iname "*.py" -type f -print0 | while read -rd $'\0' _script; do
      cp -nr "${_script}" "${_dst_dir}"/
    done
}
