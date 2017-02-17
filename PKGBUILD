# Maintainer: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk

pkgname=hyper
pkgver=1.2.1
pkgrel=1
epoch=
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
license=('MIT')
groups=()
depends=('nodejs' 'electron')
makedepends=('npm' 'python2')
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
md5sums=('fa6caecbd1e8d561ac4c79fbd3a44360'
         'f3481e14cba331160339b3b5ab78872b'
         '74cb7ba38e37332aa8300e4b6ba9c61c')
validpgpkeys=()

## This function uses yarn if it installed, otherwise npm as the default.
npm_or_yarn() {
    if hash yarn 2>/dev/null; then
        yarn "$@"
    else
        npm "$@"
    fi
}

prepare() {
    cd "$pkgname-$pkgver"

    # # calls yarn if available, else npm
    # npm_or_yarn install

    # for now use just npm since errors have been reported
    npm install

    # Also hacky but need to explicitly install webpack at the correct version
    # or the app won't run. See https://github.com/zeit/hyper/issues/1418.
    # Hopefully this can be removed asap
    #npm install webpack@2.2.0-rc.3
}

build() {
    cd "$pkgname-$pkgver"

    npm run build

    # this is hacky, but otherwise the package.json dist rule tries to build
    # for debian, rpm, etc.
    ./node_modules/.bin/build --linux dir
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
