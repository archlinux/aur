# Maintainer: Shiroko <hhx.xxm at gmail.com>
# Maintainer: Johnpoint <me at lvcshu.com>
pkgname=clash-for-windows-bin
pkgver=0.19.0
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
    "clash.png::${logo_url}"
    "clash-for-windows.desktop"
    "cfw"
    )
sha256sums=(
    '678ad7f40f603837826618f215669c9a06c76eed97304372ce81d5fe45569c58'
    'SKIP'
    'a2997f604a486e264f6fc5344164ae9e1a9a01282006a41784dd181f7d1a2913'
    '4c0a9de624905e3717b0dd4effa24fbf5c79ad28221b3b3b15a4a0aca4d47e03'
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
    install -Dm 755 ../cfw ${pkgdir}/usr/bin/cfw 
    install -Dm 644 ../clash.png ${pkgdir}/usr/share/pixmaps/clash.png
    install -Dm 644 ../clash-for-windows.desktop ${pkgdir}/usr/share/applications/clash-for-windows.desktop
}
