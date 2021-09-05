# Maintainer: Shiroko <hhx.xxm at gmail.com>
pkgname=clash-for-windows-bin
pkgver=0.17.3
pkgrel=1
pkgdesc="A Windows/macOS/Linux GUI based on Clash and Electron."
arch=("x86_64")
url="https://github.com/Fndroid/clash_for_windows_pkg"
logo_url="https://raw.githubusercontent.com/Dreamacro/clash/master/docs/logo.png"
parch=$(echo ${arch} | sed "s/x86_64/x64/")
install=clash-for-windows-bin.install

depends=('libxss' 'gtk3')

optdepends=(
    'nftables: TUN mode required.'
    'iproute2: TUN mode required.'
)

source=(
    "${pkgname}-${pkgver}-${arch}-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-${parch}-linux.tar.gz"
    "clash-logo.png::${logo_url}"
    "clash-for-windows.desktop"
    "cfw"
    )
sha256sums=(
    '12e6ce24c7e2487b1e9fbd7073f72c5169f4382de6912bb3c24cbbea3933debc'
    'SKIP'
    'b57d88996d6d1bc92b34581304eb74b8f4d8a42f0ca14c8f01fa3ce13ff93e29'
    'ae9c81c66f52115a1b7c3c49ff40b0112a1af72cf602eaa3d1b999d15f9818bd'
    )

build() {
    # generate .desktop file
    sed -i "s/pkgver/${pkgver}/" clash-for-windows.desktop
}

package() {
    cd "Clash for Windows-${pkgver}-${parch}-linux"
    echo "packaging resource files as 644"
    find . -type f -not \( -name "cfw" -or -name "clash-linux" -or -name "clash-core-service" -or -name "chrome-sandbox" -or -name "*.sh" \) \
        -exec install -Dm 644 {} "${pkgdir}/usr/lib/${pkgname}"/{} \;
    echo "packaging executable files as 755"
    find . -type f \( -name "cfw" -or -name "clash-linux" -or -name "clash-core-service" -or -name "chrome-sandbox" -or -name "*.sh" \) \
       -exec install -Dm 755 {} "${pkgdir}/usr/lib/${pkgname}"/{} \;
    install -Dm 755 ../cfw ${pkgdir}/usr/bin/cfw 
    install -Dm 644 ../clash-logo.png ${pkgdir}/usr/lib/${pkgname}/clash-logo.png
    install -Dm 644 ../clash-for-windows.desktop ${pkgdir}/usr/share/applications/clash-for-windows.desktop
}