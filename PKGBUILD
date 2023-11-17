# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=singland
pkgname=$_pkgname-git
pkgver=pre_alpha_4
pkgrel=1
pkgdesc="A GUI for sing-box. The universal proxy platform"
arch=(x86_64)
url='https://github.com/net-breaker/sing-land'
license=('MIT')
depends=('hicolor-icon-theme' 'glib2' 'glibc' 'gcc-libs' 'expat' 'dbus')
makedepends=('git' 'nodejs' 'npm' 'openssl-1.1' 'libxcrypt' 'cryptsetup' 'libxcrypt-compat')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=(${_pkgname})
conflicts=(${_pkgname}-bin ${_pkgname})
source=(
    "git+https://github.com/net-breaker/sing-land"
    "https://github.com/SagerNet/sing-box/releases/download/v1.6.0/sing-box-1.6.0-linux-amd64.tar.gz"
    "singland.desktop"
)
sha256sums=(
    "SKIP"
    "ffa107294e7a6b29805e32cc1fa0147a50b0ba8d0722582d457e5e60ac34a052"
    "bedcc8193fcadf9e33c4117bf47fa9e479abd2fc88548571323b26d9b4cbf77a"
)
_install_path="/opt/$_pkgname"

pkgver() {
    cd "$srcdir/sing-land"
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
    cd "${srcdir}"
    mv sing-box-1.6.0-linux-amd64/sing-box sing-land/controller/resources/sing-box
    cd "${srcdir}/sing-land"
    cd controller
    npm ci
    cd ../editor
    npm ci
    cd ../singland
    sed -i 's/"deb",\|"rpm",//g' electron-builder.json
    npm ci
}

build() {
    cd "${srcdir}/sing-land/singland"
    npm run init-unix
    npm run build
    mv ${srcdir}/sing-land/singland/release/singland-*.tar.gz ${srcdir}/singland.tar.gz
    mkdir ${srcdir}/singland
    tar -xvzf ${srcdir}/singland.tar.gz -C ${srcdir}/singland
}


package() {
    cd "${srcdir}/singland"
    cd $(find . -type d -name 'singland-*' -print -quit)
    find . -type f -exec install -Dm755 {} "$pkgdir/opt/$_pkgname"/{} \;
    install -Dm644 "${srcdir}/singland.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    for _icons in 32 256 512;do
        install -Dm644 "${srcdir}/sing-land/singland/icons/logo-${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${_pkgname}.png"
    done
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "$srcdir/sing-land/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}