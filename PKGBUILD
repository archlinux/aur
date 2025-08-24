# Maintainer: leonekmi <usingarchbtw@leonekmi.fr>
pkgname=karaokemugen-git
pkgver=5.0.33.r4974.gb5dd0a644
pkgrel=1
pkgdesc="Karaoke playlist manager/player app used in parties or events."
arch=('x86_64')
url="https://mugen.karaokes.moe/"
license=('MIT')
groups=()
depends=('mpv' 'ffmpeg' 'postgresql' 'electron' 'patch')
makedepends=('git' 'npm' 'typescript')
optdepends=('sudo: for using karaokemugen-install script')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=${pkgname%-git}.install
source=("${pkgname%-git}::git+https://gitlab.com/karaokemugen/code/karaokemugen-app.git"
        "${pkgname%-git}-lib::git+https://gitlab.com/karaokemugen/code/lib.git"
        "${pkgname%-git}-guests::git+https://gitlab.com/karaokemugen/medias/guest-avatars.git"
        "${pkgname%-git}-systemRepo::git+https://gitlab.com/karaokemugen/bases/system.git"
        'install.sh'
        'run.sh'
        'icon256.png'
        'karaokemugen.desktop')
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '2548b70d012d3992526c8d5b1d9bac3d'
         '55557823030b7824a85a55469e119cb4'
         '5e9a33a42fef7572b7e0fa504c586f32'
         'fae5d3e631e9ec8391655b31f586b74b')

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
    git config submodule.src/lib.url "$srcdir/${pkgname%-git}-lib"
    git config submodule.assets/guestAvatars.url "$srcdir/${pkgname%-git}-guests"
    git config submodule.assets/systemRepo.url "$srcdir/${pkgname%-git}-systemRepo"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/${pkgname%-git}"
    # Prepare dependencies
    export HOME="$srcdir/$pkgname-home"
    export XDG_CACHE_HOME="$srcdir/$pkgname-cache"
    export COREPACK_HOME="$srcdir/$pkgname-corepack-cache"
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
    cd "$srcdir/${pkgname%-git}"

    # Application itself
    install -dm755 "$pkgdir/usr/lib/${pkgname%-git}"
    cp -dr --no-preserve=ownership packages/linux-unpacked/resources/* "$pkgdir/usr/lib/${pkgname%-git}/"
    install -dm 755 "$pkgdir/usr/lib/${pkgname%-git}/asar"
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
