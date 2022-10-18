# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=backblaze-b2
_pkgname=b2
pkgver=3.5.0
pkgrel=2
pkgdesc='Backblaze B2 Command Line Client'
url='https://github.com/Backblaze/B2_Command_Line_Tool'
depends=('python'
         'python-arrow>=0.8.0'
         'python-b2sdk<=1.18.0'
         'python-b2sdk>=1.17.3'
         'python-docutils>=0.19'
         'python-class-registry=3.0.5'
         'python-rst2ansi=0.1.5'
         'python-tabulate>=0.8.10'
        )
makedepends=('python-pip'
             'python-setuptools'
             'python-setuptools-scm'
            )

# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

source=("https://github.com/Backblaze/B2_Command_Line_Tool/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bf2a84c6e96c574c038a32e8b4f3b74403a4f68e277b456aef82892a1481aefa')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    # This requriement seems overly strict, relax
    sed -i -e 's:\(arrow>=.*\),.*:\1:' requirements.txt
    sed -i -e 's:\(docutils==.*\):docutils>=0.16:' requirements.txt
    sed -i -e 's:\(tabulate==.*\):tabulate<0.10:' requirements.txt

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
