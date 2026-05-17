# Maintainer: Monzer Osman <monzerosman15@gmail.com>

pkgname=yalla-video-bin
_pkgname=yalla-video
pkgver=1.1.2
pkgrel=1
pkgdesc="Fast desktop video downloader for YouTube and 1000+ sites"
arch=('x86_64')
url="https://github.com/monzer15/yalla-video-releases"
license=('MIT')
depends=(
    'gtk3'
    'libnotify'
    'libxtst'
    'nss'
    'libxss'
    'libappindicator-gtk3'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${_pkgname}-${pkgver}.deb::https://github.com/monzer15/yalla-video-releases/releases/download/v${pkgver}/yalla-video_${pkgver}_amd64.deb")
sha256sums=('da612fe24a3506ea9dbb7c4ac73bf176e1d8513b4605874ee096cb8fd2b7c4c2')

package() {
    cd "${srcdir}"

    # The .deb is an ar archive containing data.tar.*; extract its payload into $pkgdir.
    bsdtar -xf "${_pkgname}-${pkgver}.deb" data.tar.xz
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    rm -f data.tar.xz

    # Drop the changelog the .deb ships under /usr/share/doc; Arch doesn't expect it here.
    rm -rf "${pkgdir}/usr/share/doc"

    # Symlink the binary into PATH (the .deb installs the app under "/opt/Yalla Video/").
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/Yalla Video/yalla-video" "${pkgdir}/usr/bin/yalla-video"

    # chrome-sandbox needs setuid root for Electron's sandbox helper.
    chmod 4755 "${pkgdir}/opt/Yalla Video/chrome-sandbox"
}
