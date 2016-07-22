# Maintainer: Aaron Abbott <aabmass@gmail.com>
pkgname=hyperterm
pkgver=0.6.0
pkgrel=1
epoch=
pkgdesc="A terminal emulator built with JS/HTML/CSS on electron"
arch=('any')
url="https://hyperterm.org/"
license=('GPL')
groups=()
depends=('nodejs' 'electron')
makedepends=('npm')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/zeit/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('8e298b3a10494d4e9e7ffd82780f0aab')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"

    mkdir -p build
    ./scripts/install.sh
    cd app
    npm install
}

build() {
	cd "$pkgname-$pkgver/app"

    npm run build
}

check() {
	cd "$pkgname-$pkgver"
    npm run lint
    cd app
    npm run lint
}

package() {
	cd "$pkgname-$pkgver"

    _appdir="/usr/lib/$pkgname"
    _libinstall="${pkgdir}${_appdir}"

    VERSION=`node -e 'process.stdout.write(require("./package").version)'`

    cp -r app/assets build/
    cp app/index.html build/
    cp -r app/dist build/
    mkdir -p dist
    ./node_modules/electron-packager/cli.js ./ \
        --platform=linux \
        --arch=x64 \
        --out=dist \
        --app-version="$VERSION" \
        --icon=static/icon.png \
        --prune \
        --ignore=app/

    mkdir -p "$pkgdir/usr/bin" "$_libinstall"
    cp -R dist/HyperTerm-linux-x64/* "$_libinstall"

    # link the binary to /usr/bin
    cd $pkgdir/usr/bin
    ln -s "../lib/$pkgname/HyperTerm" HyperTerm

    # # TODO: remove included electron libs and use the system ones by symlink
    # cd "$_libinstall"
    # rm libnode.so libffmpeg.so
    # ln -s /usr/share/electron/lib{node,ffmpeg}.so .

}
