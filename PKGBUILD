# Maintainer: heyeuuu <2829004293@qq.com>
pkgname=scclient-bin
pkgver=1.33.12
pkgrel=1
pkgdesc="Prebuilt Linux desktop bundle for scclient"
arch=('x86_64')
url="https://dl.pbb.dexi009.com/apps/sc/linux.zip"
license=('custom:unknown')
depends=('gtk3' 'libsecret' 'libayatana-appindicator' 'webkit2gtk-4.1' 'hicolor-icon-theme')
optdepends=('xdg-utils: open external links from the application')
provides=("scclient=${pkgver}")
conflicts=('scclient')
options=('!strip' '!debug')
noextract=('linux.zip')
_upstream_archive='linux.zip'
_upstream_tarball="scclient_${pkgver}_linux_universal_amd64.tar.gz"
source=(
    "${_upstream_archive}::${url}"
    "net.scclient.app.desktop"
)
sha256sums=(
    '6e1506e6d4ec383c64e8c4517f8f876b1d9966c455a9ad07c2fc16b158196af1'
    '396e5a1c0779d36f94dec79918d135a639b1893b5451a801e5a1c4f52bea7282'
)

package() {
    cd "${srcdir}"
    local unpackdir

    unpackdir="$(mktemp -d)"
    bsdtar -xf "${_upstream_archive}" -C "${unpackdir}"
    bsdtar -xf "${unpackdir}/${_upstream_tarball}" -C "${unpackdir}"

    install -dm755 "${pkgdir}/opt/scclient"
    cp -a --no-preserve=ownership "${unpackdir}/bundle/." "${pkgdir}/opt/scclient/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s ../../opt/scclient/scclient "${pkgdir}/usr/bin/scclient"

    install -Dm644 net.scclient.app.desktop \
        "${pkgdir}/usr/share/applications/net.scclient.app.desktop"

    install -Dm644 "${unpackdir}/bundle/data/flutter_assets/assets/images/icon/app_icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/scclient.png"
    ln -s scclient.png \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/net.scclient.app.png"
}
