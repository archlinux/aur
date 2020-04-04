# Maintainer: leonekmi <usingarchbtw@leonekmi.fr>
pkgname=karaokemugen-git
pkgver=3.2.0.r0.g9ecde13e
pkgrel=1
pkgdesc="Karaoke playlist manager/player app used in parties or events."
arch=('any')
url="https://mugen.karaokes.moe/"
license=('MIT')
groups=()
depends=('mpv' 'ffmpeg' 'postgresql' 'electron')
makedepends=('git' 'npm' 'typescript' 'yarn' 'nodejs>=12')
optdepends=('sudo: for using karaokemugen-install script')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=${pkgname%-git}.install
source=('karaokemugen::git+https://lab.shelter.moe/karaokemugen/karaokemugen-app.git'
        'karaokemugen-lib::git+https://lab.shelter.moe/karaokemugen/lib.git'
        'install.sh'
        'run.sh'
        'database-tweak.diff'
        'database.json'
        'icon256.png'
        'karaokemugen.desktop'
        '10-mugensudo'
        'payload.sh')
noextract=()
md5sums=('SKIP'
         'SKIP'
         '7640e20425422b5cd146acbb51110ea6'
         '7f27a04c232e38ad6e070e742b0a2dda'
         'c1807f76ea2d800999910fe66e56fe73'
         '0f887855e641ec949ce7c6b69d79ad1e'
         '5e9a33a42fef7572b7e0fa504c586f32'
         '10561eed906a5efeed427f90501b4f49'
         '7304bcf403613a276dba896ba2d2a918'
         '6a0c5042def68d0eaffc2cc87cd11462')

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
    git submodule update
    patch --forward -p1 -i '../database-tweak.diff'
}

build() {
    cd "$srcdir/${pkgname%-git}"

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
    cd "$srcdir/${pkgname%-git}"

    # Application itself
    install -dm775 "$pkgdir/opt/${pkgname%-git}"
    cp -r --no-preserve=ownership,mode packages/linux-unpacked/* "$pkgdir/opt/${pkgname%-git}/"
    install -dm775 "$pkgdir/opt/${pkgname%-git}/app"
    touch "$pkgdir/opt/${pkgname%-git}/portable"
    chmod -R 775 "$pkgdir/opt/${pkgname%-git}/"

    # Symlinks for configuration
    install -dm775 "$pkgdir/etc/${pkgname%-git}"
    cp "config.sample.yml" "$pkgdir/opt/${pkgname%-git}/app/config.sample.yml"
    cp "$srcdir/database.json" "$pkgdir/opt/${pkgname%-git}/app/database.json"
    ln -s "$pkgdir/opt/${pkgname%-git}/app/database.json" "$pkgdir/etc/${pkgname%-git}/database.json"
    ln -s "$pkgdir/opt/${pkgname%-git}/app/config.yml" "$pkgdir/etc/${pkgname%-git}/config.yml"

    # License
    install -dm755 "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -m644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

    # sudo rule
    install -dm750 "$pkgdir/etc/sudoers.d"
    install -m440 "$srcdir/10-mugensudo" "$pkgdir/etc/sudoers.d/10-mugensudo"

    # Runtimes
    install -dm755 "$pkgdir/usr/bin/"
    install -m755 "$srcdir/run.sh" "$pkgdir/usr/bin/karaokemugen"
    install -m755 "$srcdir/install.sh" "$pkgdir/usr/bin/karaokemugen-install"
    install -m755 "$srcdir/payload.sh" "$pkgdir/opt/karaokemugen/exec.sh"

    # .desktop entry
    install -dm755 "$pkgdir/usr/share/pixmaps/"
    install -dm755 "$pkgdir/usr/share/applications/"
    install -m644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
    install -m644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}