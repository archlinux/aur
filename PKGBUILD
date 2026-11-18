# Maintainer: czyt <czytcn@gmail.com>

pkgname=thesio-bin
pkgver=0.1.7
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
sha256sums_x86_64=('84dd01dafe4f3ee192877d14ab0faf9a3ab1062d2956510031617073f273aaef'
                   '5d875c8c75ce183223bae9d431cbc4869186c25e15ffce08996f47bc15e8209f')
sha256sums_aarch64=('ebbe3e4377e47db759c94e85407cd5b3495d1ed5a39291e7aa89be8e39e62104'
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
