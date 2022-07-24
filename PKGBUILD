# Maintainer: Shiroko <hhx.xxm at gmail.com>
# Maintainer: Johnpoint <me at lvcshu.com>
# Maintainer: nekohasekai <contact-archlinux@sekai.icu>

pkgname=clash-for-windows-bin-git
pkgver=0.19.25
pkgrel=1
pkgdesc="A Windows/macOS/Linux GUI based on Clash and Electron."
arch=("x86_64" "aarch64")
url="https://github.com/Fndroid/clash_for_windows_pkg"
# logo_url="https://raw.githubusercontent.com/Dreamacro/clash/master/docs/logo.png"
logo_url="https://cdn.jsdelivr.net/gh/Dreamacro/clash@master/docs/logo.png"
install=clash-for-windows-bin.install
conflicts=(clash-for-windows-bin)

depends=('libxss' 'gtk3')

optdepends=(
    'nftables: TUN mode required.'
    'iproute2: TUN mode required.'
)

source=(
    "$pkgname::git+$url.git"
    "clash.png::${logo_url}"
    "clash-for-windows.desktop"
    "cfw"
    )

source_x86_64=(
    "${pkgname}-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-x64-linux.tar.gz"
    )

source_aarch64=(
    "${pkgname}-${pkgver}-aarch64-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-arm64-linux.tar.gz"
    )

sha512sums=('SKIP'
            'd739dbdd622e873e58155c40be9ef78f5a2247115d0fdc480be2beaac41c59b7eca963fbc2e09cfec49dd0d491ac2a92dcf5a157c95ef1448694f47e0e752c14'
            'e3716794ffeaff3bcecd3fb12fe6c882c7186866b494f006042f41aaba6e4afc405066cdec66bd2c66402141c74bc900425b2de17e1002f017f69662f08c0e3e'
            '14f67ad3718e97350b12280dada01a2f965cc2e9e5ccd72e2295e5f2f3f3fa04f2c5ed0f435054de6155937c17049064227cd39107bad3e11a126ce5a3e0fcf7')
sha512sums_x86_64=('SKIP')
sha512sums_aarch64=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "$(git tag --sort=committerdate | tail -1)"
}

build() {
    # generate .desktop file
    sed -i "s/pkgver/${pkgver}/" clash-for-windows.desktop
}

package() {
    local parch=$(echo ${arch} | sed "s/x86_64/x64/;s/aarch64/arm64/")
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
