# Maintainer: Denis Klester <dinisoft@gmail.com>
_pkgname=rtl8723bu
pkgname=${_pkgname}-dkms-git
pkgver=r2.73d35b2
pkgrel=1
pkgdesc="Driver for RTL8723BU DKMS version"
url="https://github.com/dini/${_pkgname}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=('any')
license=('GPL')
install=${pkgname}.install
depends=('dkms' 'linux-headers')
makedepends=('git' 'pahole')
source=("${_pkgname}::git+${url}.git"
	"blacklist-${_pkgname}.conf"
	'dkms.conf')
sha256sums=('SKIP'
            'dc6a9bfc6a796461da2219accc7a6ae755ea13253737630e1538f3d98aa7aff5'
            '9c5dca33a2e4531ecb892b7a57feb93a2f2d5936dea81d3f879ad5831976f6b2')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    rm -r ".git"{,ignore}
    rm -f "rtl8723BU_WiFi_linux_v4.3.6.11_12942.20141204_BTCOEX20140507-4E40.tar.gz"
    rm -f "rtl8723BU_WiFi_linux_v4.3.9.3_13200.20150106_BTCOEX20140929-5443.tar.gz"
}

package() {
    cd "${srcdir}"
    local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    # Copy dkms.conf
    install -Dm644 dkms.conf "${install_dir}/dkms.conf"
    #blacklist rtl8723bu
    install -Dm644 blacklist-${_pkgname}.conf "${pkgdir}"/etc/modprobe.d/blacklist-${_pkgname}.conf
    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgname}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${install_dir}/dkms.conf"
    cd "${srcdir}/${_pkgname}"
    for d in $(find . -type d); do
        install -dm755 "${install_dir}/$d"
    done
    for f in $(find . -type f); do
        install -m644 "$f" "${install_dir}/$f"
    done
    sed -i 's/EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE/#EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE/g' ${install_dir}/Makefile
}
