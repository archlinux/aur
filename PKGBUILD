# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=backblaze-b2
_pkgname=b2
pkgver=3.8.0
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
             'python-build'
             'python-installer'
             'python-setuptools-scm'
             'python-wheel'
            )

# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

source=("https://github.com/Backblaze/B2_Command_Line_Tool/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c590f89438307b80d136f15889b34b03b09eaa65be0e1b1846492286ed57de45')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    # This requriement seems overly strict, relax
    sed -i -e 's:\(arrow>=.*\),.*:\1:' requirements.txt
    sed -i -e 's:\(docutils==.*\):docutils>=0.16:' requirements.txt
    sed -i -e 's:\(tabulate==.*\):tabulate<0.10:' requirements.txt
    sed -i -e "s:'\(setuptools_scm\)<.*':'\1':" setup.py

    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl

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
