#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=watt-toolkit-bin
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=2.8.6
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL3')
depends=('libcap')
makedepends=('tar' 'zstd')
optdepends=('steam: need official or flatpak version of steam')
provides=('steam++' 'watt-toolkit')
conflicts=('steam++' 'watt-toolkit')
options=('!strip')
source=('watt-toolkit.desktop' 'set-cap.hook' 'icon.png::https://github.com/BeyondDimension/SteamTools/raw/develop/resources/AppIcon/Logo_64.png')
source_aarch64=("Steam++_${pkgver}_aarch64.tar.zst::https://github.com/BeyondDimension/SteamTools/releases/download/${pkgver}/Steam++_linux_arm64_v${pkgver}.tar.zst")
source_x86_64=("Steam++_${pkgver}_x86_64.tar.zst::https://github.com/BeyondDimension/SteamTools/releases/download/${pkgver}/Steam++_linux_x64_v${pkgver}.tar.zst")
sha256sums=('251dceba9814b53e56e175d60965ffab8160b5cc58640c3069f927dae5b7a46f'
            '495418217e895deed32c8166c5d85718b23676e52b91d1bb412d69d5f945b2e9'
            '1c7e2b167b6b457c685d0d4890147edf70eb2a3eeefb12aa42ddd0c721b2f49d')
sha256sums_x86_64=('b96e029631f66fd5194d9f31565027053dc80c20a9e6f3bcbfe1a5224db18b40')
sha256sums_aarch64=('8232f9a3025c28a69453819fa729c7b63ff04fef9ad16d0d45ab3cb858bab30a')
noextract=("Steam++_${CARCH}.tar.zst")
package(){
    mkdir -p "${pkgdir}/opt/watt-toolkit"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/opt/watt-toolkit"
    tar -xvf "${srcdir}/Steam++_${pkgver}_${CARCH}.tar.zst"
    for file in Steam++ libHarfBuzzSharp.so libSkiaSharp.so libe_sqlite3.so
    do
        chmod 755 "${pkgdir}/opt/watt-toolkit/${file}"
    done
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/watt-toolkit.png"
    ln -sf /opt/watt-toolkit/Steam++ "${pkgdir}/usr/bin/watt-toolkit"
    install -Dm644 "${srcdir}/watt-toolkit.desktop" "${pkgdir}/usr/share/applications/watt-toolkit.desktop"
    # Fix font issue, will remove once upstream fix this, enable this to fix crash at About page
    #sed -i "s|Exec=/usr/bin/watt-toolkit|Exec=env LANG=en_US.UTF-8 /usr/bin/watt-toolkit|" "${pkgdir}/usr/share/applications/watt-toolkit.desktop"
    install -Dm644 "${srcdir}/set-cap.hook" "${pkgdir}/usr/share/libalpm/hooks/watt-toolkit-set-cap.hook"
}
