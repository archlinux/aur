# Maintainer: Gabriel Saillard (GitSquared) <gabriel@saillard.dev>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Birks <david@tellus.space>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert

pkgname=marktext
pkgver=0.16.2
pkgrel=2
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability'
arch=('x86_64')
url='https://marktext.app'
license=('MIT')
depends=('electron7'
         'libxkbfile'
         'libsecret'
         'ripgrep')
makedepends=('jq'
             'nodejs-lts-erbium'
             'node-gyp'
             'moreutils'
             'yarn'
             'yq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marktext/marktext/archive/v${pkgver}.tar.gz"
        "$pkgname.sh"
        "$pkgname-arg-handling.patch")
sha256sums=('d39f3d4c3008cacdcefbe6ad9e1e19d803d3c619106878c75f8a5cc38254597c'
            '15a964fcc3f6bd7bf1c03566d35201032aecde994446533cad1f810e9b880f14'
            'c754a1cad52d10a38eeddb9293ce0a4540296c6adbb47eb5311eaaeded150a01')

_electronDist=$(dirname $(realpath $(which electron7)))
_electronVersion=$(electron7 --version | sed -e 's/^v//')

prepare() {
    cd "$pkgname-$pkgver"
    jq 'del(.devDependencies["electron"], .scripts["preinstall", "postinstall"])' \
        package.json | sponge package.json
    yq -y ". + {\"electronDist\": \"$_electronDist\", \"electronVersion\": \"$_electronVersion\"}" \
        electron-builder.yml | sponge electron-builder.yml
    mkdir -p "$srcdir/node_modules"
    yarn --cache-folder "$srcdir/node_modules" install --frozen-lockfile
    yarn --cache-folder "$srcdir/node_modules" add -D -E --no-lockfile --ignore-scripts electron@$_electronVersion
    patch -p1 < "$srcdir/$pkgname-arg-handling.patch"
}

build() {
    cd "$pkgname-$pkgver"
    yarn --cache-folder "$srcdir/node_modules" run electron-rebuild
    node .electron-vue/build.js
    yarn --cache-folder "$srcdir/node_modules" run \
        electron-builder --linux --x64 --dir dist
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "../$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    local _dist=build/linux-unpacked/resources
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$_dist/app.asar"
    cp -a "$_dist"/{app.asar.unpacked,hunspell_dictionaries} "$pkgdir/usr/lib/$pkgname/"
    local _rg_path="$pkgdir/usr/lib/marktext/app.asar.unpacked/node_modules/vscode-ripgrep/bin/"
    mkdir -p $_rg_path
    ln -sf /usr/bin/rg "$_rg_path"
    install -Dm755 -t "${pkgdir}/usr/share/applications/" resources/linux/marktext.desktop
    install -Dm755 -t "${pkgdir}/usr/share/metainfo/" resources/linux/marktext.appdata.xml
    install -Dm644 resources/icons/icon.png "${pkgdir}/usr/share/pixmaps/marktext.png"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md CONTRIBUTING.md
    cp -a docs "$pkgdir/usr/share/doc/$pkgname/"
    pushd "resources/icons"
    find -name maktext.png -exec install -Dm644 {} "$pkgdir/usr/share/icons/hicolor/{}" \;
}
