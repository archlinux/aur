# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=backblaze-b2
_pkgname=b2
pkgver=4.4.2
pkgrel=1
pkgdesc='Backblaze B2 Command Line Client'
url='https://github.com/Backblaze/B2_Command_Line_Tool'
depends=('python'
         'python-argcomplete<4'
         'python-arrow'
         'python-b2sdk'
         'python-docutils'
         'python-class-registry'
         'python-rst2ansi'
         'python-tabulate'
         'python-tqdm'
         'python-platformdirs'
         'python-pydantic'
        )
makedepends=('python-build'
             'python-installer'
             'python-pdm-backend'
             'python-wheel'
            )

# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

source=("https://github.com/Backblaze/B2_Command_Line_Tool/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('61ac927da23e5c69bbc87b217b21cec442c809f890bc07e2dcc9f66a75e2d60b')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    # This requriement seems overly strict, relax
    sed -r \
        -e 's/(rst2ansi)==/\1~=/' \
        -e 's/(tabulate)==/\1~=/' \
        -i pyproject.toml

    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf "${pkgdir}${site_packages}/test"

    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    mv ${pkgdir}/usr/bin/b2 ${pkgdir}/usr/bin/backblaze-b2
}
