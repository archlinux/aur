# Maintainer: Eri the Switch <e2024@opayq.com>

_socialname='discord'
_socialname_proper='Discord'
_componentname="${_socialname}-social"
_pkgname="openttd-${_componentname}"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenTTD's Social Integration Plugin for ${_socialname_proper}"
url='https://www.openttd.org/'
arch=('x86_64')
license=('MIT') # FIXME: there does not appear to be a proper license for Discord Game SDK?
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')
options=(!strip) # Stripping causes signature verification to fail
_archivename() {
    if [[ "${CARCH}" == "x86_64" ]]; then
        printf '%s' "${_componentname}-${pkgver}-linux-generic-amd64"
    fi
}
source=("LICENSE")
source_x86_64=("https://cdn.openttd.org/${_componentname}-releases/${pkgver}/$(_archivename).tar.xz")
sha256sums=('SKIP')
sha256sums_x86_64=('225605a3e343fbf32963f247f5181b255cc9338663e56eb1059ce41b79ba3d12')

package() {
    find "${srcdir}/$(_archivename)" -type f -print0 | while IFS= read -r -d $'\0' file; do
        install -Dm644 "${file}" -t "${pkgdir}/usr/lib/${_pkgname}"
    done
    install -dm755 "${pkgdir}/usr/share/openttd/social_integration"
    ln -s -T "/usr/lib/${_pkgname}" "${pkgdir}/usr/share/openttd/social_integration/${_socialname}"

    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
