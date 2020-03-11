# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.17.8
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
#depends=('electron')
makedepends=('nodejs-lts-erbium' 'node-gyp' 'python' 'yarn')
optdepends=('hunspell-en_US: spell checking')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        rocketchat-desktop
        rocketchat-desktop.desktop
        no-multiarch-build.patch
        use-system-dictionaries.patch
        linux-target-dir.patch)
sha512sums=('5deba5b26eed89890e84f67896d24fa76c57ad5a44695352678838ecd6ab1bc48482b772e625cea2ac75057a7c0761346b56bafaf759e267e488406fb03a68d2'
            '1f0f7197012421ff42d2936f73e697e35eef8c57fb9fed59ee022f9d170d6496407f89e426526fba8451fe304b3a8de1724d1cd14bd85d781bbf6aa9ca078d7d'
            'd87664b9bdf30eac3011393d094962e0d568a94b5eaf4c8e5f17529442dcba905cea7341527066102a97a07a981acd6ce045b8737eb78a7d81a2a2d05023fe26'
            '0fdce645784b9b0ccbe203ecc61f10840514e79748dc10adc98924e34682ce8d8f024aeb03fed318f915ed52cd2abf97da3cae21f4bf45354e08194638a7e34e'
            '88361c770163c4c1d692128a4c8848d2f9700382394dbbe1391b2d0c22268dee1be850d391eece22ee51d9c119971337884dfd7a4c58c29e384b652592c4df9b'
            '07a54cc257a1d231b42339f9f1389ad7948e621e11d695498fb6e04f4f1aa07972faf6b34e83aaca94515252c7645d16d7f7da9e59c3d836426222c9e2c2c1fd')
if [[ $CARCH == "i686" ]]; then
    _releasename="release:linux-ia32"
    _distname="linux-ia32-unpacked"
else
    _releasename="release:linux-x64"
    _distname="linux-unpacked"
fi

prepare() {
    for patch in no-multiarch-build.patch use-system-dictionaries.patch linux-target-dir.patch; do
        patch -N -p1 -d "$_srcname" -i "$srcdir/$patch"
    done

    cd "$_srcname"
    yarn install --non-interactive
    #yarn upgrade "electron@$(sed '/^v/ d' /usr/lib/electron/version)" --non-interactive
}

build() {
    cd "$_srcname"
    NODE_ENV=production yarn gulp build
    NODE_ENV=production yarn gulp "$_releasename"
}

package() {
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    #install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    cd "$_srcname"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    rm -r dist/linux-unpacked/resources/{dictionaries,build}
    mkdir -m755 "$pkgdir"/{opt,usr/bin}
    cp -a "dist/linux-unpacked" "$pkgdir/opt/rocketchat-desktop"
    ln -s /opt/rocketchat-desktop/rocketchat-desktop "$pkgdir/usr/bin/rocketchat-desktop"
    #install -Dm644 "dist/$_distname/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
}
