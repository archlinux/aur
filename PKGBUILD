# Maintainer: czyt <czytcn@gmail.com>
pkgname=pluely-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Privacy-first AI assistant for meetings, interviews, and conversations"
arch=('x86_64')
url="https://github.com/iamsrikanthnani/pluely"
license=('GPL-3.0')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('pluely')
conflicts=('pluely')

source_x86_64=(
    "Pluely_${pkgver}_amd64.deb::https://github.com/iamsrikanthnani/pluely/releases/download/app-v${pkgver}/Pluely_${pkgver}_amd64.deb"
)
sha256sums_x86_64=('838fe0cab5b00071d19abc7a4a14290d23f8f205888154839e0c0adcb062d02a')

package() {
    local _deb="${srcdir}/Pluely_${pkgver}_amd64.deb"
    local _data_member

    _data_member=$(ar t "${_deb}" | awk '/^data\.tar\./ { print; exit }')
    [[ -n "${_data_member}" ]] || {
        echo "Could not find a data archive in ${_deb}" >&2
        return 1
    }

    ar p "${_deb}" "${_data_member}" | bsdtar --no-same-owner -xf - -C "${pkgdir}"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
