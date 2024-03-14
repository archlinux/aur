# Maintainer: 7Ji <pugokushin at gmail dot com>
# Maintainer: leaeasy <leaeasy at gmail dot com>
# Contributor: devome <evinedeng at hotmail dot com>

_pkgname=wechat-universal
pkgname=${_pkgname}-bwrap
pkgver=1.0.0.238
pkgrel=4
pkgdesc="WeChat (Universal) with bwrap sandbox"
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com"
license=('proprietary')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=('wechat-beta'{,-bwrap})
depends=(
    'alsa-lib'
    'at-spi2-core'
    'bash'
    'bubblewrap'
    'flatpak-xdg-utils'
    'libxcomposite'
    'libxkbcommon-x11'
    'libxrandr'
    'lsb-release'
    'mesa'
    'nss'
    'openssl-1.1'
    'pango'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'xdg-desktop-portal'
    'xdg-user-dirs'
)
options=(!strip !debug emptydirs)
source=(
    "fake_dde-file-manager"
    "license.tar.gz"
    "${_pkgname}.sh"
    "${_pkgname}.desktop"
)

_deb_url_common="https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_${pkgver}"
_deb_stem="${_pkgname}_${pkgver}"

source_x86_64=(
    "${_deb_stem}_x86_64.deb::${_deb_url_common}_amd64.deb"
)

source_aarch64=(
    "${_deb_stem}_aarch64.deb::${_deb_url_common}_arm64.deb"
)

source_loong64=(
    "${_deb_stem}_loong64.deb::${_deb_url_common}_loongarch64.deb"
)

noextract=("${_deb_stem}"_{x86_64,aarch64,loong64}.deb)

sha256sums=(
    'fcfa289c30685d9adb5d051f2d9e9883a4940655f2ce38c2db6241b78228a1d5'
    '53760079c1a5b58f2fa3d5effe1ed35239590b288841d812229ef4e55b2dbd69'
    'ec2494d2cce2bd05d47136329bdb2b9173d9951480c6ef16baf791dd8d0edbf4'
    'b783b7b0035efb5a0fcb4ddba6446f645a4911e4a9f71475e408a5c87ef04c30'
)

sha256sums_x86_64=(
    '371026679dba25a033023b4077dc527059d906ec03ea2db05f6fc012ab40c96b'
)
sha256sums_aarch64=(
    'debbba2b20585e2b80959b96872cafb500966ce261198ce47abdc54b4efcf111'
)
sha256sums_loong64=(
    '8ae25e2cc283eaff09f222b0dfe73238337b3d942b2e98bda74fff9a4234ba31'
)

package() {
    echo 'Popupating pkgdir with data from wechat-universal deb file...'
    bsdtar -xOf "${_deb_stem}_${CARCH}.deb" ./data.tar.xz |
        xz -cdT0 |
        bsdtar -xpC "${pkgdir}" ./opt/apps/com.tencent.wechat
    mv "${pkgdir}"/opt/{apps/com.tencent.wechat/files,"${_pkgname}"}

    echo 'Installing icons...'
    for res in 16 32 48 64 128 256; do
        install -Dm644 \
            "${pkgdir}/opt/apps/com.tencent.wechat/entries/icons/hicolor/${res}x${res}/apps/com.tencent.wechat.png" \
            "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}.png"
    done
    rm -rf "${pkgdir}"/opt/apps

    echo 'Fixing licenses...'
    local _wechat_root="${pkgdir}/usr/share/${_pkgname}"
    install -dm755 {"${pkgdir}","${_wechat_root}"}/usr/lib/license
    mv "${pkgdir}/opt/${_pkgname}/libuosdevicea.so" "${_wechat_root}"/usr/lib/license/
    cp -ra license/etc "${_wechat_root}"
    cp -ra license/var "${_wechat_root}"

    echo 'Installing fake deepin file manager...'
    install -Dm755 {fake_,"${_wechat_root}"/usr/bin/}dde-file-manager

    echo 'Installing desktop files...'
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
