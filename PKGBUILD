# Maintainer: czyt <czytcn@gmail.com>
pkgname=uniclipboard-bin
pkgver=1.5.0
pkgrel=3
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
sha256sums_x86_64=('6f0858b2703767c14829f76f6efafe53243518812aa3b5ceeecb6936f37df291')
sha256sums_aarch64=('0888b642fbb694dbb8bb0827f2af2555ba8fa41116221899dc1f74186f3e78ee')

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
