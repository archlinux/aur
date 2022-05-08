# Maintainer: Cyano Hao <c@cyano.cn>

_pkgname=WowUp
pkgname=${_pkgname,,}
_pkgver=2.7.1
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='WowUp the World of Warcraft addon updater'
arch=('x86_64')

url='https://github.com/WowUp/WowUp'
license=('GPL3')
# no depends
makedepends=(
    'nodejs-lts-gallium' # may fail with latest nodejs, use lts
    'npm'
    'imagemagick'
)
source=(
    "$_pkgname-$_pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz"
    wowup.desktop
    run_wowup.sh
)
sha256sums=('ef9d9fe2718eb8fc01b5b42c9b7359ded0f89c53983e9768655f1ec0cec82da7'
            '5c18235b5c92c98a405335916efce577c8b9b5582b717abb1c49834884fbe1db'
            '9a21969b0e9393f25a37a924fcf7c99ff7d671e252db0f99d46072e42ab670b7')

prepare() {
    # set legacy peer deps in .npmrc file to dependency conflict since npm 7
    echo "legacy-peer-deps=true" >>"$_pkgname-$_pkgver/wowup-electron/.npmrc"
}

build() {
    cd "$_pkgname-$_pkgver/wowup-electron"

    # Angular may ask for sharing anonymous usage data during `npm install`.
    # Say “no” to it.
    npm install <<<"N"

    # or use miorrors
    # export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
    # npm --registry https://registry.npmmirror.com/ install <<<"N"

    npm run build:prod
    ./node_modules/.bin/electron-builder --linux dir --config.asarUnpack="build/Release/addon.node"
}

package() {
    install -DTm755 run_wowup.sh "$pkgdir/usr/bin/wowup"
    install -Dm644 wowup.desktop -t "$pkgdir/usr/share/applications/"

    cd "$srcdir/$_pkgname-$_pkgver/wowup-electron/release/linux-unpacked/"
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r --no-preserve='ownership' -- * "$pkgdir/usr/lib/$pkgname"

    cd "$srcdir/$_pkgname-$_pkgver/wowup-electron/"
    install -Dm644 assets/wowup_logo_512np.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        mkdir -p $target
        convert assets/wowup_logo_512np.png -resize ${size}x${size} "$target/$pkgname.png"
    done
}
