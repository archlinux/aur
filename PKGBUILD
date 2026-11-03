# Maintainer: czyt <czytcn@gmail.com>
pkgname=uniclipboard-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Real-time clipboard sync across macOS, Windows and Linux — local-first, peer-to-peer, and end-to-end encrypted"
arch=('x86_64' 'aarch64')
url="https://www.uniclipboard.app"
license=('AGPL-3.0')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('uniclipboard')
conflicts=('uniclipboard')
options=('!strip' '!debug')
source_x86_64=("uniclipboard_${pkgver}_amd64.deb::https://github.com/UniClipboard/UniClipboard/releases/download/v${pkgver}/UniClipboard_${pkgver}_amd64.deb")
source_aarch64=("uniclipboard_${pkgver}_arm64.deb::https://github.com/UniClipboard/UniClipboard/releases/download/v${pkgver}/UniClipboard_${pkgver}_arm64.deb")
sha256sums_x86_64=('637f9690cf508dee41b2d6580d5289f45c250b94afa1d66757f7ac4d4f95f578')
sha256sums_aarch64=('f2277534379212329cffd83adca09a7a49738c631734e90015f887188bf7719a')

package() {
    local _debfile
    if [[ "$CARCH" == "x86_64" ]]; then
        _debfile="uniclipboard_${pkgver}_amd64.deb"
    else
        _debfile="uniclipboard_${pkgver}_arm64.deb"
    fi

    # Upstream changed the data member compression over time
    # (1.1.0 data.tar.gz, 1.2.0 data.tar.xz, 1.5.0 data.tar.zst),
    # so detect it instead of hard-coding one format.
    local _data_member
    _data_member=$(ar t "${srcdir}/${_debfile}" | awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || {
        echo "deb has no supported data archive: ${srcdir}/${_debfile}" >&2
        ar t "${srcdir}/${_debfile}" >&2
        return 1
    }

    ar p "${srcdir}/${_debfile}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
