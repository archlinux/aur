# Maintainer: kyngs <aurmail at kyngs dot xyz>
pkgname=miru-git
pkgrel=1
pkgver=4.2.7
pkgdesc="Bittorrent streaming software for cats"
arch=("any")
url="https://github.com/ThaUnknown/miru"
license=("GPL-3.0")
depends=("xdg-utils" "pnpm")
source=(
    "git+${url}"
)
sha256sums=(
    "SKIP"
)
conflicts=("miru-bin")

pkgver() {
  git -C "miru" describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//' | sed 's/v//g'
}

build() {
    cd "miru"
    rm -rf node_modules # In case of an existing src/ dir, keeping old node modules could break things
    pnpm install
    echo "**Webpack takes a long time (even up to ten minutes) to build, while providing no console output. Do not cancel the build unless it takes more than ten minutes.**"
    pnpm run build
}

package() {
    cd "miru/dist"
    debs=(*.deb)
    ar vx "${debs[0]}"

    tar -xJ -f data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/opt/Miru/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
