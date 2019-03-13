# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.15.1
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('electron')
makedepends=('gulp' 'node-gyp' 'python2' 'yarn')
optdepends=('hunspell-en_US: spell checking')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        rocketchat-desktop
        fix-electron-builder.patch
        fix-gulp-release.patch
        fix-spellchecking.patch
        rocketchat-desktop.desktop)
sha512sums=('e81f26a56465d860bfc365bbaee7c204214af6f13a505e9b7935a8c7c0051ff0d5a7a56fa81106e1b56e1e23b161d5663010ec7ab2b789019861394ea2be793b'
            '1f0f7197012421ff42d2936f73e697e35eef8c57fb9fed59ee022f9d170d6496407f89e426526fba8451fe304b3a8de1724d1cd14bd85d781bbf6aa9ca078d7d'
            'f4c16d380156ebe32a226ebe639dc30d7a7fbcdaf1ee89e36eb5b8c736b207e16c3eff90b351d757d85f3612dacefe1cd0100371720d9d58ec229daa3ca654fb'
            'cc3298c9e9d1f45e7f1a7288ffda0ec6c352249a542e9ca96659034b8cc0a366cff373c00799179a06d304f5bc8dce39edc4a0cc0ac403f2a0b51b0152d3986d'
            '030f7088dcff15cfe6f7f16814f800d92a833f2ac53eb373554587b64979f77081013c93dd7559b8198aa8aa2bf871e422c6c86d579936c7378670dac52944e8'
            'd87664b9bdf30eac3011393d094962e0d568a94b5eaf4c8e5f17529442dcba905cea7341527066102a97a07a981acd6ce045b8737eb78a7d81a2a2d05023fe26')
if [[ $CARCH == "i686" ]]; then
    _releasename="release:linux-ia32"
    _distname="linux-ia32-unpacked"
else
    _releasename="release:linux-x64"
    _distname="linux-unpacked"
fi

prepare() {
    for patch in *.patch; do
        patch -p1 -d "$_srcname" < "$patch"
    done
}

build() {
    cd "$_srcname"
    yarn upgrade "electron@$(sed 's/^v//' </usr/lib/electron/version)" --non-interactive --cache-folder "$srcdir/yarn-cache"
    yarn gulp build --env=production "$_releasename"
}

package() {
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    cd "$_srcname"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "dist/$_distname/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
}
