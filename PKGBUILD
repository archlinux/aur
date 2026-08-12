# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep-git
_pkgbasename="${pkgname%-git}"
pkgver=2.8.3.r279.fe079a2
pkgrel=1
pkgdesc='A DjVu to PDF converter'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL-3.0-or-later AND CC0-1.0')
provides=("$_pkgbasename")
conflicts=("$_pkgbasename")
checkdepends=(python-pytest)
makedepends=(git python-uv-build python-build python-installer python-click-man)
depends=(python python-djvulibre-python
         python-click python-rich python-pillow
         python-fpdf2 python-pdfrw)
optdepends=(
  'ocrmypdf: Optional OCR and advanced PDF optimization'
  'jbig2enc: Advanced compression of bitonal images'
)
source=("git+https://github.com/kcroker/dpsprep.git")
sha256sums=('SKIP')
install=dpsprep-git.install

# Based on https://aur.archlinux.org/packages/dpsprep-git#comment-1031722
pkgver() {
    cd "$(_fullsrcdir)"

    _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
    _rev="$(git rev-list --count HEAD)"
    _hash="$(git rev-parse --short HEAD)"

    if [ -z "${_ver}" ]; then
        echo -n 'Version could not be determined.' >/dev/stderr
        return 1
    else
        echo -n "${_ver}.r${_rev}.${_hash}"
    fi
}

_fullsrcdir() {
    echo "$srcdir/$_pkgbasename"
}

check() {
    cd "$(_fullsrcdir)"
    pytest
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl

    mkdir --parents "$pkgdir/usr/share/licenses"
    ln --symbolic \
        "/$(realpath --relative-to "$pkgdir" "$pkgdir"/usr/lib/python*/site-packages/dpsprep-*.dist-info/licenses/LICENSES)" \
        "$pkgdir/usr/share/licenses/$pkgname"
}
