# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname=openbuilds-control
pkgver=1.0.378
pkgrel=1
pkgdesc="Grbl Host / Interface for all CNC style machines running Grbl"
url="https://github.com/OpenBuilds/OpenBuilds-CONTROL"
license=("GPL-3.0-only")
arch=("x86_64")
_electron=electron23
depends=(
    $_electron 'dbus' 'libxdamage' 'nss' 'at-spi2-core' 'cairo' 'alsa-lib'
    'libdrm' 'gtk3' 'libxcomposite' 'expat' 'libx11' 'glib2' 'libxfixes'
    'libcups' 'libxrandr' 'pango' 'nspr' 'python' 'libxcb' 'mesa' 'libxext'
    'libxkbcommon' 'hicolor-icon-theme'
)
makedepends=('npm' 'git' 'python-setuptools')
source=(
    "git+${url}#tag=v$pkgver"
    'openbuildscontrol.desktop'
    'openbuildscontrol'
)
sha512sums=('f966d5ddde4b32ea78ba7a51e5fa81367deadcb9c22b3dd20a9c2c51ad0db432c410b3d50a63733f165aec42c2d2c6fe547fb63163f3a8a9235992134b25ba89'
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
