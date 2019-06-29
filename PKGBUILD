# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.15.3
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=2
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('electron4')
makedepends=('gulp' 'node-gyp' 'python2' 'yarn')
optdepends=('hunspell-en_US: spell checking')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        rocketchat-desktop
        fix-electron-builder.patch
        fix-gulp-release.patch
        fix-spellchecking.patch
        rocketchat-desktop.desktop)
sha512sums=('58e2d68913ec600aa7323ba008065eaa1f41501a12d4c4d07d526ff722c35024b06bc20bdd93746076bc233368c686ab8f0fa204027001e6d30b792dd7d3ad54'
            '09c770d09973ce0aa2299c9162788d387fc558e95ad0b11596e199a6c67edc5c5258e8ec4bd73c84b494a1d20931fc50c16efc74311930158edd8cf704285351'
            '23f7e0329ff74524076d42b8531cc94aea1b8f45758fafbf3f11cd11b50b1b943d572487217519888c85043d42562b4ef3ba0f99bddbc1f472318132d103ed7f'
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
    yarn upgrade "electron@$(sed 's/^v//' </usr/lib/electron4/version)" --non-interactive --cache-folder "$srcdir/yarn-cache"
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
