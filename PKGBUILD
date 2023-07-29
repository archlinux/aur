# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgbase=bms-tools
pkgname=('python-bmstools' 'bmstools-gui')
pkgver=1.2.0
pkgrel=2
pkgdesc='Open source tools for popular Battery Management Systems (BMS)'
url='https://gitlab.com/bms-tools/bms-tools'
depends=('python'
         'python-pyserial'
        )
makedepends=('python-pip'
             'python-build'
             'python-installer'
             'python-wheel'
            )

license=('MIT')
arch=('any')

source=("https://gitlab.com/${pkgbase}/${pkgbase}/-/archive/v${pkgver}/${pkgbase}-v${pkgver}.tar.gz"
        '0001-gui-Move-gui-to-bmstools-folder.patch'
        '0002-setup-Include-ico-and-svg-images.patch'
       )

sha256sums=('6ff85dfb071d641a9ebeaefe118026836447e668626d83f61fe95e8764ea81e9'
            '00eb720b17ec4dcaa8d94ad2839df9c71131c13ba2d6069fe08f83444af7f03a'
            '59e7df09589af40b572344ec3920e7738696cbb8559ae8484150e5fe2edee316')

prepare() {
    cd ${srcdir}/${pkgbase}-v${pkgver}

    for i in ${srcdir}/*.patch; do
        msg "Applying patch $(basename $i)"
        patch -Np1 -i "$i"
    done
}

build() {
    cd ${srcdir}/${pkgbase}-v${pkgver}

    python -m build --wheel --no-isolation
}

package_python-bmstools() {
    cd ${srcdir}/${pkgbase}-v${pkgver}

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf "${pkgdir}${site_packages}/test"

    rm -rf ${pkgdir}/usr/bin/
    rm -rf ${pkgdir}${site_packages}/bmstools/gui/
}

package_bmstools-gui() {
    depends=(
        'python-bmstools'
        'python-wxpython'
        'python-xlsxwriter'
    )

    cd ${srcdir}/${pkgbase}-v${pkgver}

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf "${pkgdir}${site_packages}/test"

    # Delete everything except gui and top level
    find ${pkgdir}${site_packages} -mindepth 1 -maxdepth 2 \! -path \*/bmstools \! -path \*/bmstools\/gui | xargs rm -rf
}
