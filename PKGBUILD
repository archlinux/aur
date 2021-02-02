# Maintainer: Kristóf Marussy <kristof@marussy.com>
# Contributor: Byeonghoon Yoo <bh322yoo@gmail.com>

_pkgname=cleo
pkgname=python-cleo-git
pkgver=1.0.0a1.r1.ga772384
pkgrel=1
pkgdesc="CliKit is a group of utilities to build beautiful and testable command line interfaces."
arch=('any')
provides=("python-cleo")
conflicts=('python-cleo')
url="https://github.com/sdispater/${_pkgname}"
license=('MIT')
depends=('python-pylev>=1.3' 'python-pylev<2.0' 'python-crashtest>=0.3.0' 'python-crashtest<0.4.0' 'python>=3.6' 'python<4.0')
makedepends=('git' 'python-dephell')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${_pkgname}

    # poetry-generated setup.py are fatally broken, see:
    # https://github.com/sdispater/poetry/issues/866
    dephell deps convert --from pyproject.toml --to setup.py
}

build(){
  cd "${srcdir}"/${_pkgname}
  python setup.py build
}

package() {
  cd "${srcdir}"/${_pkgname}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

