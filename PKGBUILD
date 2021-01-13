# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=chrysalis
pkgdesc='Graphical configurator for Kaleidoscope-powered keyboards'
pkgver=0.8.0
pkgrel=1
arch=('x86_64')
url="https://github.com/keyboardio/${pkgname^}"
license=('GPL3')
depends=('electron' 'fuse2' 'uucp')
makedepends=('jq' 'moreutils' 'node-gyp' 'yarn')
source=("$url/archive/$pkgname-$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('3dd0ef6345bdec10d4945c5c3a1765c2ee9916191a4ff08b6ef357db22c1aae8'
            'a578aefca029bc10910db0cfd9d6f2711d589525a4a794e056780e67bf4ef02f')

prepare() {
    local _electronVersion=$(electron --version | sed -e 's/^v//')
    cd "${pkgname^}-$pkgname-$pkgver"
    sed -i -e '/plugin:prettier/d' .eslintrc.js
    jq 'del(.devDependencies["electron"])' package.json | sponge package.json
    yarn --cache-folder "$srcdir/node_modules" install --frozen-lockfile --ignore-scripts
    yarn --cache-folder "$srcdir/node_modules" add -D --no-lockfile --ignore-scripts electron@$_electronVersion
    # Work around outdated node-usb, see https://github.com/tessel/node-usb/pull/394
    sed -i 's/c++0x/c++14/' node_modules/usb/binding.gyp
}

build() {
    cd "${pkgname^}-$pkgname-$pkgver"
    yarn --cache-folder "$srcdir/node_modules" run build:linux
}

package() {
    cd "${pkgname^}-$pkgname-$pkgver"
    install -Dm755 "../$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    local _dist=dist/linux-unpacked/resources
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$_dist/app.asar"
    cp -a "$_dist/static" "$pkgdir/usr/lib/$pkgname"
}
