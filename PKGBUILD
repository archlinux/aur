# Maintainer: Cyano Hao <c@cyano.cn>

_electron=electron43

_pkgname=WowUp
pkgname=${_pkgname,,}-native
_pkgver=2.25.5
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
    'nodejs-lts-krypton' # may fail with latest nodejs, use lts
    'npm'
    'imagemagick'
)
source=(
    "$_pkgname-$_pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz"
    aur-disable-updater.patch
    aur-use-system-bundle.patch
    wago-fix.js
    wowup-native.desktop
    run_wowup-native.sh
)
sha256sums=('329fd33cc7767ecfce5f43eb5675c2af504221d86a9eca4e41be15dd2334454d'
            '6492656d15dc74254189767f92a3d6d73ee21d2de952ae8586a40330dc0b6ef3'
            '750fa6ea170aa408845fb20b775e9088a3c007d86d8f1d87c06c241fa2e7b950'
            '371d0e19917b031911ac5503e01e19170988230fb793f68e42eb15e4d1cfb97c'
            '76ebf12e022e15075a6a3824731a8288acbc6a4e1f69f6bd0fa3591d6f658656'
            '96b62f48ab60f289a375b93eef8ccbd67be818e1043f450da706894b2c958356')

prepare() {
    # set correct electron path in launcher
    sed -i "s|/usr/bin/electron|/usr/bin/$_electron|" run_wowup-native.sh wowup-native.desktop

    cd "$_pkgname-$_pkgver/"

    # overwolf is impossible with system electron
    sed -i -E '/^\s*"@overwolf\// d' wowup-electron/package.json wowup-shell/package.json

    # disable built-in updater (package manager handles it)
    patch --forward --strip=1 --input="${srcdir}/aur-disable-updater.patch"

    # disable built-in / self-updated UI bundle selection
    patch --forward --strip=1 --input="${srcdir}/aur-use-system-bundle.patch"

    # intergient.com refuse to provide service to users in some country/region
    # add a workaround that extracts the key manually
    cat "${srcdir}/wago-fix.js" >>wowup-electron/assets/preload/wago.js
}

build() {
    cd "$srcdir/$_pkgname-$_pkgver/wowup-lib"

    npm install
    npm run build

    cd "$srcdir/$_pkgname-$_pkgver/wowup-shell"

    npm install

    cd "$srcdir/$_pkgname-$_pkgver/wowup-electron"

    npm install
    npm run build:prod
}

package() {
    install -DTm755 run_wowup-native.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 wowup-native.desktop -t "$pkgdir/usr/share/applications/"

    _dest="$pkgdir/usr/lib/$pkgname"

    cd "$srcdir/$_pkgname-$_pkgver/wowup-shell"
    npm prune --omit=dev
    install -Dm644 package.json "$_dest/package.json"
    cp -a dist build "$_dest/"
    cp -a node_modules "$_dest/node_modules"

    cd "$srcdir/$_pkgname-$_pkgver/wowup-electron"
    cp -a app-build/packed/bundle "$_dest/bundle"
    install -Dm644 app-build/bundle-build.json "$_dest/bundle-build.json"

    install -Dm644 assets/wowup_logo_512np.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        mkdir -p $target
        convert assets/wowup_logo_512np.png -resize ${size}x${size} "$target/$pkgname.png"
    done
}
