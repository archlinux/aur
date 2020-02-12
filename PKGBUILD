# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.17.7
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
sha512sums=('49514e0cce8e19f2dee6bfc44777065ae5d557d1cb4c3034988d5e1b13dd6a6b3e444eaec4d52ea647b7d04cbd7b1422eb31b0b8113d2f98ec32c7d5b62ad142'
            '1f0f7197012421ff42d2936f73e697e35eef8c57fb9fed59ee022f9d170d6496407f89e426526fba8451fe304b3a8de1724d1cd14bd85d781bbf6aa9ca078d7d'
            'd87664b9bdf30eac3011393d094962e0d568a94b5eaf4c8e5f17529442dcba905cea7341527066102a97a07a981acd6ce045b8737eb78a7d81a2a2d05023fe26'
            'ae924a722734962432c795f051dc35771c0347b655845fcb614c3424674e23aca071708ae0b84b19794b6f532af7a409ca078ff0f60db0ee88a8bcb09f78c1ab'
            '88361c770163c4c1d692128a4c8848d2f9700382394dbbe1391b2d0c22268dee1be850d391eece22ee51d9c119971337884dfd7a4c58c29e384b652592c4df9b')
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
    NODE_ENV=production yarn --cache-folder="$srcdir/yarn-cache" gulp build
    NODE_ENV=production yarn --cache-folder="$srcdir/yarn-cache" gulp "$_releasename"
}

package() {
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    cd "$_srcname"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "dist/$_distname/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
}
