# Maintainer: Pierce Thompson <pierce at insprill dot net>

pkgname=bs-manager-git
pkgver=v1.5.2.r95.gcaf7989
pkgrel=1
pkgdesc="An all-in-one tool for managing Beat Saber versions, maps, mods, and more"
arch=("x86_64")
url="https://github.com/Zagrios/bs-manager"
license=('GPL')
depends=()
makedepends=('git' 'npm' 'nvm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip') # DepotDownloader breaks without this
source=(
  'git+https://github.com/Zagrios/bs-manager.git'
  "${pkgname%-git}.desktop"
)
sha256sums=(
  'SKIP'
  'cb35ac15f308e0dca35aa2a948f3102eb96ec0c9faa1771b91d5a49309398874'
)

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_ensure_local_nvm() {
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm
    cd "${pkgname%-git}"

    nvm install 22.11.0
}

build() {
    _ensure_local_nvm
    cd "${pkgname%-git}"

    npm install
    npm run build
    npx electron-builder --config electron-builder.config.js --publish never --linux pacman --x64
}

package() {
    cd "${pkgname%-git}"

    install -d "$pkgdir/opt/${pkgname%-git}"
    cp -r "release/build/linux-unpacked/". "$pkgdir/opt/${pkgname%-git}/"

    install -Dm644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "resources/readme/SVG/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.svg"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
