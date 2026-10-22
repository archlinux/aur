# Maintainer: czyt <czytcn@gmail.com>
pkgname=hatoba-bin
pkgver=0.6.0
pkgrel=3
pkgdesc="Open-source desktop SSH client with an AI assistant and end-to-end encrypted sync through your own Cloudflare account"
arch=('x86_64')
url="https://hatoba.fog.moe"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'libsecret'
    'openssl'
)
optdepends=('gnome-keyring: keep sync credentials in a Secret Service keyring (org.freedesktop.secrets)')
provides=('hatoba')
conflicts=('hatoba')
options=('!strip' '!debug')
source_x86_64=("Hatoba_${pkgver}_linux-x64.deb::https://github.com/scarletkc/Hatoba/releases/download/v${pkgver}/Hatoba_${pkgver}_linux-x64.deb")
sha256sums_x86_64=('6ba7369f79f88c6087ae0b1628eb4e6257ef636b055572d2b891a9ec8eb04a7c')

package() {
    local _deb="Hatoba_${pkgver}_linux-x64.deb"

    # Dynamically select the data archive member in case deb compression changes
    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" | awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}"

    # Marker that makes Hatoba leave updates to pacman instead of running its
    # own updater (which would call dpkg).
    install -dm755 "${pkgdir}/usr/lib/Hatoba"
    printf 'aur\n' > "${pkgdir}/usr/lib/Hatoba/managed-by-package-manager"
}
