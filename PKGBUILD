# Maintainer: Renato Caldas <renato@calgera.com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
pkgname=('python-fenics-ufl-git')
pkgdesc='UFL - Unified Form Language'
pkgver=2023.2.0.dev0_r3539.9e120c6
pkgrel=1
arch=('any')
url='https://fenicsproject.org'
license=('MIT')
groups=('dolfinx-git')
depends=('python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
optdepends=('python-colorama: for ufl2unicode color formating'
            'python-scipy: for evaluating bessel functions')
conflicts=('python-fenics-ufl')
source=('git+https://github.com/FEniCS/ufl')
sha512sums=('SKIP')

pkgver()  {
    cd "$srcdir/ufl"
    # The main branch unfortunately has no meaningful tags
    printf "%s_r%s.%s" "$(sed -n -e 's/^version *= *\(.*\)/\1/p' setup.cfg)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    git -C "${srcdir}/ufl" clean -dfx
}

build() {
    cd "$srcdir/ufl"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/ufl"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest
}

package() {
    cd "$srcdir/ufl"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}
