# Maintainer: Pierce Thompson <pierce at insprill dot net>

pkgname=bs-manager-git
pkgver=v1.4.13.r20.g5462c88
pkgrel=1
pkgdesc="An all-in-one tool for managing Beat Saber versions, maps, mods, and more"
arch=("x86_64")
url="https://github.com/Zagrios/bs-manager"
license=('GPL')
depends=()
makedepends=('git' 'nodejs>=22')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip') # DepotDownloader gets broken without this
source=(
  'git+https://github.com/Zagrios/bs-manager.git'
  '01-disable-update-checker.patch'
  "${pkgname%-git}.desktop"
)
sha256sums=(
  'SKIP'
  'e680f7ef587e8ca09b51d322fc0e1a613a08cc044c92e1b2a404b18384815a1e'
  'cb35ac15f308e0dca35aa2a948f3102eb96ec0c9faa1771b91d5a49309398874'
)

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    patch -Np1 -i "../01-disable-update-checker.patch"
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

    install -Dm644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "resources/readme/SVG/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.svg"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
