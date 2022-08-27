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
source=("${pkgname}_${pkgver}.tar.gz"::"https://github.com/maxasix/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "local://${pkgname}.desktop"
        "local://${pkgname}.png")
sha256sums=('e1f5afad2993a4d6fbd639dcd944210d24bf1aa10a2beeb163212bcae9613557'
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
