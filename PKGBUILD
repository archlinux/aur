# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ezra-project-git
pkgver=0.11.1.r93.g93f5777
pkgrel=1
pkgdesc="Bible study software focussing on topical study based on keywords/tags"
arch=('x86_64')
url="https://github.com/tobias-klein/${pkgname%-git}"
license=('GPL3')
depends=('curl'
         'electron'
         'icu'
         'nodejs'
         'python2'
         'sqlite')
makedepends=('cmake' 'gendesk' 'git' 'npm' 'sword')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url.git"
        'ezra-project.sh')
sha256sums=('SKIP'
            '0a36167bce248b6082045163cf60b143d02ca1e447a791cf0c88e960a7fdc618')
_electron="$(electron --version | sed 's/^v//')"

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    npm uninstall --no-audit -D electron
    npm install --no-audit electron@"$_electron"
    gendesk -f -n --pkgname "${pkgname%-git}" --pkgdesc "${pkgname%-git}" --name "Ezra Project"
}

build() {
    cd "${pkgname%-git}"
    npm run compile-pug
    npm run install-node-prune
    "$(npm bin)"/electron-rebuild -f -w node-sword-interface -v "$_electron"
    npm run prune-node-modules
    npm run purge-build-artifacts
    npm run cleanup-gyp-shebang
}

package() {
    cd "${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
    install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
    "$(npm bin)"/electron-packager . "${pkgname%-git}" --overwrite --asar --platform=linux --arch=x64 --prune=true --out=release --electron-version="$_electron"
    rm release/ezra-project-linux-x64/"${pkgname%-git}"
    mkdir -p "$pkgdir/usr/lib/"
    cp -a release/ezra-project-linux-x64 "$pkgdir/usr/lib/${pkgname%-git}"
}
