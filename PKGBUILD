# Maintainer: Pierce Thompson <insprill@gmail.com>

pkgname=bs-manager-git
pkgver=v1.4.0.r43.g7ff0fe5
pkgrel=2
pkgdesc="An all-in-one tool for managing Beat Saber versions, maps, mods, and more"
arch=("x86_64")
url="https://github.com/Zagrios/bs-manager"
license=('GPL')
depends=('libvips' 'dotnet-runtime-6.0')
makedepends=('git' 'nvm' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  'git+https://github.com/Zagrios/bs-manager.git'
  "${pkgname%-git}.desktop"
)
sha256sums=(
  'SKIP'
  'bf6dfa24f649ad4f2f1d0b6326f2ee020bf820fdb69ba7269225df61c4eeb2f4'
)

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"

    command -v nvm >/dev/null && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 20
    nvm use 20
}

build() {
    cd "${pkgname%-git}"

    npm install
    npm run package
}

package() {
    cd "${pkgname%-git}"

    local build_dir="release/build/linux-unpacked"
    local license_dir="$pkgdir/usr/share/licenses/${pkgname%-git}"
    
    install -d "$pkgdir/opt/${pkgname%-git}"
    cp -r "$build_dir/". "$pkgdir/opt/${pkgname%-git}/"

    install -Dm644 "$srcdir/bs-manager.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "resources/readme/SVG/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.svg"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
