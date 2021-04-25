# Maintainer: leonekmi <usingarchbtw@leonekmi.fr>
pkgname=karaokemugen-git
pkgver=5.0.33.r1.g3c91037ef
pkgrel=2
pkgdesc="Karaoke playlist manager/player app used in parties or events."
arch=('x86_64')
url="https://mugen.karaokes.moe/"
license=('MIT')
groups=()
depends=('mpv' 'ffmpeg' 'postgresql' 'electron11')
makedepends=('git' 'npm' 'typescript' 'yarn' 'nodejs>=12' 'python2')
optdepends=('sudo: for using karaokemugen-install script')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=${pkgname%-git}.install
source=('karaokemugen::git+https://lab.shelter.moe/karaokemugen/karaokemugen-app.git'
        'karaokemugen-lib::git+https://lab.shelter.moe/karaokemugen/lib.git'
	'karaokemugen-avatars::git+https://lab.shelter.moe/karaokemugen/medias/guest-avatars.git'
        'install.sh'
        'run.sh'
        'icon256.png'
        'karaokemugen.desktop')
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'e31ff0dc6707adce89c3221a7c9c3cb6'
         '19475472f2046c57de4b627ac90982df'
         '5e9a33a42fef7572b7e0fa504c586f32'
         '10561eed906a5efeed427f90501b4f49')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    # Git, tags available
    git describe --long --tags | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule init
    git config submodule.src/lib.url $srcdir/${pkgname%-git}-lib
    git config submodule.assets/guestAvatars.url $srcdir/${pkgname%-git}-avatars
    git submodule update
}

build() {
    cd "$srcdir/${pkgname%-git}"

    # Prepare dependencies
    export HOME="$srcdir/$pkgname-home"
    export XDG_CACHE_HOME="$srcdir/$pkgname-cache"
    export npm_config_devdir="$srcdir/$pkgname-npm-dev"
    export npm_config_cache="$srcdir/$pkgname-npm-cache"
    mkdir -p $HOME $XDG_CACHE_HOME $npm_config_devdir $npm_config_cache
    yarn install --ignore-scripts --frozen-scripts
    yarn add --dev electron-builder
    yarn installkmfrontend
    # Build and package with electron-builder
    export NODE_ENV='production'
    electronVer=$(electron --version | tail -c +2)
    yarn build
    yarn buildkmfrontend
    yarn electron-builder --linux --x64 -c.electronDist=/usr/lib/electron11 -c.electronVersion=$electronVer --dir
}

package() {
    cd "$srcdir/${pkgname%-git}"

    # Application itself
    install -dm755 "$pkgdir/usr/lib/${pkgname%-git}"
    cp -dr --no-preserve=ownership packages/linux-unpacked/resources/* "$pkgdir/usr/lib/${pkgname%-git}/"
    chmod -R 755 "$pkgdir/usr/lib/${pkgname%-git}/"

    # License
    install -dm755 "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -m644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

    # Runtimes
    install -dm755 "$pkgdir/usr/bin/"
    install -m755 "$srcdir/run.sh" "$pkgdir/usr/bin/karaokemugen"
    install -m755 "$srcdir/install.sh" "$pkgdir/usr/bin/karaokemugen-install"

    # .desktop entry
    install -dm755 "$pkgdir/usr/share/pixmaps/"
    install -dm755 "$pkgdir/usr/share/applications/"
    install -m644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
    install -m644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
