# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.15.5
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('electron4')
makedepends=('gulp' 'nodejs<12' 'node-gyp' 'python2' 'yarn')
optdepends=('hunspell-en_US: spell checking')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        rocketchat-desktop
        fix-build.patch
        fix-spellchecking.patch
        rocketchat-desktop.desktop)
sha512sums=('9ca27c72a85f6139fe5351e865dc3fb13c95b92772747727d29c3adad2eac1808cb8f7671a28c76699b6ba8a76638baccd80f86d71367ac727e13420085a6d85'
            '09c770d09973ce0aa2299c9162788d387fc558e95ad0b11596e199a6c67edc5c5258e8ec4bd73c84b494a1d20931fc50c16efc74311930158edd8cf704285351'
            'a5ff43fc874ed0fe5afcd0851a7e6c4d4378314a5c82d796e3e124efb81fb7ce4065e0e0f585dc555ddcdcb8f4abab1626676da35bf9962e1db27e20b20f58d7'
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
