# Maintainer: aureolebigben <aureolebigben@gmail.com>
# Contributer: fleischie
# Contributer: auk
# Contributer: blind

pkgname=hyper
pkgver=3.1.2
pkgrel=1
epoch=
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
license=('MIT')
groups=()
depends=('gconf')
makedepends=('nodejs' 'electron' 'yarn' 'python2')
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
    "https://github.com/zeit/$pkgname/archive/v${_pkgver_project}.tar.gz"
    "https://raw.githubusercontent.com/zeit/art/master/hyper/mark/Hyper-Mark-120@3x.png"
    "Hyper.desktop"
)
noextract=()
md5sums=('4ffd934e32aa986e4ddced0acca2fcd1'
         'f3481e14cba331160339b3b5ab78872b'
         '74cb7ba38e37332aa8300e4b6ba9c61c')
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
    install -Dm644 "$srcdir/Hyper-Mark-120@3x.png" "$pkgdir/usr/share/pixmaps/hyper.png"
}
