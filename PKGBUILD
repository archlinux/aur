# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: Twor <i@twor.me>
# Contributor: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
pkgname=xmcl-launcher
pkgver=0.44.5
pkgrel=2
pkgdesc="X Minecraft Launcher - 一个现代化的 Minecraft 启动器"
arch=('x86_64')
provide=("xmcl")
url="https://xmcl.app/"
license=('MIT')
depends=('electron29')
#electronDist=/usr/lib/electron29
#electronVersion=$(tail /usr/lib/electron29/version)
makedepends=('pnpm')
conflicts=('xmcl-launcher-bin')
optdepends=('jre8-openjdk: 启动低版本游戏的最低要求'
'jre11-openjdk: 推荐使用此Java版本启动1.12-1.17'
'jre17-openjdk: 推荐使用此Java版本启动1.17及以上的版本'
'jre22-openjdk: 推荐使用此Java版本启动1.20.5及以上版本')
source=("git+https://github.com/Voxelum/x-minecraft-launcher.git#tag=v$pkgver"
        "git+https://github.com/Voxelum/minecraft-launcher-core-node"
        "LICENSE::https://raw.githubusercontent.com/Voxelum/x-minecraft-launcher/master/LICENSE"
    xmcl.desktop
    xmcl.png
    xmcl-launcher)
sha256sums=('8296ac8aa9c970c62b0d078060fcf6a74e9e827695e3176e936dc211e895b6f8'
            'SKIP'
            '72e17fb1c83deda594cf7c6bf61b45ee31880b86e2d526e9a4b16d2d8b3fc7fa'
            'c0712f9a3be2bfd2aabc3f11965dc46fc2d5e2652f5431fc6e7fb618d1b45de5'
            '4c56e72cc6784c4c2d870c307d74e7afa6c13b001bb52f9b255cd82ab709adcb'
            'b6d56ce25d2ce5163253e0ff7c159849d3ecbfad4a9d3d809dcdd2522b3c7007')
#install="$pkgname.install"
prepare() {
    cd "$srcdir/x-minecraft-launcher"
    git submodule init
    git config submodule.xmcl.url "$srcdir/minecraft-launcher-core-node"
    git -c protocol.file.allow=always submodule update
    yes|HOME="$srcdir/.electron-gyp" pnpm install

}
build() {
    cd "$srcdir/x-minecraft-launcher"
    pnpm run --prefix xmcl-keystone-ui build
    pnpm run --prefix xmcl-electron-app build:dir
    #./node_modules/.bin/electron-builder --linux --x64 --dir $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer

}

package() {
    cd "$srcdir/x-minecraft-launcher"
    install -Dm644 "$srcdir/xmcl.desktop" "$pkgdir/usr/share/applications/xmcl.desktop"
    install -Dm644 "$srcdir/xmcl.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/xmcl.png"
    install -Dm644 "./xmcl-electron-app/build/output/linux-unpacked/resources/app.asar" "${pkgdir}"/usr/share/xmcl/xmcl.asar
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../LICENSE
}
