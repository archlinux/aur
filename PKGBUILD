# Contributor: Daniel Maslowski <info@orangecms.org>

_gitname=gym
pkgname=python-${_gitname}-git
pkgver=0.26.2.r3.gdcd18584
pkgrel=2
pkgdesc="A toolkit for developing and comparing reinforcement learning algorithms."
arch=('any')
url='https://github.com/openai/gym#readme'
license=('MIT')
depends=(
  'python'
  'python-cloudpickle'
  'python-numpy'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("python-gym=${pkgver%.r*}")
conflicts=('python-gym')
source=("git+https://github.com/openai/$_gitname")
b2sums=('SKIP')

pkgver() {
    cd "${_gitname}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
    # Or in case of 'post': 1.5.0.post1.r521.g99982a1c
    echo "${_gitversion}" | sed \
        -e 's;^\([0-9][0-9.]*\)[-_.]\([a-zA-Z]\+\);\1\2;' \
        -e 's;\([0-9]\+-g\);r\1;' \
        -e 's;-;.;g' \
        -e 's;\(post.*\);\.\1;'
}

build() {
    cd "${_gitname}"
    python -m build --wheel --no-isolation
}

package() {
  cd "${_gitname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
