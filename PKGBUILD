# Maintainer: Pierce Thompson <pierce at insprill dot net>

pkgname=bs-manager-git
pkgver=v1.6.0.r2.g0319826
pkgrel=1
pkgdesc="An all-in-one tool for managing Beat Saber versions, maps, mods, and more"
arch=("x86_64")
url="https://github.com/Zagrios/bs-manager"
license=('GPL')
depends=()
makedepends=('git' 'pnpm' 'corepack' 'libxcrypt-compat')
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

_prepare_corepack() {
    local corepack_home="${srcdir}/.corepack"
    export COREPACK_HOME="${srcdir}/.corepack-cache"

    mkdir -p "$corepack_home"
    corepack enable --install-directory "$corepack_home"

    export PATH="$corepack_home:$PATH"
}

prepare() {
    _prepare_corepack
    cd "${srcdir}/${pkgname%-git}"

    corepack install
}

build() {
    _prepare_corepack
    cd "${pkgname%-git}"

    corepack pnpm install --frozen-lockfile
    corepack pnpm run build
    corepack pnpm exec electron-builder --config electron-builder.config.js --publish never --linux pacman --x64
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
