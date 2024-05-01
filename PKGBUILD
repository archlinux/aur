# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: Twor <i@twor.me>
# Contributor: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
pkgname=xmcl-launcher
pkgver=0.44.3
pkgrel=1
pkgdesc="X Minecraft Launcher - 一个现代化的 Minecraft 启动器"
arch=('x86_64')
provide=("xmcl")
url="https://xmcl.app/"
license=('MIT')
depends=('electron27')
electronDist=/usr/lib/electron27
electronVersion=27
makedepends=('pnpm')
conflicts=('xmcl-launcher-bin')
optdepends=('jre8-openjdk: 启动低版本游戏的最低要求'
'jre11-openjdk: 推荐使用此版本Java启动1.12(17w13a)-1.17(21w18a)'
'jre17-openjdk: 推荐使用此Java版本启动1.17(21w19a)及以上的版本')
source=("https://github.com/Voxelum/x-minecraft-launcher/archive/refs/tags/v$pkgver.tar.gz"
    xmcl.desktop
    xmcl.png
    xmcl-launcher)
md5sums=('3da03519f626c7154ee9eadda5e6c155'
         'ef302df83d9a2e867dc94e509ba1e0b2'
         '8facdbaf84f32aaefff5d6fcdad0b8a8'
         '0ca353b6f4df117ce040b717f15eada2')
#install="$pkgname.install"
build() {
    cd "$srcdir/x-minecraft-launcher-$pkgver"
    export npm_config_target=$(tail /usr/lib/electron/version)
    export npm_config_arch=x64
    export npm_config_target_arch=x64
    export npm_config_disturl=https://electronjs.org/headers
    export npm_config_runtime=electron
    export npm_config_build_from_source=true
    yes|HOME="$srcdir/.electron-gyp" pnpm install --cache "${srcdir}/npm-cache" 
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
    find "$pkgdir" -type f -name package.json | while read pkgjson; do
        local tmppackage="$(mktemp)"
        jq 'del(.man)' "$pkgjson" > "$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    done
    pnpm run --prefix xmcl-keystone-ui build
    ./node_modules/.bin/electron-builder --linux --x64 --dir $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer

}

package() {
    cd "$srcdir/x-minecraft-launcher-$pkgver"
    install -Dm644 "$srcdir/xmcl.desktop" "$pkgdir/usr/share/applications/xmcl.desktop"
    install -Dm644 "$srcdir/xmcl.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/xmcl.png"
    install -Dm644 "${srcdir}/xmcl-electron-app/build/output/linux-unpacked/resources/app.asar" "${pkgdir}"/usr/share/xmcl/xmcl.asar
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
