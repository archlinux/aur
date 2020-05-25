# Maintainer: leonekmi <usingarchbtw@leonekmi.fr>
pkgname=karaokemugen
pkgver=3.2.2
pkgrel=1
pkgdesc="Karaoke playlist manager/player app used in parties or events."
arch=('any')
url="https://mugen.karaokes.moe/"
license=('MIT')
groups=()
depends=('mpv' 'ffmpeg' 'postgresql' 'electron') # Warning : to be replaced with electron8 when Electron 9 will be pushed to [community]
makedepends=('git' 'npm' 'typescript' 'yarn' 'nodejs>=12' 'python2')
optdepends=('sudo: for using karaokemugen-install script')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=${pkgname%-git}.install
source=('karaokemugen::git+https://lab.shelter.moe/karaokemugen/karaokemugen-app.git#tag=v3.2.2'
        'karaokemugen-lib::git+https://lab.shelter.moe/karaokemugen/lib.git'
        'install.sh'
        'run.sh'
        'icon256.png'
        'karaokemugen.desktop')
noextract=()
md5sums=('SKIP'
         'SKIP'
         '4ad5390b139dc5b5e78e6eef8411e90b'
         '0d0d432f35c56a962f9d386f391c6036'
         '5e9a33a42fef7572b7e0fa504c586f32'
         '10561eed906a5efeed427f90501b4f49')

prepare() {
    cd "$srcdir/${pkgname}"
    git submodule init
    git config submodule.src/lib.url $srcdir/${pkgname}-lib
    git submodule update
}

build() {
    cd "$srcdir/${pkgname}"

    # Prepare dependencies
    export HOME="$srcdir/$pkgname-home"
    export XDG_CACHE_HOME="$srcdir/$pkgname-cache"
    export npm_config_devdir="$srcdir/$pkgname-npm-dev"
    export npm_config_cache="$srcdir/$pkgname-npm-cache"
    yarn global add electron-builder
    yarn install
    yarn installFrontend
    yarn installSystemPanel
    # Build and package with electron-builder
    export NODE_ENV='production'
    electronDist=$(dirname $(realpath $(which electron)))
    electronVer=$(electron --version | tail -c +2)
    yarn build
    yarn buildFrontend
    yarn buildSystemPanel
    "$(yarn global dir)/node_modules/.bin/electron-builder" --linux --x64 -c.electronDist=$electronDist -c.electronVersion=$electronVer --dir
}

package() {
    cd "$srcdir/${pkgname}"

    # Application itself
    install -dm755 "$pkgdir/usr/lib/${pkgname}"
    cp -dr --no-preserve=ownership packages/linux-unpacked/resources/* "$pkgdir/usr/lib/${pkgname}/"
    install -dm 755 "$pkgdir/usr/lib/${pkgname}/asar"
    mv "$pkgdir/usr/lib/${pkgname}/app.asar" "$pkgdir/usr/lib/${pkgname}/asar"
    chmod -R 755 "$pkgdir/usr/lib/${pkgname}/"

    # License
    install -dm755 "$pkgdir/usr/share/licenses/${pkgname}"
    install -m644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    # Runtimes
    install -dm755 "$pkgdir/usr/bin/"
    install -m755 "$srcdir/run.sh" "$pkgdir/usr/bin/karaokemugen"
    install -m755 "$srcdir/install.sh" "$pkgdir/usr/bin/karaokemugen-install"

    # .desktop entry
    install -dm755 "$pkgdir/usr/share/pixmaps/"
    install -dm755 "$pkgdir/usr/share/applications/"
    install -m644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
    install -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}