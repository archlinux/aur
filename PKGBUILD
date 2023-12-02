# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Richard Neumann aka. rne <r dot neumann at homeinfo fullstop de>

_pkgbase=python-magic
pkgname="${_pkgbase}-git"
pkgver=0.4.27.r22.g54d86fd
pkgrel=1
_stablepkg_epoch=1
pkgdesc="File type identification library; unofficial wrapper for file/libmagic (git)"
arch=('any')
url='https://pypi.org/project/python-magic'
_repourl='https://github.com/ahupp/python-magic'
license=('MIT')
depends=(
  'file'
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
provides=("${_pkgbase}=${_stablepkg_epoch}:${pkgver%.r*}")
conflicts=(
  "${_pkgbase}"
  'python-file-magic' # official libmagic bindings - https://pypi.org/project/file-magic
)
source=("${_pkgbase}::git+${_repourl}.git")
b2sums=('SKIP')

pkgver() {
    cd "${_pkgbase}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
    echo "${_gitversion}" | sed \
        -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
        -e 's|\([0-9]\+-g\)|r\1|' \
        -e 's|-|.|g'
}

build() {
  cd "${_pkgbase}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgbase}"
  LC_ALL=en_US.UTF-8 pytest -vv "${pytest_options[@]}"
}

package() {
  cd "${_pkgbase}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
