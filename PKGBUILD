# Maintainer: Renato Caldas <renato@calgera.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=('python-fenics-ffcx-git')
pkgdesc='Next generation FEniCS Form Compiler for finite element forms'
pkgver=0.9.0.dev0_r7154.8de75ef
pkgrel=1
arch=('any')
url='https://fenicsproject.org'
license=('MIT')
depends=('python-fenics-ufl-git' 'python-fenics-basix-git' 'python-cffi')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-pygraphviz: for the visualise_graph(...) utility function')
conflicts=('python-fenics-ffcx')
source=('git+https://github.com/FEniCS/ffcx')
sha512sums=('SKIP')

pkgver()  {
    cd "$srcdir/ffcx"
    # The main branch unfortunately has no meaningful tags
    printf "%s_r%s.%s" "$(sed -n -e 's/^version *= \"*\(.*\)\"/\1/p' pyproject.toml)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    git -C "${srcdir}/ffcx" clean -dfx
}

build() {
    cd "$srcdir/ffcx"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/ffcx"
    python -m installer --destdir="$pkgdir" dist/*.whl
    find "$pkgdir" -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}
