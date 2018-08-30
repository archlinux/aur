# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.13.1
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('nss' 'libxss' 'gconf' 'gtk3' 'glibc')
makedepends=('sed' 'yarn>=0.21.3' 'nodejs>=7.0.0' 'node-gyp' 'python2')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RocketChat/Rocket.Chat.Electron/archive/$pkgver.tar.gz"
        fix-icon-name_use_target_dir.patch
        fix-gulp-release.patch)
sha512sums=('7493c0c71e5e854f5b6385c465277f7dde3b208d4b40a12cf978f4c893d808a4a0134c6dbc1fa8a7958a922a657247582b7d9e5529bd3ad372629247e30fd87a'
            '5fab6bf05f1ee924e2a79cc133908c043d72d119a299c38badeb793bf12f1a328eac98e8ed1afabcf8cd3c06aeea7265421d6350e0094d2c55bf64cc30501a88'
            'e6b1a943d755abf5b4bfbf7602af21d09ff4960d28356834c38b9ba62c583b05a608726442b28c4e79e6eb73c777e6423ed754308f6b70fc8b9bfddf980cba1d')
if [[ $CARCH == "i686" ]]; then
    _releasename="release:linux-ia32"
    _distname="linux-ia32-unpacked"
else
    _releasename="release:linux-x64"
    _distname="linux-unpacked"
fi

prepare() {
    patch -p1 -d "$_srcname" < fix-icon-name_use_target_dir.patch
    patch -p1 -d "$_srcname" < fix-gulp-release.patch
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
