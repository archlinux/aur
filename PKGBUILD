# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=backblaze-b2
_pkgname=B2_Command_Line_Tool
pkgver=1.4.0
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
url="https://www.backblaze.com/b2/cloud-storage.html"
depends=('python'
         'python-tqdm>=4.5.0'
         'python-six>=1.10'
         'python-b2sdk>=0.1.6'
        )
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

source=("https://github.com/Backblaze/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ecce18398563724296628531c015d975bceeb47777a8fa73c3ad8402bb81943bc7625d8771c3e5e84c3f9c229ed219395ec5b9ccedb399ca9caa3eabca3e6fee')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    sed -i -e 's:^\(arrow.*\),<0.12.1:\1:' requirements.txt
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/

    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    mv ${pkgdir}/usr/bin/b2 ${pkgdir}/usr/bin/backblaze-b2
}

