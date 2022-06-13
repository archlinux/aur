# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: aureolebigben <aureolebigben@gmail.com>
# Contributor: fleischie
# Contributor: auk
# Contributor: blind

pkgname=hyper
pkgver=3.2.3
pkgrel=2
epoch=
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
license=('MIT')
groups=()
depends=('gconf')
makedepends=('nodejs' 'electron' 'yarn' 'python2' 'npm')
checkdepends=()
optdepends=()
provides=()

conflicts=('hyperterm')
replaces=('hyperterm')
backup=()
options=()
install=
changelog=

_pkgver_project=${pkgver/\.canary/-canary}

source=(
    "https://github.com/vercel/$pkgname/archive/v${_pkgver_project}.tar.gz"
    "https://github.com/bnb/awesome-hyper/raw/master/hyper-3-color-logo.svg"
    "Hyper.desktop"
)
noextract=()
md5sums=('fb365705e6c0a7142379131af82a4ce8'
         'c770d64996561d98fa41a8d88963a074'
         'e5a0ef01f23708d9bd2d6a7f094095f2')
validpgpkeys=()

prepare() {
    cd "$pkgname-$_pkgver_project"

    # delete husky install from postinstall
    sed -i 's/\ \&\& husky install//g' package.json

    # yarn is a build-dep according to the README
    yarn install
}

build() {
    cd "$pkgname-$_pkgver_project"

    # This build command is the same as the one defined in package.json via
    # npm run dist except that it doesn't build for debian, rpm, etc. and
    # doesn't require some other dependencies

    # add node_modules binaries to PATH
    oldpath=$PATH
    PATH=$(pwd)/node_modules/.bin:$PATH

    yarn run build &&
    cross-env BABEL_ENV=production babel target/renderer/bundle.js \
        --out-file target/renderer/bundle.js \
        --no-comments \
        --minified target/renderer/bundle.js && 
    electron-builder --linux --dir

    PATH=$oldpath
}

package() {
    cd "$pkgname-$_pkgver_project"

    _appdir="/usr/lib/$pkgname"
    _libinstall="${pkgdir}${_appdir}"

    mkdir -p "$pkgdir/usr/bin" "$_libinstall"
    cp -R dist/linux-unpacked/* "$_libinstall"

    # link the binary to /usr/bin
    cd $pkgdir/usr/bin
    ln -s "../lib/$pkgname/hyper" hyper

    # # TODO: remove included electron libs and use the system ones by symlink
    # cd "$_libinstall"
    # rm libnode.so libffmpeg.so
    # ln -s /usr/share/electron/lib{node,ffmpeg}.so .


    install -Dm644 "$srcdir/Hyper.desktop" "$pkgdir/usr/share/applications/Hyper.desktop"
    install -Dm644 "$srcdir/hyper-3-color-logo.svg" "$pkgdir/usr/share/pixmaps/hyper.svg"
}
