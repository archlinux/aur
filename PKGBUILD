# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Goncalo Pereira <goncalo_pereira@outlook.pt>

pkgname=python-kintree
_name=${pkgname#python-}
pkgver=1.2.1
pkgrel=5
pkgdesc="Fast part creation in KiCad and InvenTree"
url="https://github.com/sparkmicro/Ki-nTree"
depends=(
    'python'
    'python-digikey-api'
    'python-flet'
    'python-thefuzz'
    'python-inventree'
    'python-kiutils'
    'python-mouser'
    'python-requests'
    'python-yaml'
    'python-validators'
    'python-wrapt-timeout-decorator'
    # AUR
    'python-cloudscraper'
)
makedepends=(
    git
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
license=('GPL-3.0-or-later')
arch=('any')
source=(
    "${_name}::git+${url}.git#tag=${pkgver}"
    "kintree.png"
    "kintree.desktop"
)
sha256sums=('3245cf6d8d24c99d7def382f92680e8416668ee411ec723f368eb25fa796b167'
            '46c5a724fab746f094e2ae73d5aa1f7d8b91446d6c841ec3a4f134f64c6277d8'
            '7e95214b781f866ebbbf64510eb956337907f824b0a18691ca0b37766ef817d4')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "$srcdir/$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
    chmod 777 -R $pkgdir

    # Desktop file
    install -Dm644 "$srcdir/kintree.desktop" \
        "${pkgdir}/usr/share/applications/kintree.desktop"

    # Icon file
    install -Dm644 "$srcdir/kintree.png" \
        "${pkgdir}/usr/share/pixmaps/kintree.png"
}
