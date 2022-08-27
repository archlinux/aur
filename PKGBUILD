# Maintainer: Nello De Gregoris <marshnelloosu@gmail.com>

pkgname=altlinux
pkgver=0.4.2
pkgrel=1
pkgdesc="GUI for AltServer-Linux"
arch=('x86_64')
url="https://github.com/maxasix/AltLinux"
license=('GPL')
depends=('binutils'
         'wget'
         'curl'
         'git'
         'python-pip'
         'libappindicator-gtk3'
         'usbmuxd'
         'libimobiledevice'
         'avahi'
         'zlib'
         'unzip')
makedepends=('pyinstaller')
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz"::"https://github.com/maxasix/${pkgname}/archive/refs/tags/v${pkgver}-${pkgrel}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('b601f85475f065ef5a434d2d8ca0f8a09b80246b999741e9c4c730a9a885c056'
            'SKIP'
            'SKIP')

build() {
    cd "$srcdir"/"${pkgname}"-"${pkgver}"
    
    pyinstaller altlinux.spec --clean
}

package() {
    cd "$srcdir"/"${pkgname}"-"${pkgver}"

    # Install desktop file
    install -Dm 644 -o root "${srcdir}"/"${pkgname}".desktop -t "${pkgdir}/usr/share/applications"

    # Install icon file
    install -Dm 644 -o root "${srcdir}"/"${pkgname}".png -t "${pkgdir}/usr/share/icons"

    # Install files
    mkdir -p "${pkgdir}"/usr/lib/altlinux

    cp -R resources dist/altlinux
    cp -R dist/altlinux "${pkgdir}"/usr/lib/
    chmod -R 0775 "${pkgdir}"/usr/lib/altlinux

    mkdir -p "${pkgdir}"/usr/bin
    ln -s "${pkgdir}"/usr/lib/altlinux/altlinux "${pkgdir}"/usr/bin/altlinux
}
