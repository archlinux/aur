# Maintainer: Cyano Hao <c@cyano.cn>

_pkgname=WowUp
pkgname=${_pkgname,,}
_pkgver=2.2.2
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
    package-lock.json.xz
)
sha256sums=('ac64565958fbfcbfc983d161dee8cbf5715f90228a2c53379699d683d0b92307'
            'f8e0bbe6c138997f1dc1d9dfb83773cc6a8c4f6af254a73194a8874e078746b9'
            '154da83623df19a3224f9777db0375f386ea1b9c108ba0fe84213be1cef56493'
            '5f9b0e6fb8886d23b2782e947e714e14cf7c9a7ec69ac515b26fd215c6c8f010')

prepare() {
    # set legacy peer deps in .npmrc file to dependency conflict since npm 7
    echo "legacy-peer-deps=true" >>"$_pkgname-$_pkgver/wowup-electron/.npmrc"

    # upgrade `electron-builder` to resolve issue since Node.js 16.0
    sed -i '/"electron-builder":/ { s/22.10.5/22.11.4/ }' $_pkgname-$_pkgver/wowup-electron/package.json
    # and use an updated `package-lock.json`
    cp package-lock.json $_pkgname-$_pkgver/wowup-electron/package-lock.json
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
