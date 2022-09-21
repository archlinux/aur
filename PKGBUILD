# Maintainer: Cyano Hao <c@cyano.cn>

_electron=electron20
_electronver=$(</usr/lib/$_electron/version)

_pkgname=WowUp
pkgname=${_pkgname,,}-native
_pkgver=2.9.0
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='World of Warcraft addon updater (system Electron)'
arch=('x86_64')

url='https://github.com/WowUp/WowUp'
license=('GPL3')
depends=(
    $_electron
)
makedepends=(
    'nodejs-lts-gallium' # may fail with latest nodejs, use lts
    'npm'
    'asar'
    'imagemagick'
)
source=(
    "$_pkgname-$_pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz"
    bna-client-name.patch
    wago-fix.js
    wowup-native.desktop
    run_wowup-native.sh
)
sha256sums=('86f531caf94a037296e4317ffd996971afe5fdacc2ff8d971b986b93924d1ba1'
            '967bec722d268b7566afb4bbfff298e0e0059b257e070edc58f907f49810c63e'
            '371d0e19917b031911ac5503e01e19170988230fb793f68e42eb15e4d1cfb97c'
            '76ebf12e022e15075a6a3824731a8288acbc6a4e1f69f6bd0fa3591d6f658656'
            '96b62f48ab60f289a375b93eef8ccbd67be818e1043f450da706894b2c958356')

prepare() {
    # set correct electron path in launcher
    sed -i "s|/usr/bin/electron|/usr/bin/$_electron|" run_wowup-native.sh wowup-native.desktop

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
    npm install electron@$_electronver <<<"N"

    # or use miorrors
    # export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
    # npm --registry https://registry.npmmirror.com/ install electron@$_electronver <<<"N"

    npm run build:prod
    ./node_modules/.bin/electron-builder \
        --linux dir \
        -c.nodeGypRebuild=false \
        -c.electronDist=/usr/lib/$_electron \
        -c.electronVersion=$_electronver
}

package() {
    install -DTm755 run_wowup-native.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 wowup-native.desktop -t "$pkgdir/usr/share/applications/"

    _dest="$pkgdir/usr/lib/$pkgname"
    asar e "$srcdir/$_pkgname-$_pkgver/wowup-electron/release/linux-unpacked/resources/app.asar" "$_dest"

    cd "$srcdir/$_pkgname-$_pkgver/wowup-electron/"
    install -Dm644 assets/wowup_logo_512np.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        mkdir -p $target
        convert assets/wowup_logo_512np.png -resize ${size}x${size} "$target/$pkgname.png"
    done
}
