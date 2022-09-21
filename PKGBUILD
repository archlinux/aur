# Maintainer: Cyano Hao <c@cyano.cn>

_pkgname=WowUp
pkgname=${_pkgname,,}
_pkgver=2.9.0
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='World of Warcraft addon updater'
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
    bna-client-name.patch
    wago-fix.js
    wowup.desktop
    run_wowup.sh
)
sha256sums=('86f531caf94a037296e4317ffd996971afe5fdacc2ff8d971b986b93924d1ba1'
            '967bec722d268b7566afb4bbfff298e0e0059b257e070edc58f907f49810c63e'
            '371d0e19917b031911ac5503e01e19170988230fb793f68e42eb15e4d1cfb97c'
            '5c18235b5c92c98a405335916efce577c8b9b5582b717abb1c49834884fbe1db'
            '9a21969b0e9393f25a37a924fcf7c99ff7d671e252db0f99d46072e42ab670b7')

prepare() {
    cd "$_pkgname-$_pkgver/"

    # set legacy peer deps in .npmrc file to dependency conflict since npm 7
    echo "legacy-peer-deps=true" >>wowup-electron/.npmrc

    # client names follow Battle.Net app
    patch --forward --strip=1 --input="${srcdir}/bna-client-name.patch"

    # intergient.com refuse to provide service to users in some country/region
    # add a workaround that extracts the key manually
    cat "${srcdir}/wago-fix.js" >>wowup-electron/assets/preload/wago.js
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
    ./node_modules/.bin/electron-builder \
        --linux dir \
        -c.nodeGypRebuild=false \
        -c.linux.asarUnpack="build/Release/addon.node"
}

package() {
    install -DTm755 run_wowup.sh "$pkgdir/usr/bin/wowup"
    install -Dm644 wowup.desktop -t "$pkgdir/usr/share/applications/"

    cd "$srcdir/$_pkgname-$_pkgver/wowup-electron/release/linux-unpacked/"
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r -- * "$pkgdir/usr/lib/$pkgname"

    cd "$srcdir/$_pkgname-$_pkgver/wowup-electron/"
    install -Dm644 assets/wowup_logo_512np.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        mkdir -p $target
        convert assets/wowup_logo_512np.png -resize ${size}x${size} "$target/$pkgname.png"
    done
}
