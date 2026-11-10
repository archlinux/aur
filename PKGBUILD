# Maintainer: czyt <czytcn@gmail.com>

pkgname=swiftdl-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Fast, resumable download manager with many connections per file and a browser extension"
arch=('x86_64')
url="https://github.com/harshsinghsv/swiftdl"
license=('MIT')
depends=(
    'cairo'
    'dbus'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'libappindicator'
    'libsoup3'
    # Not in the .deb's dependency list, but the binary links libssl.so.3.
    'openssl'
    'webkit2gtk-4.1'
)
provides=('swiftdl')
conflicts=('swiftdl')
options=('!strip' '!debug')

_deb="SwiftDL_${pkgver}_amd64.deb"
source_x86_64=(
    "${_deb}::https://github.com/harshsinghsv/swiftdl/releases/download/v${pkgver}/${_deb}"
    "LICENSE::https://github.com/harshsinghsv/swiftdl/raw/v${pkgver}/LICENSE"
)
noextract=("${_deb}")
sha256sums_x86_64=('e1f9d24917250d7356151c5217a9a30eff820a72294977be3492da1b21f83bda'
                   '669f8a60b1d27d4ce0065972731ffcc7b5b7c26d28ba48f1f9e0cab035465cf7')

package() {
    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" |
        awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    # The .deb layout is kept as it is: the app finds its browser extension
    # relative to its own location, resolving /usr/bin/swiftdl-app to
    # /usr/lib/SwiftDL, so that directory must not move.
    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    chmod -R u=rwX,go=rX "${pkgdir}"
    chown -R root:root "${pkgdir}"
}
