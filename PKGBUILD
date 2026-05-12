# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=viat
pkgver=0.9.6
pkgrel=2.314
pkgdesc='A tool for managing virtual file attributes'
url='https://github.com/v--/viat'
arch=('any')
license=('Unlicense')
checkdepends=(python-pytest python-pygit2)
makedepends=(git python-uv-build python-build python-installer python-wheel python-click-man groff)
depends=(python python-click python-fastjsonschema python-tomlkit python-wcmatch)
optdepends=(
  'python-pygit2: Git file tracker'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed8b0924b4b51fe78901b0f1cd3a9c157eae10e26ef596de6be10747109d3ca5')

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
