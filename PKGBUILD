# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=pyinstaller
_pyname=PyInstaller
pkgver=2.1
pkgrel=1
pkgdesc="An application to convert python scripts into stand-alone binaries"
arch=('i686' 'x86_64')
url="http://www.pyinstaller.org"
license=('GPL2')
depends=('python2')
source=(
    "https://pypi.python.org/packages/source/P/PyInstaller/${_pyname}-${pkgver}.tar.gz"
)
md5sums=(
    '248531f6fc94b0ffb02473321496d6d0'
)
options=('!strip' '!emptydirs')

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"

    msg "Removing unneeded stuff ..."

    rm -rf "bootloader" "old" "tests" "PKG-INFO" "setup.py"

    msg "Fixing python interpreter ..."

    grep -RIl '^#!.*python' . | xargs sed -i '/^#!/ s,.*,#! /usr/bin/env python2,'

    msg "Copying files ..."

    install -d -m 755 "${pkgdir}/usr/bin"
    install -d -m 755 "${pkgdir}/usr/share/doc/pyinstaller"
    install -d -m 755 "${pkgdir}/usr/share/pyinstaller"

    mv "doc/Manual.pdf" "${pkgdir}/usr/share/doc/pyinstaller" && rm -rf "doc"
    cp -ra . "${pkgdir}/usr/share/pyinstaller"

    msg "Creating symlinks ..."

    ln -s "/usr/share/pyinstaller/pyinstaller.py" "${pkgdir}/usr/bin/pyinstaller"
}
