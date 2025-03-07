# Maintainer:  dreieck
# Contributor: Gasparotto Mattia <gasmat04@gmail.com>

# For the python3 variant, see https://github.com/gammu/wammu/issues/78#issuecomment-1416235204 and subsequent comments.

_pkgname=wammu
_pythonver="3"
pkgname="${_pkgname}-git"
pkgver=0.44.r7151.20230207.77ae167f
pkgrel=2
pkgdesc="A wxPython-based GUI for Gammu, a mobile phone manager."
arch=('any')
url="https://wammu.eu/wammu/"
license=('GPL-3.0-or-later')
depends=(
  'python>=3'
  'python-gammu>=3'
  'python-six'
  'python-wxpython'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-pybluez>=0.23'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'gnome-bluetooth: Bluetooth support'
  'python-pybluez>=0.23: Bluetooth support'
)
# 2025-03-07: Tests are broken, see https://github.com/gammu/wammu/issues/78#issuecomment-2707004774.
#checkdepends=(
#  'python-pytest'
#)
provides=(
  "${_pkgname}=${pkgver}"
  "python-${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-${_pkgname}"
)
source=(
  # "${_pkgname}::git+https://github.com/gammu/wammu.git"
  "${_pkgname}::git+https://github.com/kamikaze-kun/wammu#branch=python3"
  "fixes_by_ppisa.patch"  # See https://github.com/gammu/wammu/issues/78#issuecomment-1890903774
)
sha256sums=(
  'SKIP'
  'c8ba0f01ad0b84019314f501babe20fe69ce0d6efc28d73358b5492a713a5f17'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  local _patch
  for _patch in "${srcdir}/fixes_by_ppisa.patch"; do
    printf '%s\n' "  > Applying patch $(basename "${_patch}" ...)"
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  #_ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _ver="$(grep -E '^[[:space:]]*__version__[[:space:]]*=' Wammu/__init__.py | awk -F= '{print $2}' | tr -d \'\"[[:space:]])"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation
}

# 2025-03-07: Tests are broken, see https://github.com/gammu/wammu/issues/78#issuecomment-2707004774.
#check() {
#  cd "${srcdir}/${_pkgname}"
#
#  pytest
#}

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log ChangeLog INSTALL README.rst
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
