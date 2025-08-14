# Maintainer: Patrik Bachan <patrikbachan at gmail dot com>
pkgname=python-lbuild-git
_name=lbuild
pkgver=r294.f594b41
pkgrel=1
pkgdesc="a generic, modular code generator in Python 3"
url="https://github.com/modm-io/${_name}/"
arch=('any')
license=('BSD-2-Clause')
depends=(python python-lxml python-jinja 'python-anytree>=2.6.0' 'python-gitpython>=2.1.11')
makedepends=(git python-build python-installer python-wheel python-testfixtures)

source=("${_name}::git+https://github.com/modm-io/lbuild.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check(){
    cd $_name
    
    # Builtin unittest
    python -W ignore::DeprecationWarning -m unittest discover -p *test.py

    pytest
}
