# Maintainer: irmluity <irmluity@proton.me>

pkgname=furious
pkgver=0.2.11
pkgrel=1
pkgdesc="A PySide6-based cross platform GUI client that launches your beloved GFW to outer space. Support Xray-core and hysteria."
arch=(x86_64)
url='https://github.com/LorenEteval/Furious'
license=('GPL-3')
depends=()
makedepends=('cmake' 'python' 'python-pip' 'patchelf')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=("furious")
options=(!strip)
source=(
    "https://github.com/LorenEteval/Furious/archive/refs/tags/${pkgver}.zip"
    "https://go.dev/dl/go1.20.10.linux-amd64.tar.gz"
    "furious.png"
    "furious.desktop"
)
sha256sums=(
    "47470e233e23c6d12b75239145bb1a0d53f53bc183a1b147fa689f4e7bd0ff28"
    "80d34f1fd74e382d86c2d6102e0e60d4318461a7c2f457ec1efc4042752d4248"
    "c39c972e4aba77c3f36ad2098b139c2cf66c896e1ed29c7c207726732aa4c748"
    "a8605d0ffa7417e0f7b705e7cd515873646e0b8bfa5c35d953499114c0c01e3d"
)
_install_path="/opt/$pkgname"

prepare() {
    export "PATH=$PATH:${srcdir}/go/bin"
    cd "${srcdir}"
    python -m venv .venv
    source .venv/bin/activate
    cd "${srcdir}/Furious-${pkgver}"
    pip install --upgrade pip
    pip install wheel
    pip install hysteria2==2.0.0.1
    pip install -r requirements.txt
    python -m pip install nuitka
}

build() {
    cd "${srcdir}/Furious-${pkgver}"
    python -m nuitka --standalone --plugin-enable=pyside6 --follow-imports --disable-console --assume-yes-for-downloads  --include-package-data=Furious Furious/__main__.py --output-dir=guiBinaries
}

package() {
    cd "${srcdir}/Furious-${pkgver}/guiBinaries/__main__.dist/"
    find . -type f -exec install -Dm 755 {} "$pkgdir/$_install_path"/{} \;
    
    install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    
    install -Dm644 "${srcdir}/furious.png" "${pkgdir}/usr/share/icons/hicolor/400x400/apps/furious.png"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${_install_path}/__main__.bin" "${pkgdir}/usr/bin/${pkgname}"
}