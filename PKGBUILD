# Maintainer: czyt <czytcn@gmail.com>
pkgname=dbine-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="DBine - desktop manager for 130+ SQL and NoSQL databases with notebooks, schema compare and AI assistant"
arch=('x86_64')
url="https://dbine.com"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
provides=('dbine')
conflicts=('dbine')
options=('!strip' '!debug')
source_x86_64=("DBine_${pkgver}_amd64.deb::https://github.com/addlayer-io/dbine/releases/download/v${pkgver}/DBine_${pkgver}_amd64.deb")
sha256sums_x86_64=('6f164eab5a3146a01ed69a0535a8e6d6ebee41445278109d819a5f72097bcfe5')

package() {
    local _deb="DBine_${pkgver}_amd64.deb"

    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" | awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
