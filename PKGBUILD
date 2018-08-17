# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.12.1
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=3
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('nss' 'libxss' 'gconf' 'gtk3' 'glibc')
makedepends=('sed' 'yarn>=0.21.3' 'nodejs>=7.0.0' 'node-gyp' 'python2')
conflicts=('rocketchat-client-bin')
source=(fix-icon-name_use_target_dir.patch
        "$pkgname-$pkgver.tar.gz::https://github.com/RocketChat/Rocket.Chat.Electron/archive/$pkgver.tar.gz")
sha512sums=('a56502c1c5604326ef98363caefb6f353375df18260aee731462caa120b49fa2334797eca9915e4d57839f194a3c2274d492734bf63576ebc4f59ebb564db309'
            '12c94d53d04748fd7876b6ffd2552d62ae10acdc07b49b928b0587b3421a9557f922d3595b3c431dc1cae44a5d5d2ab91e4ded8f3c2b5807d6598d428191d244')
if [[ $CARCH == "i686" ]]; then
    _releasename="release:linux-ia32"
    _distname="linux-ia32-unpacked"
else
    _releasename="release:linux-x64"
    _distname="linux-unpacked"
fi

prepare() {
    # NOTE(matthias.lisin): "tar.gz" was re-added in a newer commit:
    # https://github.com/RocketChat/Rocket.Chat.Electron/commit/5c8cb8b61b1f2f4f7221533ae6b003ace3df9b4a
    # Adjust the patch on next update!
    patch -p1 -d "$_srcname"  < fix-icon-name_use_target_dir.patch
}

build() {
    cd "$srcdir/$_srcname"
    yarn install --non-interactive --pure-lockfile --cache-folder "$srcdir/yarn-cache"
    yarn build --env=production "$_releasename"
}

package() {
    install -d "$pkgdir"/{usr/bin,opt}
    install -Dm644 "$srcdir/$_srcname/snap/gui/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "$srcdir/$_srcname/snap/gui/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -r "$srcdir/$_srcname/dist/$_distname" "$pkgdir/opt/$pkgname"
    ln -sf /opt/$pkgname/rocketchat "$pkgdir/usr/bin/$pkgname"
}
