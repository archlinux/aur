# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=singland
pkgver=pre_alpha_4
pkgrel=1
pkgdesc="A GUI for sing-box. The universal proxy platform"
arch=(x86_64)
url='https://github.com/net-breaker/sing-land'
license=('MIT')
depends=('hicolor-icon-theme' 'glib2' 'glibc' 'gcc-libs' 'expat' 'dbus')
makedepends=('nodejs' 'npm' 'openssl-1.1' 'libxcrypt' 'cryptsetup' 'libxcrypt-compat')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
conflicts=(${pkgname}-git ${pkgname}-bin)
source=(
    "https://github.com/net-breaker/sing-land/archive/refs/tags/${pkgver//_/-}.zip"
    "https://github.com/SagerNet/sing-box/releases/download/v1.6.0/sing-box-1.6.0-linux-amd64.tar.gz"
    "singland.desktop"
)
sha256sums=(
    "abc7499ee2de6a8f13e084de58d0346bbac82d151277e1d5054f676b5bf7cf8f"
    "ffa107294e7a6b29805e32cc1fa0147a50b0ba8d0722582d457e5e60ac34a052"
    "bedcc8193fcadf9e33c4117bf47fa9e479abd2fc88548571323b26d9b4cbf77a"
)
_install_path="/opt/$pkgname"

prepare() {
    cd "${srcdir}"
    mv sing-box-1.6.0-linux-amd64/sing-box sing-land-${pkgver//_/-}/controller/resources/sing-box
    cd "${srcdir}/sing-land-${pkgver//_/-}"
    cd controller
    npm ci
    cd ../editor
    npm ci
    cd ../singland
    sed -i 's/"deb",\|"rpm",//g' electron-builder.json
    npm ci
}

build() {
    cd "${srcdir}/sing-land-${pkgver//_/-}/singland"
    npm run init-unix
    npm run build
    mv ${srcdir}/sing-land-${pkgver//_/-}/singland/release/singland-*.tar.gz ${srcdir}/singland.tar.gz
    mkdir ${srcdir}/singland
    tar -xvzf ${srcdir}/singland.tar.gz -C ${srcdir}/singland
}


package() {
    cd "${srcdir}/singland"
    cd $(find . -type d -name 'singland-*' -print -quit)
    find . -type f -exec install -Dm755 {} "$pkgdir/$_install_path"/{} \;
    install -Dm644 "${srcdir}/singland.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    for _icons in 32 256 512;do
        install -Dm644 "${srcdir}/sing-land-${pkgver//_/-}/singland/icons/logo-${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/sing-land-${pkgver//_/-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}