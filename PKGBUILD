# Maintainer: leonekmi <usingarchbtw@leonekmi.fr>
pkgname=karaokemugen
pkgver=8.0.22
pkgrel=1
pkgdesc="Karaoke playlist manager/player app used in parties or events."
arch=('x86_64')
url="https://mugen.karaokes.moe/"
license=('MIT')
groups=()
depends=('mpv' 'ffmpeg' 'postgresql' 'electron' 'patch')
makedepends=('git' 'npm' 'typescript' 'yarn' 'nodejs')
optdepends=('sudo: for using karaokemugen-install script')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=${pkgname}.install
source=("${pkgname}::git+https://gitlab.com/karaokemugen/code/karaokemugen-app.git#tag=8.0.22"
        "${pkgname}-lib::git+https://gitlab.com/karaokemugen/code/lib.git"
        "${pkgname}-guests::git+https://gitlab.com/karaokemugen/medias/guest-avatars.git"
        'install.sh'
        'run.sh'
        'icon256.png'
        'karaokemugen.desktop')
noextract=()
md5sums=('30a3c726ca2d6a9c76373de2377788ea'
         'SKIP'
         'SKIP'
         '2548b70d012d3992526c8d5b1d9bac3d'
         '55557823030b7824a85a55469e119cb4'
         '5e9a33a42fef7572b7e0fa504c586f32'
         'fae5d3e631e9ec8391655b31f586b74b')

prepare() {
    cd "$srcdir/${pkgname}"
    git submodule init
    git config submodule.src/lib.url "$srcdir/${pkgname}-lib"
    git config submodule.assets/guestAvatars.url "$srcdir/${pkgname}-guests"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/${pkgname}"
    # Prepare dependencies
    export HOME="$srcdir/$pkgname-home"
    export XDG_CACHE_HOME="$srcdir/$pkgname-cache"
    export npm_config_devdir="$srcdir/$pkgname-npm-dev"
    export npm_config_cache="$srcdir/$pkgname-npm-cache"
    yarn setup

    # Build and package with electron-builder
    export NODE_ENV='production'
    electronDist=$(dirname $(realpath $(which electron)))
    electronVer=$(electron --version | tail -c +2)

    yarn packer
}

package() {
    cd "$srcdir/${pkgname}"

    # Application itself
    install -dm755 "$pkgdir/usr/lib/${pkgname}"
    cp -dr --no-preserve=ownership packages/linux-unpacked/resources/* "$pkgdir/usr/lib/${pkgname}/"
    install -dm 755 "$pkgdir/usr/lib/${pkgname}/asar"
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
