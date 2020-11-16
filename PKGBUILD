# PKGBUILD

# Maintainer: Max Ulidtko <ulidtko@gmail.com>
pkgname=owasp-threat-dragon
pkgver=v1.2
pkgrel=3
pkgdesc="Electron Threat Modelling and diagramming tool by Mike Goodwin @ OWASP"
arch=('any')
url="https://threatdragon.org"
license=('Apache-2.0')
groups=()
depends=('electron5')
optdepends=('hunspell-en_US: spell checking')
makedepends=('git' 'npm' 'jq')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/mike-goodwin/${pkgname}-desktop/#tag=${pkgver}"
        threat-dragon
        threat-dragon.desktop
        relax-coverage-thresholds.patch
       )
sha256sums=('SKIP'
            '822d2385b2e781d105396ca2dea44990b65cbe2919b6c6afde67522be1ffcaab'
            'ff6ea4a92aa33fe163e0618f89f334cbe8fee87e474baf769d2e921bc218b350'
            '90e4d6d754d2cecc70cec11375e692ffd5e27cc310f269967dcb5c1df1f015e1')

pkgver() {
    cd "$srcdir/${pkgname}"
    git describe --tags
}

prepare() {
    cd "$srcdir/${pkgname}"
    patch -p1 -i "$srcdir/relax-coverage-thresholds.patch"
}

prune_absolute_paths() {
    # somehow, sshpk package hardcodes absolute paths into its package.json
    for module in sshpk; do
        local target="node_modules/${module}/package.json"
        jq 'del(.man)' "$target" >tmp.json
        mv tmp.json "$target"
    done
}

build() {
    cd "$srcdir/${pkgname}"
    npm install --no-audit --no-progress --no-fund
    npm install --no-audit --no-progress --no-fund \
        electron@"$(</usr/lib/electron5/version)"
    prune_absolute_paths
    npm run-script pretest
    npm run-script build-content
    npx electron-builder build --linux --dir \
        --config electron-builder.json \
        -c.electronDist=/usr/lib/electron5 \
        -c.electronVersion="$(</usr/lib/electron5/version)"
}

check() {
    cd "$srcdir/${pkgname}"
    npm test
    rm -rf coverage
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "threat-dragon"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "threat-dragon.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}"/LICENSE.txt

    cd "${pkgname}"
    install -Dm644 "installers/linux-unpacked/resources/app.asar" "${pkgdir}/usr/share/${pkgname}.asar"

    cd content/icons/png
    for res in *x*.png; do
        install -Dm644 "$res" \
            "$pkgdir/usr/share/icons/hicolor/${res%.png}/apps/$pkgname.png"
    done
}
