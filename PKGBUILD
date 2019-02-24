# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.15.0
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('electron')
makedepends=('nodejs' 'node-gyp' 'python2' 'yarn')
optdepends=('hunspell-en_US: spell checking')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RocketChat/Rocket.Chat.Electron/archive/$pkgver.tar.gz"
        rocketchat-desktop
        fix-linux-target.patch
        fix-gulp-release.patch
        fix-dictionaries.patch
        rocketchat-desktop.desktop)
sha512sums=('91e342d7a50108894cc7fab6c362eaed32ee6bf47e5930622a319679e6904cdd84d86117f8799a0582b6ee4dd89e34133c988e1bd835c423d36f7afa94fe464e'
            '1f0f7197012421ff42d2936f73e697e35eef8c57fb9fed59ee022f9d170d6496407f89e426526fba8451fe304b3a8de1724d1cd14bd85d781bbf6aa9ca078d7d'
            '31e0b1d7d9a5fefa4ad4d186df2b3eb8849d7dee9dd3fa14fff6741006ef31191575a23ba62a86f53cf9fc692d138db6a380e2ad860077bc3d854c5a9083b716'
            'f8b32ae188366a1cfb7bdb7b1859f545dbf583a7ab3b2d793500688c85aae27b3df1ec926dd91795e47669535fa68ed762fdf0600384304ced16f6370dc0a67c'
            '60bd46cc0a708f83462f076b09e6afa9eb1caabcaf54f171d224e7059871dc960dbe6be8246a4b7eec889af7230a3534c3ba78e0b1be2b0705f00eb36550452b'
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
    #yarn install --non-interactive --pure-lockfile --cache-folder "$srcdir/yarn-cache"
    yarn upgrade electron@^3.1.4 --non-interactive --cache-folder "$srcdir/yarn-cache"
    yarn build --env=production "$_releasename"
}

package() {
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    cd "$_srcname"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "dist/$_distname/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
}
