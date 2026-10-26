# Maintainer: czyt <czytcn@gmail.com>
pkgname=mygo-cloudmusic-bin
pkgver=0.1.13
pkgrel=1
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
sha256sums_x86_64=('65646749283cddaf6b8e49a6da290351dd3659c9ffae292c84ff746c41e11d6b')
sha256sums_aarch64=('be2beca306b7f4f6c04772b3ddf946db71c53733a35797fe7a39be7d88e3c51e')

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
