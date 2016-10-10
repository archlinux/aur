# Maintainer: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk

## will rename by AUR mod
# pkgname=hyper
_pkgname=hyper

pkgname=hyperterm
pkgver=0.8.1
pkgrel=2
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

## will uncomment these when an AUR mod renames this package. I can't push this
## with the new name. Have to have it done manually.
# conflicts=('hyperterm')
# replaces=('hyperterm')
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/zeit/$_pkgname/archive/${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/zeit/art/master/hyper/mark/Hyper-Mark-120%403x.png"
    "Hyper.desktop"
)
noextract=()
md5sums=('bf5575c5bcf8cbedcdf4d7118128c2cd'
         'f3481e14cba331160339b3b5ab78872b'
         '8ccbe8d3e3b6cdc9bc5fd4301d368d5f')
validpgpkeys=()

prepare() {
    cd "$_pkgname-$pkgver"
    npm install
}

build() {
    cd "$_pkgname-$pkgver"
    npm run pack
}

package() {
    cd "$_pkgname-$pkgver"

    _appdir="/usr/lib/$pkgname"
    _libinstall="${pkgdir}${_appdir}"

    mkdir -p "$pkgdir/usr/bin" "$_libinstall"
    cp -R dist/linux-unpacked/* "$_libinstall"

    # link the binary to /usr/bin
    cd $pkgdir/usr/bin
    ln -s "../lib/$pkgname/Hyper" Hyper

    # # TODO: remove included electron libs and use the system ones by symlink
    # cd "$_libinstall"
    # rm libnode.so libffmpeg.so
    # ln -s /usr/share/electron/lib{node,ffmpeg}.so .

    install -Dm644 "$srcdir/Hyper.desktop" "$pkgdir/usr/share/applications/Hyper.desktop"
    install -Dm644 "$srcdir/Hyper-Mark-120%403x.png" "$pkgdir/usr/share/pixmaps/hyper.png"
}
