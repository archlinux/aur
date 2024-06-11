# Maintainer:  Berrit Birkner <aur at bbirkner.de>
# Contributor:  Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger-git
pkgver=1.10.1.r1165.a38e057
pkgrel=1
pkgdesc="Helps merge or split pdf documents and rotate, crop and rearrange pages."
arch=('any')
url="https://github.com/pdfarranger/pdfarranger"
license=('GPL3')
depends=('gtk3'
    'python-gobject'
    'python-cairo'
    'python-pikepdf'
    'python-dateutil'
    'ghostscript'
    'poppler-glib'
    'python-importlib-metadata'
)
makedepends=('git'
    'python-installer'
    'python-setuptools'
    'python-build'
    'python-wheel'
)
optdepends=(
    'img2pdf: support for image files'
    'libhandy: alternate graphics backend'
)
conflicts=('pdfshuffler' 'pdfshuffler-git' 'pdfarranger')
provides=('pdfarranger')
source=($pkgname::"git+https://github.com/pdfarranger/pdfarranger.git")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/$pkgname"
    _SETUPPY_VERSION="$(python setup.py --version)"
    [[ "$_SETUPPY_VERSION" = "1.10.0" ]] && _VERSION=1.10.1 || _VERSION="$_SETUPPY_VERSION"
    printf "%s.r%s.%s" "$_VERSION" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/$pkgname"
    sed -i "s/1.10.0/1.10.1/" pdfarranger/pdfarranger.py setup.py
    python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
