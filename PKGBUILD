# Maintainer: Cyano Hao <c@cyano.cn>

_pkgbase=WowUp
pkgbase=${_pkgbase,,}
pkgname=($pkgbase $pkgbase-cf)
_pkgver=2.25.5
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='World of Warcraft addon updater'
arch=('x86_64')

url='https://github.com/WowUp/WowUp'
license=('GPL3')
# no depends
makedepends=(
    'nodejs-lts-krypton' # may fail with latest nodejs, use lts
    'npm'
    'imagemagick'
)
source=(
    "$_pkgbase-$_pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz"
    aur-disable-updater.patch
    aur-use-system-bundle.patch
    wago-fix.js
    wowup.desktop
    wowup-cf.desktop
    run_wowup.sh
    run_wowup-cf.sh
)
sha256sums=('329fd33cc7767ecfce5f43eb5675c2af504221d86a9eca4e41be15dd2334454d'
            '6492656d15dc74254189767f92a3d6d73ee21d2de952ae8586a40330dc0b6ef3'
            '82af0736c372a9fa1d61a6d1f3e67933728b24e6037300c27a4592e7e00c6f85'
            '371d0e19917b031911ac5503e01e19170988230fb793f68e42eb15e4d1cfb97c'
            '5c18235b5c92c98a405335916efce577c8b9b5582b717abb1c49834884fbe1db'
            'f2c63c2b44880db8d6601307bdb965e5b8275c2939ac7812b1043d9ff8bf418a'
            '9a21969b0e9393f25a37a924fcf7c99ff7d671e252db0f99d46072e42ab670b7'
            'fa0140ecc4a05f2eca97de65426d3dc901e84712ddd190e147059f8d6f1acc09')

prepare() {
    cd "$_pkgbase-$_pkgver/"

    # disable built-in updater (package manager handles it)
    patch --forward --strip=1 --input="${srcdir}/aur-disable-updater.patch"

    # disable built-in / self-updated UI bundle selection
    patch --forward --strip=1 --input="${srcdir}/aur-use-system-bundle.patch"

    # intergient.com refuse to provide service to users in some country/region
    # add a workaround that extracts the key manually
    cat "${srcdir}/wago-fix.js" >>wowup-electron/assets/preload/wago.js
}

build() {
    cd "$srcdir/$_pkgbase-$_pkgver/wowup-lib"

    npm install
    npm run build

    cd "$srcdir/$_pkgbase-$_pkgver/wowup-shell"

    npm install

    cd "$srcdir/$_pkgbase-$_pkgver/wowup-electron"

    npm install

    npm run build:prod

    cd "$srcdir/$_pkgbase-$_pkgver/wowup-shell"

    node scripts/prepare-package.js wago
    npm run build
    cp "$srcdir/$_pkgbase-$_pkgver/wowup-electron/app-build/bundle-build.json" \
        "$srcdir/$_pkgbase-$_pkgver/bundle-build-wago.json"
    ./node_modules/.bin/electron-builder \
        --linux dir \
        -c electron-build/electron-builder.json \
        -c.nodeGypRebuild=false

    # cf variant
    cd "$srcdir/$_pkgbase-$_pkgver/wowup-electron"
    npm run ow:build:prod

    cd "$srcdir/$_pkgbase-$_pkgver/wowup-shell"

    node scripts/prepare-package.js ow
    npm run build
    cp "$srcdir/$_pkgbase-$_pkgver/wowup-electron/app-build/bundle-build.json" \
        "$srcdir/$_pkgbase-$_pkgver/bundle-build-ow.json"
    ./node_modules/.bin/ow-electron-builder \
        --linux dir \
        -c electron-build/electron-builder-ow.json \
        -c.nodeGypRebuild=false \
        -c.directories.output="release-cf"
}

package_wowup() {
    install -DTm755 run_wowup.sh "$pkgdir/usr/bin/wowup"
    install -Dm644 wowup.desktop -t "$pkgdir/usr/share/applications/"

    cd "$srcdir/$_pkgbase-$_pkgver/wowup-shell/release/linux-unpacked/"
    mkdir -p "$pkgdir/usr/lib/wowup"
    cp -r -- * "$pkgdir/usr/lib/wowup"
    install -Dm644 "$srcdir/$_pkgbase-$_pkgver/bundle-build-wago.json" \
        "$pkgdir/usr/lib/wowup/resources/bundle-build.json"

    cd "$srcdir/$_pkgbase-$_pkgver/wowup-electron/"
    install -Dm644 assets/wowup_logo_512np.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/wowup.png"
    for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        mkdir -p $target
        convert assets/wowup_logo_512np.png -resize ${size}x${size} "$target/wowup.png"
    done
}

package_wowup-cf() {
    install -DTm755 run_wowup-cf.sh "$pkgdir/usr/bin/wowup-cf"
    install -Dm644 wowup-cf.desktop -t "$pkgdir/usr/share/applications/"

    cd "$srcdir/$_pkgbase-$_pkgver/wowup-shell/release-cf/linux-unpacked/"
    mkdir -p "$pkgdir/usr/lib/wowup-cf"
    cp -r -- * "$pkgdir/usr/lib/wowup-cf"
    install -Dm644 "$srcdir/$_pkgbase-$_pkgver/bundle-build-ow.json" \
        "$pkgdir/usr/lib/wowup-cf/resources/bundle-build.json"

    cd "$srcdir/$_pkgbase-$_pkgver/wowup-electron/"
    install -Dm644 assets/wowup_logo_512np.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/wowup-cf.png"
    for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        mkdir -p $target
        convert assets/wowup_logo_512np.png -resize ${size}x${size} "$target/wowup-cf.png"
    done
}
