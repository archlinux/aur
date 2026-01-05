# Maintainer: leonekmi <usingarchbtw@leonekmi.fr>
pkgname=karaokemugen
pkgver=9.0.2
pkgrel=3
pkgdesc="Karaoke playlist manager/player app used in parties or events."
arch=('x86_64')
url="https://mugen.karaokes.moe/"
license=('MIT')
groups=()
depends=('mpv' 'ffmpeg' 'postgresql' 'electron39')
makedepends=('git' 'npm' 'typescript' 'corepack')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=${pkgname}.install
source=("${pkgname}::git+https://gitlab.com/karaokemugen/code/karaokemugen-app.git#tag=9.0.2"
        "${pkgname}-lib::git+https://gitlab.com/karaokemugen/code/lib.git"
        "${pkgname}-guests::git+https://gitlab.com/karaokemugen/medias/guest-avatars.git"
        "${pkgname}-systemRepo::git+https://gitlab.com/karaokemugen/bases/system.git"
        'install.sh'
        'run.sh'
        'icon256.png'
        'karaokemugen.desktop')
noextract=()
md5sums=('57459658d3d8d2e6e46f147d3f4a911c'
         'SKIP'
         'SKIP'
         'SKIP'
         '2548b70d012d3992526c8d5b1d9bac3d'
         'd17324cd29097a809b89a5ea93efaf34'
         '5e9a33a42fef7572b7e0fa504c586f32'
         'fae5d3e631e9ec8391655b31f586b74b')

prepare() {
    cd "$srcdir/${pkgname}"
    git submodule init
    git config submodule.src/lib.url "$srcdir/${pkgname}-lib"
    git config submodule.assets/guestAvatars.url "$srcdir/${pkgname}-guests"
    git config submodule.assets/systemRepo.url "$srcdir/${pkgname}-systemRepo"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/${pkgname}"
    # Prepare dependencies
    export HOME="$srcdir/$pkgname-home"
    export COREPACK_HOME="$srcdir/$pkgname-corepack-cache"
    export XDG_CACHE_HOME="$srcdir/$pkgname-cache"
    export npm_config_cache="$srcdir/$pkgname-npm-cache"
    corepack yarn install
    corepack yarn setup

    # Build and package with electron-builder
    export NODE_ENV='production'
    electronDist=$(dirname $(realpath $(which electron)))
    electronVer=$(electron --version | tail -c +2)

    corepack yarn packer
}

package() {
    cd "$srcdir/${pkgname}"

    # Application itself
    install -dm 755 "$pkgdir/usr/lib/${pkgname%-git}"
    cp -dr --no-preserve=ownership packages/linux-unpacked/resources/* "$pkgdir/usr/lib/${pkgname%-git}/"
    chmod -R 755 "$pkgdir/usr/lib/${pkgname%-git}/"

    # License
    install -dm 755 "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -m 644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

    # Runtimes
    install -dm 755 "$pkgdir/usr/bin/"
    install -m 755 "$srcdir/run.sh" "$pkgdir/usr/bin/karaokemugen"
    install -m 755 "$srcdir/install.sh" "$pkgdir/usr/bin/karaokemugen-install"

    # .desktop entry
    install -dm 755 "$pkgdir/usr/share/pixmaps/"
    install -dm 755 "$pkgdir/usr/share/applications/"
    install -m 644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
    install -m 644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
