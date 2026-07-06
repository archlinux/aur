# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Malkov Fyodor aka krox: iksut@yandex.ru
# Contributor: Ianis Vasilev: ianis@ivasilev.net

pkgname=ocrodjvu-python3-git
_pkgbasename='ocrodjvu'
pkgver=0.14+46.r1457.7954aaa
pkgrel=2.314
pkgdesc="OCR for DjVu (Python 3 fork)"
arch=('any')
url='https://github.com/FriedrichFroebel/ocrodjvu'
license=('GPL-2.0-only')
provides=(ocrodjvu)
conflicts=(ocrodjvu)
makedepends=(python-build python-installer python-wheel git coreutils make libxslt docbook-xml docbook-xsl python-setuptools)
depends=(python python-lxml python-djvulibre-python)
optdepends=('python-html5lib: HTML parser; required for the ``--html5`` option'
            'python-pyicu: required for the ``--word-segmentation=uax29`` option'
            'cuneiform: OCR system' 
            'tesseract: OCR system'
            'ocrad: OCR system'
            'gocr: OCR system')
source=(git+https://github.com/FriedrichFroebel/ocrodjvu)
sha256sums=('SKIP')
install=ocrodjvu-python3-git.install

_fullsrcdir() {
    echo "$srcdir/$_pkgbasename"
}

prepare() {
    cd "$(_fullsrcdir)"
    sed --in-place 's|http://www.docbook.org/xml|http://www.oasis-open.org/docbook/xml|' doc/*.xml
}

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

build() {
    cd "$(_fullsrcdir)"
    make -C doc
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    make PREFIX="/usr" DESTDIR="$pkgdir" install_manpage
}
