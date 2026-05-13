# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=viat
pkgver=0.10.1
pkgrel=1.314
pkgdesc='A tool for managing virtual file attributes'
url='https://github.com/v--/viat'
arch=('any')
license=('Unlicense')
checkdepends=(python-pytest python-pygit2)
makedepends=(git python-uv-build python-build python-installer python-wheel python-click-man groff)
depends=(python python-click python-fastjsonschema python-tomli-w python-wcmatch)
optdepends=(
  'python-pygit2: Git file tracker'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d93fc6aa572b56a151bf3db6c482db355137339d40b05f1e74ba1fb3c29b81e2')

_fullsrcdir() {
    echo "$srcdir/$pkgname-$pkgver"
}

check() {
    cd "$(_fullsrcdir)"
    pytest
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
    PYTHONPATH=src python -c 'from src.helpers.docs import build_man_page; build_man_page()'
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 dist/man/viat.1 "$pkgdir/usr/share/man/man1/viat.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
