# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=backblaze-b2
_pkgname=b2
pkgver=4.0.3
pkgrel=1
pkgdesc='Backblaze B2 Command Line Client'
url='https://github.com/Backblaze/B2_Command_Line_Tool'
depends=('python'
         'python-argcomplete>=2'
         'python-arrow>=1.0.2'
         'python-b2sdk>=2.4.1'
         'python-docutils>=0.19'
         'python-class-registry>=4.0.5'
         'python-rst2ansi=0.1.5'
         'python-tabulate>=0.8.10'
         'python-tqdm>=4.65.0'
         'python-platformdirs>=3.11.0'
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
sha256sums=('f4e3f1c82c9762f889bb2dd6690d4f3d1d5696888fe772bc986d475caf6186d2')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

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
