# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=furious
pkgname=$_pkgname-git
pkgver=0.2.13
pkgrel=1
pkgdesc="A PySide6-based cross platform GUI client that launches your beloved GFW to outer space. Support Xray-core and hysteria"
arch=(x86_64)
url='https://github.com/LorenEteval/Furious'
license=('GPL3')
makedepends=('git' 'cmake' 'python' 'patchelf' 'go1.20' 'python-wheel' 'pyside6' 'xray' 'hysteria' 'hysteria1' 'tun2socks' 'python-ujson' 'python-pyqrcode' 'python-pypng' 'python-ping3' 'nuitka' 'pybase64')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(
    "git+https://github.com/LorenEteval/Furious.git"
    "furious.png"
    "furious.desktop"
)
sha256sums=(
    "SKIP"
    "c39c972e4aba77c3f36ad2098b139c2cf66c896e1ed29c7c207726732aa4c748"
    "a8605d0ffa7417e0f7b705e7cd515873646e0b8bfa5c35d953499114c0c01e3d"
)
_install_path="/opt/$_pkgname"

pkgver() {
    cd "$srcdir/Furious"
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
    ln -s /usr/bin/go1.20 go
    export PATH=$(pwd):$PATH
}

build() {
    cd "${srcdir}/Furious"
    python -m nuitka --standalone --plugin-enable=pyside6 --follow-imports --disable-console --assume-yes-for-downloads  --include-package-data=Furious Furious/__main__.py --output-dir=guiBinaries
}

package() {
    cd "${srcdir}/Furious/guiBinaries/__main__.dist/"
    find . -type f -exec install -Dm 755 {} "$pkgdir/$_install_path"/{} \;
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/400x400/apps/${_pkgname}.png"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${_install_path}/__main__.bin" "${pkgdir}/usr/bin/${_pkgname}"
}