# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ezra-bible-app-git
pkgver=0.12.1.r25.g7104405
pkgrel=1
pkgdesc='A user-friendly Bible study tool focussing on topical study based on keywords/tags'
arch=('x86_64')
url="https://github.com/${pkgname%-git}/${pkgname%-git}"
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
             'nodejs-sword-interface>=0.222.0' # run time dep but gets baked into electron asar
             'npm')
provides=("${pkgname%-git}" "ezra-project-git")
conflicts=(${provides[@]} "ezra-project-git")
replaces=("ezra-project-git")
source=("git+$url.git"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'e135a382166ce27cf1348750767e157b2d292d4a189940f0fa874af29bc6540b')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    jq 'del(.dependencies["node-addon-api", "node-sword-interface"], .devDependencies["electron", "electron-osx-sign", "node-abi", "node-gyp", "pug-cli", "sequelize-cli"])' package.json |
        sponge package.json
    rm -rf node_modules/{node-addon-api,node-sword-interface}
    npm install --cache "$srcdir/npm-cache" --no-audit --no-fund --ignore-scripts
}

build() {
    cd "${pkgname%-git}"
    local _electron="$(electron --version | sed 's/^v//')"
    npx electron-rebuild -f --version="$_electron"
    node-prune node_modules
    _ep () {
        npx electron-packager ./ "${pkgname%-git}" \
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
    cd "${pkgname%-git}"
    install -Dm755 "../${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/applications/" "${pkgname%-git}.desktop"
    install -Dm644 -t "$pkgdir/usr/lib/${pkgname%-git}/resources/" "${pkgname%-git}-linux-x64/resources/app.asar"
    install -Dm644 -t "$pkgdir/usr/share/licences/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" {CHANGELOG,README,TECH,LOC_METRICS}.md
    install -Dm644 icons/ezra.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
}
