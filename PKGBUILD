# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname=openbuilds-control
pkgver=1.0.376
pkgrel=1
pkgdesc="Grbl Host / Interface for all CNC style machines running Grbl"
url="https://github.com/OpenBuilds/OpenBuilds-CONTROL"
license=("GPL-3.0-only")
arch=("x86_64")
_electron=electron23
depends=('glibc' 'gcc-libs' $_electron 'dbus' 'libxdamage' 'nss' 'at-spi2-core' 'cairo' 'alsa-lib' 'libdrm' 'gtk3' 'libxcomposite' 'expat' 'libx11' 'glib2' 'libxfixes' 'libcups' 'libxrandr' 'pango' 'nspr' 'python' 'libxcb' 'mesa' 'libxext' 'libxkbcommon' 'hicolor-icon-theme')
makedepends=('npm')
source=(
    "git+${url}#tag=v${pkgver}"
    'openbuildscontrol.desktop'
    'openbuildscontrol'
)
sha512sums=('130bd8c1f307b7e3b00e4fe0d6433eb8a4f2283b4703bf29806bb3e3ed1e7e9e747f459d13c1b53f2c8917c17dd5928792e961b09d9144ac1fd9d2c344d40ca5'
            '896cc097f594268618ddaa9cec137e8bbd4314ad7796e077f73f88aa034f32903d9056ea0c5299b5a91f26f53ae3cc4917482e3280854144e388568d86232879'
            '7d9833000c547ef14a0e7a272903991db3b3a2297527e2fd40d1e2a20c34f6771edce68b736a1859d6c3dd769f263ff90a073622f7bdcdd33a6274b40299f925')

build() {
    cd "$srcdir/OpenBuilds-CONTROL"
    export npm_config_target=$(tail /usr/lib/$_electron/version)
    export npm_config_arch=x64
    export npm_config_target_arch=x64
    export npm_config_disturl=https://electronjs.org/headers
    export npm_config_runtime=electron
    export npm_config_build_from_source=true
    HOME="$srcdir/.electron-gyp" npm install

    ./node_modules/.bin/electron-builder --linux --x64 --dir -c.electronDist=/usr/lib/$_electron/ -c.electronVersion=$(cat /usr/lib/$_electron/version)

}

package() {
    cd $srcdir/OpenBuilds-CONTROL/
    install -Dm644 "dist/linux-unpacked/resources/app.asar" -t "$pkgdir/usr/lib/openbuilds-control/"
    cp -r --preserve=mode "dist/linux-unpacked/resources/app.asar.unpacked/" "$pkgdir/usr/lib/openbuilds-control/"
    install -Dm644 "app/icon.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/openbuildscontrol.png"
    install -Dm644 "../openbuildscontrol.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm755 "../openbuildscontrol" -t "$pkgdir/usr/bin/"
}
