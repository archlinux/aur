# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep-git
_pkgbasename="${pkgname%-git}"
pkgver=2.6.4.r220.02fe6c8
pkgrel=1.314
pkgdesc='A DjVu to PDF converter with a focus on small output size and the ability to preserve document outlines and text layers'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL-3.0-only')
provides=("$_pkgbasename")
conflicts=("$_pkgbasename")
checkdepends=(python-pytest)
makedepends=(git python-uv-build python-build python-installer python-wheel python-click-man coreutils make)
depends=(python python-djvulibre-python
         python-click python-loguru python-pillow
         python-fpdf2 python-pdfrw)
optdepends=(
  'ocrmypdf: Optional OCR and advanced PDF optimization'
  'jbig2enc: Advanced compression of bitonal images'
)
source=("git+https://github.com/kcroker/dpsprep.git")
md5sums=('SKIP')

_fullsrcdir() {
    echo "$srcdir/$_pkgbasename"
}

prepare() {
    cd "$(_fullsrcdir)"
    sed --in-place Makefile \
        --expression 's/uv run //g' \
        --expression 's/uv version --short/grep --only-matching --perl-regexp "(?<=version\\s=\\s\\").*(?=\\")" pyproject.toml/g'
}

# Based on https://aur.archlinux.org/packages/dpsprep-git#comment-1031722
pkgver() {
    cd "$(_fullsrcdir)"

    _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
    _rev="$(git rev-list --count HEAD)"
    _hash="$(git rev-parse --short HEAD)"

    if [ -z "${_ver}" ]; then
        error "Version could not be determined."
        return 1
    else
        printf '%s' "${_ver}.r${_rev}.${_hash}"
    fi
}

check() {
    cd "$(_fullsrcdir)"
    make test
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
    make docs/dpsprep.1
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 docs/dpsprep.1 "$pkgdir/usr/share/man/man1/dpsprep.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbasename/LICENSE"
}
