# Maintainer: Cyano Hao <c@cyano.cn>

_pkgname=WowUp
pkgname=${_pkgname,,}
_pkgver=2.2.0
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='WowUp the World of Warcraft addon updater'
arch=('x86_64')

url='https://github.com/WowUp/WowUp'
license=('GPL3')
# no depends
makedepends=('imagemagick' 'nodejs' 'npm')
source=(
    "$_pkgname-$_pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz"
    wowup.desktop
    run_wowup.sh
)
sha256sums=('ed02b0dbad3c26467c76c9c7128f253b059a51579319f0f97c999f087c44fbc6'
            'f8e0bbe6c138997f1dc1d9dfb83773cc6a8c4f6af254a73194a8874e078746b9'
            '154da83623df19a3224f9777db0375f386ea1b9c108ba0fe84213be1cef56493')

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
    # export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"
    # npm --registry https://registry.npm.taobao.org install <<<"N"

    npm run build:prod
    ./node_modules/.bin/electron-builder --linux dir
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
