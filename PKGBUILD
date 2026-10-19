# Maintainer: Throdne <Throdne@gmail.com>

pkgname=supercell-wx-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A NEXRAD Level 2 and Level 3 radar viewing application (Stable Build)"
arch=('x86_64')
url="https://github.com/dpaulat/supercell-wx"
license=('MIT')
makedepends=()
depends=('xcb-util-cursor' 'mesa')
provides=('supercell-wx')
conflicts=('supercell-wx' 'supercell-wx-appimage')
source=("https://github.com/dpaulat/supercell-wx/releases/download/v${pkgver}-release/supercell-wx-v${pkgver}-linux-x64.tar.gz"
        "supercell-wx.desktop::https://raw.githubusercontent.com/dpaulat/supercell-wx/v${pkgver}-release/scwx-qt/res/linux/supercell-wx.desktop"
        "scwx-256.png::https://raw.githubusercontent.com/dpaulat/supercell-wx/v${pkgver}-release/scwx-qt/res/icons/scwx-256.png"
        "scwx-64.png::https://raw.githubusercontent.com/dpaulat/supercell-wx/v${pkgver}-release/scwx-qt/res/icons/scwx-64.png")
sha256sums=('dd80b45fe2c5bce27e167e5eec1658609c577458d14f697954dedebc30af9db9'
            '1d1b2aaf6cb054ab8fee9980b8b19dc40b8af7d69c0e4e83c15649cbea4ac360'
            '7e43e238c96f7ed225286ccb6d656458aec063fb090d5e9ec08922d03b59a8d6'
            '4a900b77386aec5541b66afdfc41389ff12cac76ff046f7272eed025ce72d010')

package() {
    # Extract the tar.gz file
    tar -xf "supercell-wx-v${pkgver}-linux-x64.tar.gz" -C "${srcdir}"

    # Check archive structure
    if [[ ! -d "${srcdir}/supercell-wx/bin" ]]; then
        error "Unexpected archive structure."
        return 1
    fi

    # Install to /opt
    install -dm755 "${pkgdir}/opt/supercell-wx"
    cp -a "${srcdir}/supercell-wx/"* "${pkgdir}/opt/supercell-wx/"

    # Symlink binary to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/supercell-wx/bin/supercell-wx" "${pkgdir}/usr/bin/supercell-wx"

    # Install desktop entry (start menu shortcut)
    install -Dm644 "${srcdir}/supercell-wx.desktop" "${pkgdir}/usr/share/applications/supercell-wx.desktop"

    # Install application icons
    install -Dm644 "${srcdir}/scwx-256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/supercell-wx.png"
    install -Dm644 "${srcdir}/scwx-64.png"  "${pkgdir}/usr/share/icons/hicolor/64x64/apps/supercell-wx.png"
}
