# Maintainer: czyt <czytcn@gmail.com>
pkgname=msime-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Metasequoia IME: IBus frontend and desktop tools for Chinese and Japanese input"
arch=('x86_64' 'aarch64')
url="https://msime.app"
license=('GPL-3.0-only')
depends=('cairo' 'curl' 'glib2' 'gtk3' 'ibus' 'libsecret' 'sqlite' 'gcc-libs')
optdepends=(
    'tesseract: local handwriting recognition'
    'tesseract-data-chi_sim: simplified Chinese data for tesseract'
)
provides=('metasequoia-ime-linux')
conflicts=('metasequoia-ime-linux')
options=('!strip' '!debug')

_upstream_deb="metasequoia-ime-linux_${pkgver}"
# The upstream binaries are built against Boost.JSON 1.83; Arch ships a newer
# Boost, so the compatible runtime library is taken from Ubuntu and installed
# next to the rest of the system libraries.
_boost_deb="libboost-json_1.83.0-2.1ubuntu3.2"

source_x86_64=(
    "${_upstream_deb}_amd64.deb::https://github.com/metasequoiaime/MSIME-Linux/releases/download/v${pkgver}/${_upstream_deb}_amd64.deb"
    "${_boost_deb}_amd64.deb::https://archive.ubuntu.com/ubuntu/pool/universe/b/boost1.83/libboost-json1.83.0_1.83.0-2.1ubuntu3.2_amd64.deb"
)
source_aarch64=(
    "${_upstream_deb}_arm64.deb::https://github.com/metasequoiaime/MSIME-Linux/releases/download/v${pkgver}/${_upstream_deb}_arm64.deb"
    "${_boost_deb}_arm64.deb::https://ports.ubuntu.com/ubuntu-ports/pool/universe/b/boost1.83/libboost-json1.83.0_1.83.0-2.1ubuntu3.2_arm64.deb"
)
sha256sums_x86_64=('a6f41fc80c6489ca851fd923709271bd9b9ba88a8a194eb05201a172ca10eca2'
                   '819acce84a1327ed7476cbae5b76893f902058ff30d538b637380b8a79ec1571')
sha256sums_aarch64=('0ea03e38ebf353e622cbef97331864e1783f2f68c84855138fcf303f31ccc5bf'
                    '926dd1beb34694bc29b49426d29461daa12444ca4b62f14abdd4224db14182a6')
noextract=(
    "${_upstream_deb}_amd64.deb"
    "${_upstream_deb}_arm64.deb"
    "${_boost_deb}_amd64.deb"
    "${_boost_deb}_arm64.deb"
)

package() {
    local _suffix
    case "$CARCH" in
        x86_64)  _suffix=amd64 ;;
        aarch64) _suffix=arm64 ;;
    esac

    local _deb="${_upstream_deb}_${_suffix}.deb"
    local _boost="${_boost_deb}_${_suffix}.deb"

    bsdtar -xOf "${srcdir}/${_deb}" 'data.tar.*' |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    local _tmp="${srcdir}/boost-${_suffix}"
    rm -rf "${_tmp}"
    mkdir -p "${_tmp}"
    bsdtar -xOf "${srcdir}/${_boost}" 'data.tar.*' | bsdtar -xf - -C "${_tmp}"
    install -Dm644 "$(find "${_tmp}" -name 'libboost_json.so.1.83.0' -print -quit)" \
        "${pkgdir}/usr/lib/libboost_json.so.1.83.0"
    rm -rf "${_tmp}"
}
