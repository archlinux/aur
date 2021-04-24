# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ezra-bible-app
pkgver=1.0.0
pkgrel=1
pkgdesc='A user-friendly Bible study tool focussing on topical study based on keywords/tags'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL3')
depends=('electron'
         'icu'
         'nodejs')
replaces=('ezra-project')
makedepends=('jq'
             'moreutils'
             'node-gyp'
             'node-prune'
             'nodejs-addon-api' # run time dep but gets baked into electron asar
             'nodejs-pug-cli'
             'nodejs-sword-interface>=0.222.0' # run time dep but gets baked into electron asar
             'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('b2adcf8ad9f60832b5f773ea138242eee6942162a04a8381d33b8a3d5f477c02'
            'e135a382166ce27cf1348750767e157b2d292d4a189940f0fa874af29bc6540b')

prepare() {
    cd "$pkgname-$pkgver"
    jq 'del(.dependencies["node-addon-api", "node-sword-interface"], .devDependencies["electron", "electron-osx-sign", "node-abi", "node-gyp", "pug-cli", "sequelize-cli"])' package.json |
        sponge package.json
    rm -rf node_modules/{node-addon-api,node-sword-interface}
    npm install --cache "$srcdir/npm-cache" --no-audit --no-fund --ignore-scripts
}

build() {
    cd "$pkgname-$pkgver"
    local _electron="$(electron --version | sed 's/^v//')"
    set -x
    npx electron-rebuild -f --version="$_electron"
    node-prune node_modules
    _ep () {
        npx electron-packager ./ "$pkgname" \
            --electron-version="$_electron" \
            --overwrite \
            --platform=linux \
            --arch=x64 $@
    }
    _ep
    ./build_scripts/purge_build_artifacts.sh
    npm link node-addon-api node-sword-interface
    _ep --asar
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "../$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/resources/" "$pkgname-linux-x64/resources/app.asar"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" {CHANGELOG,README,TECH,LOC_METRICS}.md
    install -Dm644 icons/ezra.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
