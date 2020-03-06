# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ezra-project-git
pkgver=0.11.1.r93.g93f5777
pkgrel=4
pkgdesc='Bible study software focussing on topical study based on keywords/tags'
arch=('x86_64')
url="https://github.com/tobias-klein/${pkgname%-git}"
license=('GPL3')
depends=('electron'
         'icu'
         'nodejs'
         'nodejs-addon-api'
         'nodejs-sword-interface')
makedepends=('gendesk'
             'git'
             'jq'
             'moreutils'
             'node-gyp'
             'node-prune'
             'nodejs-pug-cli'
             'npm')
provides=("${pkgname%-git}")
conflicts=(${provides[@]})
source=("git+$url.git"
        'ezra-project.sh')
sha256sums=('SKIP'
            '0a36167bce248b6082045163cf60b143d02ca1e447a791cf0c88e960a7fdc618')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    jq 'del(.dependencies["node-addon-api", "node-sword-interface"], .devDependencies["electron", "electron-osx-sign", "node-abi", "node-gyp", "pug-cli", "sequelize-cli"])' package.json |
        sponge package.json
    gendesk -f -n --pkgname "${pkgname%-git}" --pkgdesc "${pkgname%-git}" --name "Ezra Project"
}

build() {
    cd "${pkgname%-git}"
    local _electron="$(electron --version | sed 's/^v//')"
    npm install --cache "$srcdir/npm-cache" --no-audit --no-fund
    npx electron-rebuild --version="$_electron"
    node-prune node_modules
    npx electron-packager ./ ${pkgname%-git} --electron-version="$_electron"
    ./build_scripts/purge_build_artifacts.sh
    npx electron-packager ./ "${pkgname%-git}" \
        --electron-version="$_electron" \
        --overwrite \
        --asar \
        --platform=linux \
        --arch=x64
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 "../${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/applications/" "${pkgname%-git}.desktop"
    install -Dm644 -t "$pkgdir/usr/lib/${pkgname%-git}/resources/" "${pkgname%-git}-linux-x64/resources/app.asar"
    install -Dm644 -t "$pkgdir/usr/share/licences/${pkgname%-git}/" LICENSE
}
