# Maintainer: Pierce Thompson <pierce at insprill dot net>

pkgname=bs-manager-git
pkgver=v1.4.10.r5.g83f23c5
pkgrel=1
pkgdesc="An all-in-one tool for managing Beat Saber versions, maps, mods, and more"
arch=("x86_64")
url="https://github.com/Zagrios/bs-manager"
license=('GPL')
depends=('dotnet-runtime-3.1' 'screen')
makedepends=('git' 'nodejs>=18')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
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

build() {
    cd "${pkgname%-git}"

    npm install
    npm run package
}

package() {
    cd "${pkgname%-git}"

    install -d "$pkgdir/opt/${pkgname%-git}"
    cp -r "release/build/linux-unpacked/". "$pkgdir/opt/${pkgname%-git}/"

    install -Dm644 "$srcdir/bs-manager.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "resources/readme/SVG/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.svg"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
