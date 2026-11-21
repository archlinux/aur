# Maintainer: Sohrab Behdani <behdanisohrab@gmail.com>
pkgname=zedsecure-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="ZedSecure VPN client"
arch=('x86_64' 'aarch64')
url="https://github.com/CluvexStudio/ZedSecure"
license=('AGPL-3.0')
depends=(
    'alsa-lib'
    'brotli'
    'expat'
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glibc'
    'glu'
    'libbsd'
    'libglvnd'
    'libpng'
    'libx11'
    'libxcb'
    'libxext'
    'libxi'
    'libxrender'
    'libxtst'
    'libmd'
    'zlib'
    'xdg-utils'
)
makedepends=('zstd')
options=('!strip' '!debug')
noextract=(
    "${pkgname}-${pkgver}-amd64.deb"
    "${pkgname}-${pkgver}-arm64.deb"
)
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::https://github.com/CluvexStudio/ZedSecure/releases/download/v${pkgver}/ZedSecure-${pkgver}-amd64.deb")
sha256sums_x86_64=('c3b7e97072866cb0d4d96075fd25c50c0cbb250ee0d92b504f6609e4497fdc20')

source_aarch64=("${pkgname}-${pkgver}-arm64.deb::https://github.com/CluvexStudio/ZedSecure/releases/download/v${pkgver}/ZedSecure-${pkgver}-arm64.deb")
sha256sums_aarch64=('e2860fe5fdb38c7bec522ca8c12d7b86a67f2fe890fda04aebd1765c3431f608')

package() {
    cd "${srcdir}"

    case "${CARCH}" in
        x86_64)  _deb_arch="amd64" ;;
        aarch64) _deb_arch="arm64" ;;
    esac

    ar x "${pkgname}-${pkgver}-${_deb_arch}.deb"
    tar --use-compress-program=unzstd -xf data.tar.zst

    install -dm755 "${pkgdir}/opt"
    cp -a opt/zedsecure "${pkgdir}/opt/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/zedsecure/bin/ZedSecure" "${pkgdir}/usr/bin/${pkgname}"
    ln -sf "/opt/zedsecure/bin/ZedSecure" "${pkgdir}/usr/bin/zedsecure"

    install -Dm644 opt/zedsecure/lib/zedsecure-ZedSecure.desktop \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 opt/zedsecure/lib/ZedSecure.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
}
