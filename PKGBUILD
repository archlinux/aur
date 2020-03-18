# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ezra-project-git
pkgver=0.12.0.r1.g59f3168
pkgrel=1
pkgdesc='Bible study tool focussing on topical study based on keywords/tags'
arch=('x86_64')
url="https://github.com/tobias-klein/${pkgname%-git}"
license=('GPL3')
depends=('electron'
         'icu'
         'nodejs')
makedepends=('git'
             'jq'
             'moreutils'
             'node-gyp'
             'node-prune'
             'nodejs-addon-api' # run time dep but gets baked into electron asar
             'nodejs-pug-cli'
             'nodejs-sword-interface>=0.119.0' # run time dep but gets baked into electron asar
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
}

build() {
    cd "${pkgname%-git}"
    rm -f node_modules/{node-addon-api,node-sword-interface}
    local _electron="$(electron --version | sed 's/^v//')"
    npm install --cache "$srcdir/npm-cache" --no-audit --no-fund
    npx electron-rebuild --version="$_electron"
    node-prune node_modules
    npx electron-packager ./ "${pkgname%-git}" --electron-version="$_electron"
    ./build_scripts/purge_build_artifacts.sh
    npm link node-addon-api node-sword-interface
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
    install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" {CHANGELOG,README,TECH,LOC_METRICS}.md
}
