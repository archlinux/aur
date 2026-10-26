# Maintainer: czyt <czytcn@gmail.com>
pkgname=mygo-cloudmusic-bin
pkgver=0.1.12
pkgrel=2
pkgdesc="MyGo 云音乐 - 第三方网易云音乐原生客户端"
arch=('x86_64' 'aarch64')
url="https://music.egoist.dev"
license=('AGPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1' 'libsecret' 'libsoup3')
provides=('mygo-cloudmusic')
conflicts=('mygo-cloudmusic')
options=('!strip' '!debug')
source_x86_64=("mygo-cloudmusic_${pkgver}_amd64.deb::https://github.com/egoist/mygo-cloudmusic/releases/download/v${pkgver}/mygo-cloudmusic_${pkgver}_amd64.deb")
source_aarch64=("mygo-cloudmusic_${pkgver}_arm64.deb::https://github.com/egoist/mygo-cloudmusic/releases/download/v${pkgver}/mygo-cloudmusic_${pkgver}_arm64.deb")
sha256sums_x86_64=('6058c041e6ebec7b772ae710a1f4f92a9b6ca3a206b6aa4bd6ac01d17169a27a')
sha256sums_aarch64=('1784399a7e1e8a3c3645012134f574b5baff894ff06107aeb2681a6578f8ec01')

package() {
    local _deb_x86_64="mygo-cloudmusic_${pkgver}_amd64.deb"
    local _deb_aarch64="mygo-cloudmusic_${pkgver}_arm64.deb"

    local _deb_var="_deb_${CARCH}"
    local _deb="${!_deb_var}"
    [[ -n "${_deb}" ]] || { echo "unsupported arch: ${CARCH}" >&2; return 1; }

    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" | awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}"

    # Expose the app in PATH (upstream desktop file points at /opt/mygo-cloudmusic/...)
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/mygo-cloudmusic/mygo-cloudmusic "${pkgdir}/usr/bin/mygo-cloudmusic"
}
