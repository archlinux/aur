# Maintainer: éclairevoyant
# Contributor: Constantine Fedotov <zenflak@gmail.com>
# Contributor: aureolebigben <aureolebigben@gmail.com>
# Contributor: fleischie
# Contributor: auk
# Contributor: blind

pkgname=hyper
pkgver=3.3.0
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is/"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'libxss' 'nodejs' 'nss')
makedepends=('electron' 'yarn' 'npm')
conflicts=('hyperterm')
replaces=('hyperterm')
backup=()
changelog=

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/vercel/$pkgname/archive/v$pkgver.tar.gz"
    "$pkgname.desktop"
)
sha256sums=('01bd48fb3d8035782c36f409c997e21a1adbdedc8a56e03367683765d1b532a6'
            'bcdfdc24e3af1df76fc5fadb195ef914eec060bb49bcad33fd5a74836c19ad20')

_hyper_src_dir="$pkgname-$pkgver"

prepare() {
    cd "$_hyper_src_dir"

    # delete husky install from postinstall
    sed -i 's/\ \&\& husky install//g' package.json

    yarn install
}

build() {
    cd "$_hyper_src_dir"

    # This build command is the same as the one defined in package.json via
    # npm run dist except that it doesn't build for debian, rpm, etc. and
    # doesn't require some other dependencies

    # add node_modules binaries to PATH
    oldpath="$PATH"
    PATH="$(pwd)/node_modules/.bin:$PATH"

    yarn run build &&
    cross-env BABEL_ENV=production babel target/renderer/bundle.js \
        --out-file target/renderer/bundle.js \
        --no-comments \
        --minified target/renderer/bundle.js && 
    electron-builder --linux --dir

    PATH="$oldpath"
}

package() {
    cd "$_hyper_src_dir"

    _appdir="/usr/lib/$pkgname"
    _libinstall="${pkgdir}${_appdir}"

    mkdir -p "$pkgdir/usr/bin" "$_libinstall"
    cp -R dist/linux-unpacked/* "$_libinstall"

    # link the binary to /usr/bin
    cd "$pkgdir/usr/bin"
    ln -s "../lib/$pkgname/hyper" hyper

    # # TODO: remove included electron libs and use the system ones by symlink
    # cd "$_libinstall"
    # rm libnode.so libffmpeg.so
    # ln -s /usr/share/electron/lib{node,ffmpeg}.so .

    install -Dm644 -t "$pkgdir/usr/share/applications/"      "$srcdir/$pkgname.desktop"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$_hyper_src_dir/LICENSE"

    install -Dm644 "$srcdir/$_hyper_src_dir/app/static/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
