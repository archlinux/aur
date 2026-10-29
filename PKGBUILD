# Maintainer: czyt <czytcn@gmail.com>
pkgname=open-idea-bin
pkgver=0.1.25
pkgrel=1
pkgdesc="An open-source IDE inspired by IntelliJ IDEA, rebuilt in Rust"
arch=('x86_64')
url="https://github.com/l0ng-ai/openidea"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
provides=('openidea' 'open-idea')
conflicts=('openidea' 'open-idea')
options=('!strip' '!debug')
source_x86_64=("OpenIDEA_${pkgver}_amd64.deb::https://github.com/l0ng-ai/openidea/releases/download/v${pkgver}/OpenIDEA_${pkgver}_amd64.deb")
sha256sums_x86_64=('9feef88f15524dcde6e5d33d488a9e0c3910ef71b775f3fc8964fc4882890f77')

package() {
    local _deb="OpenIDEA_${pkgver}_amd64.deb"

    # Dynamically select the data archive member in case deb compression changes
    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" | awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
