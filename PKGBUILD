# Maintainer: yupoi <me at eWJscG9pQG91dGxvb2suY3BtCg== >
pkgname=clash-for-windows-chinese-git
pkgver=0.20.21
pkgrel=1
pkgdesc="A Windows/macOS/Linux GUI based on Clash and Electron（Chinese version.）."
arch=("x86_64")
url="https://github.com/Fndroid/clash_for_windows_pkg"
_logo_url="https://raw.githubusercontent.com/Dreamacro/clash/master/docs/logo.png"
_parch=$(echo ${arch} | sed "s/x86_64/x64/")
install=clash-for-windows.install
license=('custom')

depends=('libxss' 'gtk3' 'p7zip')

optdepends=(
    'nftables: TUN mode required.'
    'iproute2: TUN mode required.'
)

options=(!strip)

provides=('clash-for-windows')
conflicts=('clash-for-windows')

source=(
    "${pkgname}-${pkgver}-${arch}-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-${_parch}-linux.tar.gz"
    "${pkgname}-app-${pkgver}.7z::https://github.com/ender-zhao/Clash-for-Windows_Chinese/releases/download/CFW-V${pkgver}_CN/app.7z"
    "clash.png::${_logo_url}"
    "clash-for-windows-chinese.desktop"
    "cfw"
)
sha256sums=('d5a85185f3bd04ed07d5ecffe495eab295b8758cf07b96aec1972c3e45009521'
            '067eca01a87a709a766b2352b92af4648a065bee12317658db8ddf2c1362a732'
            '0d48a2ea1ee05ad4579b6e6996889548fa8a61a5ff6c85a32f7622cddfcb5782'
            '66e0d326e375ad0fbf88325c34e0dd82e676b9214f4838979dab3d9d11c4fecb'
            '2451fc0eff3f48c48e4eb818d1e1ce62182737db19b95541cb13ec81183550c7')

build() {
    # generate .desktop file
    sed -i "s/pkgver/${pkgver}/" clash-for-windows-chinese.desktop
}

package() {
    cd "Clash for Windows-${pkgver}-${_parch}-linux"
    echo "packaging resource files as 644"
    find . -type f -not \( -name "cfw" -or -name "clash-linux" -or -name "clash-core-service" -or -name "chrome-sandbox" -or -name "*.sh" \) \
        -exec install -Dm 644 {} "${pkgdir}/opt/${pkgname}"/{} \;
    echo "packaging executable files as 755"
    find . -type f \( -name "cfw" -or -name "clash-linux" -or -name "clash-core-service" -or -name "chrome-sandbox" -or -name "*.sh" \) \
        -exec install -Dm 755 {} "${pkgdir}/opt/${pkgname}"/{} \;
    cd ../
    install -Dm 755 cfw ${pkgdir}/usr/bin/cfw
    install -Dm 644 clash.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/clash.png
    install -Dm 644 clash-for-windows-chinese.desktop ${pkgdir}/usr/share/applications/clash-for-windows-chinese.desktop
    cp "${srcdir}/app.asar" "${pkgdir}/opt/${pkgname}/resources/"
}
