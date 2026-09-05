# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=3.2.0
pkgrel=1.314
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('x86_64')
license=('Unlicense')
makedepends=(meson gcc python-uv-build python-build python-installer)
depends=(gtk4 python python-gobject python-msgspec python-pyxdg python-pyicu python-wcmatch)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('28af656471e825d45a14ae37ade6f891d26b5c9cde90d62f4872b64abc6ef913')

_fullsrcdir() {
    echo "$srcdir/$pkgname-$pkgver"
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
    arch-meson builddir
    meson compile -C builddir
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 default_config.toml "$pkgdir/etc/xdg/searchtool/config.toml"
    meson install -C builddir --destdir "$pkgdir"

    mkdir --parents "$pkgdir/usr/share/licenses"
    ln --symbolic \
        "/$(realpath --relative-to "$pkgdir" "$pkgdir"/usr/lib/python*/site-packages/searchtool_gtk-*.dist-info/licenses/LICENSES)" \
        "$pkgdir/usr/share/licenses/$pkgname"
}
