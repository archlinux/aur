# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=backblaze-b2
_pkgname=B2_Command_Line_Tool
pkgver=2.1.0
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
url='https://github.com/Backblaze/B2_Command_Line_Tool'
depends=('python'
         'python-b2sdk>=1.0.0'
         'python-tqdm>=4.5.0'
         'python-class-registry=3.0.5'
        )
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

source=("https://github.com/Backblaze/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8dcf2f6bb244e67c0bd3c91b5984d62f37d553bb018a87c81baca49cb2ca0d7f743c64695189829216206976b1e7cb5deb9776c94c8bda2d3d9f8deccb33685a')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf "${pkgdir}${site_packages}/test"

    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    mv ${pkgdir}/usr/bin/b2 ${pkgdir}/usr/bin/backblaze-b2
}
