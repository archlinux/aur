# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=furious
pkgver=0.2.13
pkgrel=1
pkgdesc="A PySide6-based cross platform GUI client that launches your beloved GFW to outer space. Support Xray-core and hysteria"
arch=(x86_64)
url='https://github.com/LorenEteval/Furious'
license=('GPL3')
makedepends=('cmake' 'python' 'patchelf' 'go1.20' 'python-wheel' 'pyside6' 'xray' 'hysteria' 'hysteria1' 'tun2socks' 'python-ujson' 'python-pyqrcode' 'python-pypng' 'python-ping3' 'nuitka' 'pybase64')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
conflicts=(${pkgname}-git)
source=(
    "https://github.com/LorenEteval/Furious/archive/refs/tags/${pkgver}.zip"
    "furious.png"
    "furious.desktop"
)
sha256sums=(
    "275bc710ad3017ccf9fa438361723067b2a2a59c5d4bff8b0f60d2752bd0e191"
    "c39c972e4aba77c3f36ad2098b139c2cf66c896e1ed29c7c207726732aa4c748"
    "a8605d0ffa7417e0f7b705e7cd515873646e0b8bfa5c35d953499114c0c01e3d"
)
_install_path="/opt/$pkgname"

prepare() {
    ln -s /usr/bin/go1.20 go
    export PATH=$(pwd):$PATH
}

build() {
    cd "${srcdir}/Furious-${pkgver}"
    python -m nuitka --standalone --plugin-enable=pyside6 --follow-imports --disable-console --assume-yes-for-downloads  --include-package-data=Furious Furious/__main__.py --output-dir=guiBinaries
}

package() {
    cd "${srcdir}/Furious-${pkgver}/guiBinaries/__main__.dist/"
    find . -type f -exec install -Dm755 {} "$pkgdir/$_install_path"/{} \;
    install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/400x400/apps/${pkgname}.png"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${_install_path}/__main__.bin" "${pkgdir}/usr/bin/${pkgname}"
}