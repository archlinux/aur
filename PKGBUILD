# Maintainer: kyngs <aurmail at kyngs dot xyz>
pkgname=miru-kyngs-git
pkgrel=1
pkgver=1.3.0
pkgdesc="A fork of Miru which aims to improve the Linux experience (e.g. disabling the auto-updater) and to improve privacy"
arch=("any")
url="https://github.com/kyngs/miru"
license=("GPL-3.0")
depends=("xdg-utils" "pnpm")
source=(
    "git+${url}"
)
sha256sums=(
    "SKIP"
)

pkgver() {
  git -C "miru" describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//' | sed 's/v//g'
}

build() {
    cd "miru/electron"
    rm -rf node_modules # In case of an existing src/ dir, keeping old node modules could break things
    pnpm install --frozen-lockfile
    echo "**Webpack takes a long time (even up to ten minutes) to build, while providing no console output. Do not cancel the build unless it takes more than ten minutes.**"
    pnpm run build
}

package() {
    cd "miru/electron/dist"
    debs=(*.deb)
    ar vx "${debs[0]}"

    tar -xJ -f data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/opt/miru-kyngs/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
