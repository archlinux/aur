# Maintainer: Nello De Gregoris <marshnelloosu@gmail.com>

pkgname=altlinux-git
_spkgname=AltLinux
_lpkgname=altlinux
pkgver=v0.4.2.1.r5.g1508e66
pkgrel=2
pkgdesc="GUI for AltServer-Linux"
arch=('x86_64')
url="https://github.com/i-love-altlinux/AltLinux"
license=('GPL')
provides=("altlinux")
conflicts=("altlinux")
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
source=('git+https://github.com/i-love-altlinux/AltLinux'
        "${_lpkgname}.desktop"
        "${_lpkgname}.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir"/"$_spkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"/"$_spkgname"
    
    pyinstaller altlinux.spec --clean
}

package() {
    cd "$srcdir"/"$_spkgname"

    # Install desktop file
    install -Dm 644 -o root "${srcdir}"/"${_lpkgname}".desktop -t "${pkgdir}/usr/share/applications"

    # Install icon file
    install -Dm 644 -o root "${srcdir}"/"${_lpkgname}".png -t "${pkgdir}/usr/share/icons"

    # Install files
    mkdir -p "${pkgdir}"/usr/lib/altlinux

    cp -R resources dist/altlinux
    cp -R dist/altlinux "${pkgdir}"/usr/lib/
    chmod -R 0775 "${pkgdir}"/usr/lib/altlinux
}
