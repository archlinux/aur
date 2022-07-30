# Based on: woeusb-ng Jakub Szymański <jakubmateusz@poczta.onet.pl>
pkgname=woeusb-ng-git
pkgver=0.2.5.r64.gbcb7583
pkgrel=1
pkgdesc="Simple tool that enable you to create your own usb stick with Windows installer."
arch=('any')
url="https://github.com/WoeUSB/WoeUSB-ng"
license=('GPL3')
depends=(
    'parted'
    'dosfstools'
    'ntfs-3g'
    'grub'
    'p7zip'
    'python'
    'python-pip'
    'python-wxpython'
    'xdg-utils'
    'python-termcolor'
)
makedepends=(
    'python-setuptools'
    'git'
)
provides=('woeusb')
conflicts=('woeusb' 'woeusb-git' 'woeusb-ng')
source=( "${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    git -C "${srcdir}/${pkgname}" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    # Disable weird post install hook
    sed --quiet --in-place 's|post_install()$|#post_install()|g' \
        "${srcdir}/${pkgname}/setup.py"
    # Install package
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    # Copy files because the installer hook is atrocious
    install -dm 0755 "${pkgdir}/usr"
    install -dm 0755 "${pkgdir}/usr/bin"
    install -dm 0755 "${pkgdir}/usr/share"
    install -dm 0755 "${pkgdir}/usr/share/applications"
    install -dm 0755 "${pkgdir}/usr/share/icons"
    install -dm 0755 "${pkgdir}/usr/share/polkit-1"
    install -dm 0755 "${pkgdir}/usr/share/polkit-1/actions"
    install -Dm 0755 "${srcdir}/${pkgname}/WoeUSB/woeusbgui" \
        "${pkgdir}/usr/bin/woeusbgui"
    install -Dm 0644 "${srcdir}/${pkgname}/WoeUSB/data/icon.ico" \
        "${pkgdir}/usr/share/icons/WoeUSB-ng/icon.ico"
    install -Dm 0755 "${srcdir}/${pkgname}/miscellaneous/WoeUSB-ng.desktop" \
        "${pkgdir}/usr/share/applications/WoeUSB-ng.desktop"
    install -Dm 0755 "${srcdir}/${pkgname}/miscellaneous/com.github.woeusb.woeusb-ng.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/com.github.woeusb.woeusb-ng.policy"
}
