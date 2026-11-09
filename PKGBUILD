# Maintainer: czyt <czytcn@gmail.com>

pkgname=thesio-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A local-first workspace for academic research and writing"
arch=('x86_64' 'aarch64')
url="https://github.com/cheetahbyte/thesio"
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'shared-mime-info'
    'webkit2gtk-4.1'
)
provides=('thesio')
conflicts=('thesio')
options=('!strip' '!debug')

_deb_x86_64="thesio_${pkgver}_amd64.deb"
_deb_aarch64="thesio_${pkgver}_arm64.deb"
_license="thesio-LICENSE::https://raw.githubusercontent.com/cheetahbyte/thesio/v${pkgver}/LICENSE"
source_x86_64=(
    "${_deb_x86_64}::https://github.com/cheetahbyte/thesio/releases/download/v${pkgver}/${_deb_x86_64}"
    "${_license}"
)
source_aarch64=(
    "${_deb_aarch64}::https://github.com/cheetahbyte/thesio/releases/download/v${pkgver}/${_deb_aarch64}"
    "${_license}"
)
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums_x86_64=('19e5a0daed91fc64c8bbce673c2c8f1c4c7a5f6faa666e3e6ed48dc771905e5d'
                   '5d875c8c75ce183223bae9d431cbc4869186c25e15ffce08996f47bc15e8209f')
sha256sums_aarch64=('bb7d8c113cdc362ced675b71224ed66b28bcb8c2f7a7cd7d9d9d80c49975f667'
                    '5d875c8c75ce183223bae9d431cbc4869186c25e15ffce08996f47bc15e8209f')

package() {
    local _deb_var="_deb_${CARCH}"
    local _deb="${!_deb_var}"
    [[ -n "${_deb}" ]] || { echo "unsupported architecture: ${CARCH}" >&2; return 1; }

    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" |
        awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # Upstream installs into /opt/thesio and the desktop entry points there;
    # move the payload under /usr/lib and start it through PATH instead.
    install -dm755 "${pkgdir}/usr/lib"
    mv "${pkgdir}/opt/thesio" "${pkgdir}/usr/lib/${pkgname}"
    rmdir "${pkgdir}/opt"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/thesio" "${pkgdir}/usr/bin/thesio"

    sed -i 's|^Exec=.*|Exec=/usr/bin/thesio %U|' \
        "${pkgdir}/usr/share/applications/thesio.desktop"

    install -Dm644 "${srcdir}/thesio-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    chmod -R u=rwX,go=rX "${pkgdir}"
    chown -R root:root "${pkgdir}"
}
