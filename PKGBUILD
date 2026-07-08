# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=2.5.0
pkgrel=1.314
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('any')
license=('Unlicense')
makedepends=(make gcc python-uv-build python-build python-installer)
depends=(gtk4 python python-gobject python-msgspec python-pyxdg python-pyicu python-wcmatch)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1f2a833aa27947dd58c1c833b9c60dd68ac4b4ec2f8bd58523753b50ee03c5d')

_fullsrcdir() {
    echo "$srcdir/$pkgname-$pkgver"
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
    make build-c
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m755 dist/searchtool-gtk-activate "$pkgdir/usr/bin/searchtool-gtk-activate"
    install -D -m755 dist/searchtool-gtk-dmenu "$pkgdir/usr/bin/searchtool-gtk-dmenu"
    install -D -m644 searchtool.toml "$pkgdir/etc/xdg/searchtool.toml"

    doc_path="/$(realpath --relative-to "$pkgdir" "$pkgdir"/usr/lib/python*/site-packages/searchtool_gtk-*.dist-info/licenses/LICENSES)"
    mkdir --parents "$pkgdir/usr/share/licenses"
    ln --symbolic $doc_path "$pkgdir/usr/share/licenses/$pkgname"
}
