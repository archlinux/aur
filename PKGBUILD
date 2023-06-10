# Maintainer: Zaoqi
# Mostly based on hyper PKGBUILD

pkgname=electerm
pkgver=1.25.50
pkgrel=1
pkgdesc="An electron-based SSH/SFTP Connection manager and terminal"
arch=('x86_64' 'aarch64')
url="https://electerm.html5beta.com"
license=('MIT')
depends=('nodejs-lts-gallium' 'nss') # Use Node.JS 16 due to https://github.com/nodejs/node-gyp/issues/2673
makedepends=('electron' 'yarn' 'npm')

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/electerm/electerm/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.desktop"
    "https://raw.githubusercontent.com/electerm/electerm/master/LICENSE"
)

sha256sums=('788590af775834126a24a3cc48ef8b38b80ee3d321c159c4e73d750012e78bbc'
            '0e932e10da6153c37a30eefd211a4af76586fa30b0675da8926e2239dc1eff7b'
            'b6d96207cff171127c04f59f9eb545b575b71cd93ebc355247cad63e23ca500d')

_src_dir="$pkgname-$pkgver"

prepare() {
    cd "$_src_dir"

    npm install
}

build() {
    cd "$_src_dir"

    # add node_modules binaries to PATH
    oldpath="$PATH"
    PATH="$(pwd)/node_modules/.bin:$PATH"

    #export NODE_OPTIONS=--openssl-legacy-provider # Node.JS 17

    npm run pre-test &&
    electron-builder --linux --dir

    PATH="$oldpath"
}

package() {
    cd "$_src_dir"

    _appdir="/usr/lib/$pkgname"
    _libinstall="${pkgdir}${_appdir}"

    mkdir -p "$pkgdir/usr/bin" "$_libinstall"
    cp -R dist/linux-*unpacked/* "$_libinstall" # dist/linux-arm64-unpacked on aarch64, dist/linux-unpacked on amd64

    # link the binary to /usr/bin
    cd "$pkgdir/usr/bin"
    ln -s "../lib/$pkgname/electerm" electerm

    # # TODO: remove included electron libs and use the system ones by symlink
    # cd "$_libinstall"
    # rm libnode.so libffmpeg.so
    # ln -s /usr/share/electron/lib{node,ffmpeg}.so .

    install -Dm644 -t "$pkgdir/usr/share/applications/"      "$srcdir/$pkgname.desktop"
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    install -Dm644 "$srcdir/$_src_dir/node_modules/@electerm/electerm-resource/res/imgs/electerm-round-128x128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
