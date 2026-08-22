# Based on the file created by the Manjaro Team:
# Maintainer: Philip Müller <philm[AT]manjaro[DOT]org>
# Contributor: Helmut Stult <helmut[AT]manjaro[DOT]org>
# Contributor: Steven Seifried <gitlab@canox.net>

# Maintainer: sukanka <su975853527 [AT] gmail [DOT] com>

pkgname=tuxedo-control-center
pkgver=3.0.9
pkgrel=1
pkgdesc="A tool to control performance, energy, fan and comfort settings on TUXEDO laptops. (With system-wide electron) "
arch=(x86_64)
url="https://github.com/tuxedocomputers/tuxedo-control-center"
license=('GPL3')
_electron='electron42'
depends=(
    # 'tuxedo-drivers-dkms'
    ${_electron}
    python
    libxcrypt-compat
)
makedepends=('npm' 'git'
    'openssh'
    jq
    moreutils
    'nodejs'
)
options=('!strip' '!debug')
install=${pkgname}.install

source=(
    ${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
    tuxedo-control-center.install
    tuxedo-control-center.sh
)
sha256sums=('ba15d2d1f991f1b4ff88d18883b7f0e8f8961ea8d68f3c9f3d72234488f40cf2'
    'fef8f708ff4ba19921f167ff9bffd2536cc0c128dfe418a30f7e5e0d04fca6e3'
    '54f6686fe8d5f69a39605de996e659f7ce2852db3a05d7ea769dcc4a0b26b0e0')
sha512sums=('5c354f80867ac9f368560864760fc4b57f7da5e61097f9650fb9b23f145a10b320e8859c1443b6f0105f179f58f71c3672e973b76cf8660e7877355d17410ef2'
    'b70d3412f07c72d6de2cf18e75a184741d8f5db7f144c4d8e8c0dde752e197d831fc8f8b6c095c9b6387ff97b36567f9cf5167dbb23ebc392f7b3cc47a78111a'
    '9411bc1b45f1096654b6c415d92f279c82a31d1f84368fc1bed19160e93fc39a6a049af8d9bb3429abc250b7a2d09b6849cbfb106734758a5dbbd170cfd90bcd')

_patch() {
    cd "${srcdir}/${pkgname}-${pkgver}"/src/dist-data
    sed -i tccd.service \
        -e "s|^ExecStart.*|ExecStart=/usr/lib/$pkgname/data/service/tccd  --start|g" \
        -e "s|^ExecStop.*|ExecStop=/usr/lib/$pkgname/data/service/tccd  --stop|g"
    sed -i tuxedo-control-center-tray.desktop \
        -e "s|^Exec=.*|Exec=$pkgname --tray|g"
    sed -i tuxedo-control-center.desktop \
        -e "s|^Exec=.*|Exec=$pkgname %U|g" \
        -e "s|^Icon=.*|Icon=$pkgname|g"
    sed -i "${srcdir}/${pkgname}-${pkgver}"/src/udev/99-webcam.rules \
        -e "s|/opt/tuxedo-control-center/resources/dist/|/usr/lib/|g"
}
prepare() {
    sed -i "s|__ELECTRON__|${_electron}|g" "${pkgname}.sh"
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/${_electron}"
    local electronVersion="$(<$electronDist/version)"

    jq ".devDependencies.electron = \"$electronVersion\"" package.json |
        jq ".build.electronDist = \"$electronDist\"" |
        jq ".build.electronVersion = \"$electronVersion\"" |
        sponge package.json

    (
        _patch
    )
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export NODE_OPTIONS=--openssl-legacy-provider
    export NPM_CONFIG_ALLOW_GIT=all
    npm install
    npm run pack-prod
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"/src/dist-data
    install -Dm644 tuxedo-control-center{,-tray}.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 tuxedo-control-center_256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 tuxedo-control-center_256.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    install -Dm644 com.tuxedocomputers.{tccd,tomte}.policy -t "${pkgdir}/usr/share/polkit-1/actions"
    install -Dm644 com.tuxedocomputers.tcc.metainfo.xml -t "${pkgdir}/usr/share/metainfo"

    install -Dm644 "com.tuxedocomputers.tccd.conf" -t "${pkgdir}/usr/share/dbus-1/system.d"
    install -Dm644 tccd{,-sleep}.service -t "${pkgdir}/usr/lib/systemd/system"

    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -r dist/packages/linux-unpacked/resources "${pkgdir}/usr/lib/${pkgname}"
    mv "${pkgdir}/usr/lib/${pkgname}"/dist/${pkgname}/data "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "src/udev/99-webcam.rules" -t "${pkgdir}/usr/lib/udev/rules.d"

    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
