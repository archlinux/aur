# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname='python-keras-git'
_pkgbase="${pkgname%-git}"       # pkgname without -git suffix
_distname="${_pkgbase#python-}"  # distribution name without python- prefix and -git suffix
pkgver=2.9.0rc0.r372.g83852348f
pkgrel=1
pkgdesc='A Python deep learning API, running on TensorFlow (git version)'
arch=('any')
url='https://keras.io/'
license=('Apache')
depends=(
  'absl-py'
  'python'
  'python-h5py'
  'python-keras-preprocessing'
  'python-numpy'
  'python-pandas'
  'python-pillow'
  'python-pydot'
  'python-scipy'
  'python-six'
  'python-yaml'
  'tensorboard'
)
provides=("${_pkgbase}=${pkgver}")
conflicts=("${_pkgbase}")
makedepends=(
  'bazel'
  'git'
  'python-pip'
  'python-tensorflow-git'   # needs to build agains '-git' or 'nightly version
  'tensorflow-git'          # needs to build agains '-git' or 'nightly version
)
source=("${_distname}::git+https://github.com/${_distname}-team/${_distname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_distname}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 2.11.0b4.r1444.g3fa377387e0
    echo "${_gitversion}" | sed \
        -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
        -e 's|\([0-9]\+-g\)|r\1|' \
        -e 's|-|.|g'
}

build() {
  cd "${_distname}"

  bazel build //keras/tools/pip_package:build_pip_package

  bazel-bin/keras/tools/pip_package/build_pip_package .
}

package () {
  depends+=(
    'python-tensorflow'   # needs '-git' or 'nightly version, but don't want to constrain runtime dep
    'tensorflow'          # needs '-git' or 'nightly version, but don't want to constrain runtime dep
  )

  cd "${_distname}"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
