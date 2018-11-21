# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.14.4
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('nss' 'libxss' 'gconf' 'gtk3' 'glibc')
makedepends=('nodejs' 'node-gyp' 'python2' 'yarn')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RocketChat/Rocket.Chat.Electron/archive/$pkgver.tar.gz"
        fix-linux-target.patch
        fix-gulp-release.patch
        rocketchat-desktop.desktop)
sha512sums=('12ec5b11d10865068ce6ed1ae4ea9a16c2a68f25c186e2dc8a3b8c3bddd0b44899a5edb9283992c9bcc839c0732f7a3b2f681b3f2ccd78885f614e7464da722b'
            '31e0b1d7d9a5fefa4ad4d186df2b3eb8849d7dee9dd3fa14fff6741006ef31191575a23ba62a86f53cf9fc692d138db6a380e2ad860077bc3d854c5a9083b716'
            '796a2a56a1facc2519d65955bb39d78733c13b5993c4b03cd2af11b83aa9c6132c0fbf9e7160146c6c87bc91cb04c4e66932fe891449d031c787284b5ce9d72a'
            'd87664b9bdf30eac3011393d094962e0d568a94b5eaf4c8e5f17529442dcba905cea7341527066102a97a07a981acd6ce045b8737eb78a7d81a2a2d05023fe26')
if [[ $CARCH == "i686" ]]; then
    _releasename="release:linux-ia32"
    _distname="linux-ia32-unpacked"
else
    _releasename="release:linux-x64"
    _distname="linux-unpacked"
fi

prepare() {
    patch -p1 -d "$_srcname" < fix-linux-target.patch
    patch -p1 -d "$_srcname" < fix-gulp-release.patch
}

build() {
    cd "$srcdir/$_srcname"
    yarn install --non-interactive --pure-lockfile --cache-folder "$srcdir/yarn-cache"
    yarn build --env=production "$_releasename"
}

package() {
    install -d "$pkgdir"/{usr/bin,opt}
    install -Dm644 "$srcdir/$_srcname/build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -r "$srcdir/$_srcname/dist/$_distname" "$pkgdir/opt/$pkgname"
    ln -sf "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
