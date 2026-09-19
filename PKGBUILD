# Maintainer: Joël Müller <mail@joelmueller.ch>

pkgname=dopeiptv-bin
pkgver=1.2.11
pkgrel=1
pkgdesc='Linux IPTV player with Xtream Codes, M3U, EPG, timeshift, recording and multiview'
arch=('x86_64')
url='https://iptv.dope.rs/'
license=('GPL-3.0-or-later')

depends=('glibc')

makedepends=('patchelf')

optdepends=(
    'mpv: external MPV playback'
    'vlc: external VLC playback'
)

provides=("dopeiptv=${pkgver}")
conflicts=('dopeiptv')

options=('!strip' '!debug')

_deb="dopeiptv_${pkgver}_amd64.deb"

source=(
    "${_deb}::https://iptv.dope.rs/dl.php?f=${_deb}"
)

noextract=("${_deb}")

sha256sums=(
    '4b0ca24a3fadc08a885299c3dfc920c89cb0fe4a828645f918ad688fa07094c2'
)

prepare() {
    rm -rf "${srcdir}/deb"
    mkdir -p "${srcdir}/deb"

    bsdtar -xf "${srcdir}/${_deb}" \
        -C "${srcdir}/deb"
}

package() {
    local _data_archive

    _data_archive="$(find "${srcdir}/deb" \
        -maxdepth 1 \
        -type f \
        -name 'data.tar.*' \
        -print \
        -quit)"

    [[ -n "${_data_archive}" ]] || {
        echo 'ERROR: data.tar.* not found' >&2
        return 1
    }

    bsdtar -xf "${_data_archive}" -C "${pkgdir}"

    # Remove stale GitHub Actions Python RUNPATH from upstream binaries.
    while IFS= read -r _file; do
        _rpath="$(patchelf --print-rpath "${_file}" 2>/dev/null)" || continue

        [[ "${_rpath}" == *'/opt/hostedtoolcache/Python/3.12.14/x64/lib'* ]] || continue

        _new_rpath="$(
            printf '%s' "${_rpath}" |
                tr ':' '\n' |
                grep -Fxv '/opt/hostedtoolcache/Python/3.12.14/x64/lib' |
                paste -sd: -
        )"

        if [[ -n "${_new_rpath}" ]]; then
            patchelf --set-rpath "${_new_rpath}" "${_file}"
        else
            patchelf --remove-rpath "${_file}"
        fi
    done < <(find "${pkgdir}/opt/dopeiptv" -type f)
}
