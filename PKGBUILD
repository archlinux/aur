# Maintainer: Filip Andersson <filip@artifact.se>


_pkgname=pytm
pkgname='python-pytm-git'
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc="A Pythonic framework for threat modeling."
arch=('any')
url=https://github.com/OWASP/"${_pkgname}"
license=('MIT')
depends=(
    'python>=3.10'
    'python-graphviz'
    'jre11-openjdk'
    'plantuml'
    'python-pydal-git'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-poetry'
    'python-pbs-installer'
    'python-httpx'
    'git'
)
optdepends=(
)
source=("${_pkgname}::git+https://github.com/OWASP/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
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
    
    # Install license if it exists
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    elif [ -f COPYING ]; then
        install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    fi
    
    # Install documentation
    if [ -f README.md ]; then
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
}

check() {
    cd "${srcdir}/${_pkgname}"
}
