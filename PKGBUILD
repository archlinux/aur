# Maintainer: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk

pkgname=hyper
pkgver=1.3.2
pkgrel=1
epoch=
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
license=('MIT')
groups=()
depends=('nodejs' 'electron' 'gconf')
makedepends=('npm' 'yarn' 'python2')
checkdepends=()
optdepends=()
provides=()

conflicts=('hyperterm')
replaces=('hyperterm')
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/zeit/$pkgname/archive/${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/zeit/art/master/hyper/mark/Hyper-Mark-120@3x.png"
    "Hyper.desktop"
)
noextract=()
md5sums=('385c0d909f82f492aeaa158a0164e9ef'
         'f3481e14cba331160339b3b5ab78872b'
         '74cb7ba38e37332aa8300e4b6ba9c61c')
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"

    # yarn is a build-dep according to the README
    yarn install
}

build() {
    cd "$pkgname-$pkgver"

    # node modules path => "nmp"
    nmp="./node_modules/.bin"

    # This build command is the same as the one defined in package.json via
    # npm run dist except that it doesn't build for debian, rpm, etc.
    npm run build &&
    $nmp/cross-env BABEL_ENV=production babel \
        --out-file app/dist/bundle.js \
        --no-comments \
        --minified app/dist/bundle.js &&
    $nmp/build --linux --dir
}

package() {
    cd "$pkgname-$pkgver"

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
