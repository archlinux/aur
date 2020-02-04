# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.17.5
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('electron')
makedepends=('gulp' 'nodejs' 'node-gyp' 'python' 'yarn')
optdepends=('hunspell-en_US: spell checking')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        rocketchat-desktop
        rocketchat-desktop.desktop
        fix-build.patch
        use-system-dictionaries.patch)
sha512sums=('9f081256ab86830dd34623744d209229454c8fcd1bab7bda62b68c874a3a1d957ea516b1be5ac3648a644b9da2f74d9478667aa567fb4035c25616da30ab0c7a'
            '1f0f7197012421ff42d2936f73e697e35eef8c57fb9fed59ee022f9d170d6496407f89e426526fba8451fe304b3a8de1724d1cd14bd85d781bbf6aa9ca078d7d'
            'd87664b9bdf30eac3011393d094962e0d568a94b5eaf4c8e5f17529442dcba905cea7341527066102a97a07a981acd6ce045b8737eb78a7d81a2a2d05023fe26'
            'f614b29f3fb330e870edd51a3f1b9ca05c72c2c937a5a4d23797947751d55f8ac8db217f8edbe277e721c1a07f5bc84fd0be7a4903a7d991f7a9eb9625f34ce9'
            '514209aed08ac089b864baea02f3447d707cb2848cd39a86aad2e197dfe38016887d956babb02938a6d7908c6cdca52ac17641e61b130f59358b7d60b3610a1f')
if [[ $CARCH == "i686" ]]; then
    _releasename="release:linux-ia32"
    _distname="linux-ia32-unpacked"
else
    _releasename="release:linux-x64"
    _distname="linux-unpacked"
fi

prepare() {
    for patch in fix-build.patch use-system-dictionaries.patch; do
        patch -N -p1 -d "$_srcname" -i "$srcdir/$patch"
    done

    cd "$_srcname"
    yarn upgrade "electron@$(sed '/^v/ d' /usr/lib/electron/version)" --non-interactive --cache-folder "$srcdir/yarn-cache"
}

build() {
    cd "$_srcname"
    NODE_ENV=production yarn --cache-folder="$srcdir/yarn-cache" gulp build "$_releasename"
}

package() {
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    cd "$_srcname"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "dist/$_distname/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
}
