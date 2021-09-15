# Maintainer: Johnpoint <me at lvcshu.com>
# Contributor: Shiroko <hhx.xxm at gmail.com>
pkgname=clash-for-windows
pkgver=0.18.0
pkgrel=2
pkgdesc="A Windows/macOS/Linux GUI based on Clash and Electron."
arch=("x86_64")
url="https://github.com/Fndroid/clash_for_windows_pkg"
logo_url="https://raw.githubusercontent.com/Dreamacro/clash/master/docs/logo.png"
parch=$(echo ${arch} | sed "s/x86_64/x64/")
install=clash-for-windows.install

depends=('libxss' 'gtk3')

optdepends=(
    'nftables: TUN mode required.'
    'iproute2: TUN mode required.'
)

source=(
    "${pkgname}-${pkgver}-${arch}-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-${parch}-linux.tar.gz"
    "clash.png::${logo_url}"
    "clash-for-windows.desktop"
    )
sha256sums=(
    '5fb4295ae4d340bbd08914eecad5d6626dde41dcd112c372d9f426df6b88f51d'
    'SKIP'
    '12f6f13248a1de0249ef5fbd85bd3eae44401b98049f2fd42bdd1431edf8919e'
    )

build() {
    # generate .desktop file
    sed -i "s/pkgver/${pkgver}/" clash-for-windows.desktop
}

package() {
    cd "Clash for Windows-${pkgver}-${parch}-linux"
    echo "packaging resource files as 644"
    find . -type f -not \( -name "cfw" -or -name "clash-linux" -or -name "clash-core-service" -or -name "chrome-sandbox" -or -name "*.sh" \) \
        -exec install -Dm 644 {} "${pkgdir}/opt/${pkgname}"/{} \;
    echo "packaging executable files as 755"
    find . -type f \( -name "cfw" -or -name "clash-linux" -or -name "clash-core-service" -or -name "chrome-sandbox" -or -name "*.sh" \) \
       -exec install -Dm 755 {} "${pkgdir}/opt/${pkgname}"/{} \;
    install -Dm 755 cfw ${pkgdir}/usr/bin/cfw 
    install -Dm 644 ../clash.png ${pkgdir}/usr/share/pixmaps/clash.png
    install -Dm 644 ../clash-for-windows.desktop ${pkgdir}/usr/share/applications/clash-for-windows.desktop
}