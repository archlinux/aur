# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Maintainer: Manuel Barrio Linares <mbarriolinares at gmail dot com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=antigravity-ide
pkgver=2.6.0
pkgrel=1
pkgdesc='An agentic development platform from Google, evolving the IDE into the agent-first era'
arch=(aarch64 x86_64)
url='https://antigravity.google/'
license=(LicenseRef-Google-Antigravity)
depends=(alsa-lib
         at-spi2-core
         bash
         cairo
         curl
         dbus
         expat
         glib2
         glibc
         gtk3
         libcups
         libgcc
         libsecret
         libsoup3
         libstdc++
         libx11
         libxcb
         libxcomposite
         libxdamage
         libxext
         libxfixes
         libxkbcommon
         libxkbfile
         libxrandr
         mesa
         nspr
         nss
         openssl
         pango
         systemd-libs
         util-linux-libs
         webkit2gtk-4.1)
conflicts=('antigravity<2.0')
options=(!strip !debug)
install=$pkgname.install
source=(antigravity-ide.sh
        antigravity-ide.desktop
        antigravity-ide-url-handler.desktop
        antigravity-ide.appdata.xml
        antigravity-ide-workspace.xml)
# Workaround: upstream bundles @parcel/watcher 2.5.1 which triggers SIGTRAP/coredump on exit.
# Official prebuilt 2.5.6 from npm fixes the teardown race condition (parcel-bundler/watcher#216).
_watcher_ver=2.5.6
_build=5526304964083712
source_x86_64=($pkgname-$pkgver-x86_64.tar.gz::https://dl.google.com/release2/j0qc3/antigravity/stable/$pkgver-$_build/linux-x64/Antigravity%20IDE.tar.gz
               watcher-x64-$_watcher_ver.tgz::https://registry.npmjs.org/@parcel/watcher-linux-x64-glibc/-/watcher-linux-x64-glibc-$_watcher_ver.tgz)
source_aarch64=($pkgname-$pkgver-aarch64.tar.gz::https://dl.google.com/release2/j0qc3/antigravity/stable/$pkgver-$_build/linux-arm/Antigravity%20IDE.tar.gz
                 watcher-arm64-$_watcher_ver.tgz::https://registry.npmjs.org/@parcel/watcher-linux-arm64-glibc/-/watcher-linux-arm64-glibc-$_watcher_ver.tgz)
b2sums=('20a33a75e654ffb6535cd415d52b06559cb681da84eace78702fea50d5362ad23b478c8308bd4b7c48820d8a01c84b5643e754f561e0afa843a5495a694ca86e'
        '5047eb55fc8d0a9288c852ddb6fb32cb41915d97d600d3e40c8b52dbbb0efa6ffb173439a2511b44d39b539655f3f2f0bd569da95023da2373e29da69f68be5f'
        'ccd8e86e6acc9e542428377b3fadc743b8b2e7d59e6aa96c9aa21a8b743af9532aefdfdab062bb296515bdf0752e2b3208b888869bae4a55b4ddd07652d5f37f'
        '8d082784596cfe67fe48e409d780ae03f6e6c9aa999412d9b2a47bfcdb6357a08a5abf9c4fd90e2c49df5ecbd98c179c43a6bcc38e477aace24f4ba23a481a6c'
        'f6ed182fbf1463a24dc5545c71d7924b1e9b7c9832d25bfe09974a63c72385dfecbe0b609a492717348178ba6b61601f4ccea53d3f2942dd330567da40be6e95')
b2sums_aarch64=('92da83ebea4f03c10ed495e3631e74d9103864dde6cbb18a60c11f8aaa402b34e7681a48d51f61afa4c87a96146801605b3e47ce4bd962ae501813712c491963'
                '7c646a9085006c79f346b56f04e68be3708a878625aac8bf948c7bc5dccee6c7231206230be351fb2d4e6e9c58e9abcab55dd474a135484f4732738948e7a8d5')
b2sums_x86_64=('1e931652fa5b99fe753ee2aa660f2f757b4b87612af83965fa7924231da816b5423fa033cddbbdcb99b629682d635e29b3c5233a68a25b4ce3100423326bca72'
               '8a1b93db2872a1eb1dc095cd913c44c52a29adb5bd9f1c608e3baa2d5504c4fd0e72e9f429cbf931fb101f325d53f6b66d954ed40219a9f3099513924891d5fe')

package() {
    install -d "$pkgdir/opt"
    cp -a "Antigravity IDE" "$pkgdir/opt/antigravity-ide"
    rm -r "$pkgdir/opt/antigravity-ide/resources/completions"

    # Replace faulty upstream @parcel/watcher binary
    install -Dm755 package/watcher.node \
        "$pkgdir/opt/antigravity-ide/resources/app/node_modules/@parcel/watcher/build/Release/watcher.node"

    install -Dm755 antigravity-ide.sh "$pkgdir/usr/bin/$pkgname"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/antigravity-ide/resources/app/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/antigravity-ide/LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 $pkgname-url-handler.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 $pkgname.appdata.xml -t "$pkgdir/usr/share/metainfo"
    install -Dm644 $pkgname-workspace.xml -t "$pkgdir/usr/share/mime/packages"

    cd "Antigravity IDE"
    install -Dm644 resources/completions/bash/$pkgname -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 resources/completions/zsh/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 resources/app/resources/linux/code.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
