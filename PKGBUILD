# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=backblaze-b2
_pkgname=b2
pkgver=2.5.0
pkgrel=1
pkgdesc='Backblaze B2 Command Line Client'
url='https://github.com/Backblaze/B2_Command_Line_Tool'
depends=('python'
         'python-arrow>=0.8.0'
         'python-b2sdk>=1.0.0'
         'python-b2sdk<2.0.0'
         'python-docutils>=0.16'
         'python-class-registry=3.0.5'
         'python-rst2ansi=0.1.5'
        )
makedepends=('python-setuptools'
             'python-setuptools-scm'
            )

# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('85b4917fa74178883fb3eca442dc81fdd2387b00d514302d6e7e1c695d9a096a')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    # This requriement seems overly strict, relax
    sed -i -e 's:\(arrow>=.*\),.*:\1:' requirements.txt
    sed -i -e 's:\(docutils==.*\):docutils>=0.16:' requirements.txt

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
