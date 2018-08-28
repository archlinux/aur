# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.13.0
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=3
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
sha512sums=('cb7eb28ecf9cb2f2cac6ce8cf81d6b2eb94e7dd7d68eebb5ac00e3c04c481569d1b5c7bff4f3640708ae70a8d632f6e4eb2d8378d929b485f9326c6735f5f01f'
            '5fab6bf05f1ee924e2a79cc133908c043d72d119a299c38badeb793bf12f1a328eac98e8ed1afabcf8cd3c06aeea7265421d6350e0094d2c55bf64cc30501a88'
            '4494d43f2ff3eef3c6d188cd147ec04fe6894ae7518aee3a5a4d5e23e081402051e7d1a2bdfd1da35e9c3336b3b8d5d3d4a25ab9bb96ed75b7d54a180d954d56')
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
