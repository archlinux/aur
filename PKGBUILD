# Maintainer: Thiago França<tfsthiagobr98@outlook.com>

_pkgname=poetry-core
pkgname=('python-poetry-core-git')
pkgver=1.0.0a9.r29.gb647193
pkgrel=1
pkgdesc="Python dependency management and packaging made easy (core package)"
arch=('any')
url="https://python-poetry.org/"
license=('MIT')
_deps=('cachecontrol' 'cachy' 'cleo' 'html5lib' 'jsonschema' 'lockfile'
       'pkginfo' 'pyparsing' 'pyrsistent' 'requests' 'requests-toolbelt'
       'shellingham' 'tomlkit' 'keyring' 'pexpect')
depends=("${_deps[@]/#/python-}")
makedepends=('python-dephell')
checkdepends=('git' 'python-pytest' 'python-pytest-mock' 'python-httpretty')
source=("${_pkgname}"::"git+https://github.com/python-poetry/${_pkgname}.git")
sha256sums=('SKIP')
            
pkgver() {
    cd "${srcdir}/${_pkgname}"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    # compile core
    cd "${srcdir}"/${_pkgname}

    dephell deps convert --level DEBUG --from pyproject.toml --to setup.py
}

build() {
    cd "${srcdir}"/${_pkgname}
    python setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}

    pytest
}

package() {
    cd "${srcdir}"/${_pkgname}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
