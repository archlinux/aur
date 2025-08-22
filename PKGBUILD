# Maintainer: Filip Andersson <filip@artifact.se>


_pkgname=mal-simulator
pkgname='python-mal-simulator-git'
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc="A MAL compliant simulator."
arch=('any')
url=https://github.com/mal-lang/"${_pkgname}"
license=('Apache-2.0')
depends=(
    'python>=3.10'
    'python-mal-toolbox'
    'python-yaml'
)
provides=("python-mal-simulator")
conflicts=("python-mal-simulator")
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
optdepends=(
  'python-numpy: For machine learning integration' 'python-pettingzoo: For machine learning integration' 'python-gymnasium: For machine learning integration'
  'python-pytest: Dev tools' 'mypy: Dev tools' 'ruff: Dev tools'
)
source=("${_pkgname}::git+https://github.com/mal-lang/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    # Try to describe with tags: v1.0.0 -> 1.0.0.r5.gabcdef
    git describe --tags --long 2>/dev/null \
        | sed 's/^v//;s/-/./g' \
        || printf "0.0.0.r%s.g%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
}

build() {
    cd "${srcdir}/${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # License
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    elif [ -f COPYING ]; then
        install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    fi
    
    # Documentation
    if [ -f README.md ]; then
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
}

check() {
    cd "${srcdir}/${_pkgname}"
}
