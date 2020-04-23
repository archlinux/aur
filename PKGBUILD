# Maintainer: Gabriel Saillard (GitSquared) <gabriel@saillard.dev>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Birks <david@tellus.space>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert

pkgname=marktext
pkgver=0.16.1
pkgrel=4
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability'
arch=('x86_64')
url='https://marktext.app'
license=('MIT')
depends=('electron'
         'libxkbfile'
         'libsecret'
         'ripgrep')
makedepends=('nodejs-lts-erbium'
             'node-gyp'
             'yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marktext/marktext/archive/v${pkgver}.tar.gz"
        "$pkgname.sh")
sha256sums=('a00aa0caf26ab6e24e6cd5fef2a2a03e2ef46d0bf185c6971d9f00207223633e'
            '5716d0879a683d390caf8c90a9b373cc536256821d80498d0f983a1ac0f364ab')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p "$srcdir/node_modules"
    yarn --cache-folder "$srcdir/node_modules" install --frozen-lockfile --ignore-scripts
}

build() {
    cd "$pkgname-$pkgver"
    yarn --cache-folder "$srcdir/node_modules" run rebuild
    yarn --cache-folder "$srcdir/node_modules" run build:bin
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "../$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/resources/" build/linux-unpacked/resources/app.asar
    cp -a build/linux-unpacked/resources/{app.asar.unpacked,hunspell_dictionaries} "$pkgdir/usr/lib/$pkgname/resources/"
    local _rg_path='usr/lib/marktext/resources/app.asar.unpacked/node_modules/vscode-ripgrep/bin/'
    mkdir -p $_rg_path
    ln -sf /usr/bin/rg "$pkgdir/$_rg_path/rg"
    install -Dm755 -t "${pkgdir}/usr/share/applications/" resources/linux/marktext.desktop
    install -Dm755 -t "${pkgdir}/usr/share/metainfo/" resources/linux/marktext.appdata.xml
    install -Dm644 resources/icons/icon.png "${pkgdir}/usr/share/pixmaps/marktext.png"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md CONTRIBUTING.md
    cp -a docs "$pkgdir/usr/share/doc/$pkgname/"
    pushd "resources/icons"
    find -name maktext.png -exec install -Dm644 {} "$pkgdir/usr/share/icons/hicolor/{}" \;
}
