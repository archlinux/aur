# Maintainer: NelloKudo <marshnelloosu@gmail.com>

pkgname=altlinux-git
_spkgname=AltLinux
_lpkgname=altlinux
pkgver=v0.4.2.2
pkgrel=1
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
source=('git+https://github.com/i-love-altlinux/AltLinux'
        "${_lpkgname}.desktop"
        "${_lpkgname}.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    # "Hacky" way to install PyInstaller since the AUR package
    # takes hours due to its check() function and various pytests.
    # Read more at here: https://github.com/samarthj/AUR/issues/8

    # Installing PyInstaller as user from pip.
    # That's to prevent conflicts with package manager
    pip install pyinstaller
}

build() {
    cd "$srcdir"/"$_spkgname"
    PATH=$HOME/.local/bin:$PATH pyinstaller altlinux.spec --clean
}

package() {
    cd "$srcdir"/"$_spkgname"

    # Install desktop file
    install -Dm 644 -o root "${srcdir}"/"${_lpkgname}".desktop -t "${pkgdir}/usr/share/applications"

    # Install icon file
    install -Dm 644 -o root "${srcdir}"/"${_lpkgname}".png -t "${pkgdir}/usr/share/icons"

    # Install files
    mkdir -p "${pkgdir}"/usr/lib/
    cp -R resources dist/altlinux
    cp -R dist/altlinux "${pkgdir}"/usr/lib/

    # Setting permissions
    chown -R $USER "${pkgdir}"/usr/lib/altlinux
}
