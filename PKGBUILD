# Maintainer: czyt <czytcn@gmail.com>

pkgname=yank-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Native clipboard history with self-hosted sync (GTK4 client and sync server)"
arch=('x86_64' 'aarch64')
url="https://github.com/ca-x/yank"
license=('MIT' 'Apache-2.0')
depends=(
    'cairo'
    'dbus'
    'fontconfig'
    'gcc-libs'
    'glib2'
    'glibc'
    'graphene'
    'gst-plugins-base'
    'gst-plugins-good'
    'gstreamer'
    'gtk4'
    'harfbuzz'
    'libxcb'
    'pango'
)
# The commands are yank-client and yank-server; nothing installs /usr/bin/yank,
# which is what the unrelated `yank-git` package (mptre/yank) provides, so
# both can be installed side by side.
options=('!strip' '!debug')

_deb_x86_64="yank_${pkgver}_amd64.deb"
_deb_aarch64="yank_${pkgver}_arm64.deb"
source_x86_64=("${_deb_x86_64}::https://github.com/ca-x/yank/releases/download/v${pkgver}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::https://github.com/ca-x/yank/releases/download/v${pkgver}/${_deb_aarch64}")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums_x86_64=('13b84d6ff5dc08e07232b06df938074a5c8eb9208b3f917c14eefdb2c37e4dfc')
sha256sums_aarch64=('605f6bcc247b7d45c159f91bbbeda365a30220df4764da1009cf16c016ed4a17')

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

    # The shipped entry has no StartupWMClass; the app reports the app id,
    # which is what panels need to match the window to the entry.
    local _desktop="${pkgdir}/usr/share/applications/io.github.cax.yank.desktop"
    grep -q '^StartupWMClass=' "${_desktop}" ||
        echo 'StartupWMClass=io.github.cax.yank' >> "${_desktop}"

    # Licences and third-party notices go to the Arch licence directory; the
    # run notes and the protocol document stay where upstream puts them, since
    # they describe first-run setup for the server.
    local _doc="${pkgdir}/usr/share/doc/yank"
    local _lic="${pkgdir}/usr/share/licenses/${pkgname}"
    for _f in LICENSE-APACHE LICENSE-MIT THIRD-PARTY-LICENSES.txt THIRD_PARTY.md; do
        install -Dm644 "${_doc}/${_f}" "${_lic}/${_f}"
        rm -f "${_doc}/${_f}"
    done

    chmod -R u=rwX,go=rX "${pkgdir}"
    chown -R root:root "${pkgdir}"
}
