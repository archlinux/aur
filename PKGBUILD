# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=hy-git
_gitname=hy
pkgver=0.27.0.r23.g2d6d5f9c
pkgrel=1
pkgdesc="A dialect of Lisp that's embedded in Python"
arch=('any')
url="http://hylang.org/"
license=('MIT')
depends=('python-funcparserlib')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
conflicts=('hy')
provides=('hy')
options=(!emptydirs)
source=("git+https://github.com/hylang/hy.git")
md5sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    local version=$(git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g')
    echo "__version__ = '${version}'" > hy/version.py
    printf "%s" "$version"
}

build() {
    cd "${_gitname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_gitname}"
    python -m installer --destdir="${pkgdir}/" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "$pkgdir/usr/get_version"
}
