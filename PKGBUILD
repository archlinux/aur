# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=backblaze-b2
_pkgname=b2
pkgver=3.7.1
pkgrel=1
pkgdesc='Backblaze B2 Command Line Client'
url='https://github.com/Backblaze/B2_Command_Line_Tool'
depends=('python'
         'python-arrow>=1.0.2'
         'python-b2sdk>=1.18.0'
         'python-docutils>=0.19'
         'python-class-registry>=4.0.5'
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
sha256sums=('68b10511447576c3286159f5fe66ee180dddb4547dcb4a423fa964454720019f')

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

    # uu-coreutils messes up the directory permissions (644, expect 755)
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install LICENSE "$pkgdir/usr/share/licenses/$pkgname"

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf "${pkgdir}${site_packages}/test"

    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    mv ${pkgdir}/usr/bin/b2 ${pkgdir}/usr/bin/backblaze-b2
}
