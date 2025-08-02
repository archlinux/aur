# Maintainer: awh (https://aur.archlinux.org/account/awh)
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Vitaly Utkin (https://aur.archlinux.org/account/vautkin)
pkgname=ovras
pkgver=5.8.11
pkgrel=4
epoch=0
pkgdesc="Advanced settings and custom behavior for SteamVR using OpenVR (OVR)."
arch=("x86_64")
url="https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings"
license=("GPL-3.0-or-later")
depends=(
  "gcc-libs"
  "glibc"
  "libx11"
  "libxtst"
  "qt5-base"
  "qt5-declarative"
  "qt5-multimedia"
  "qt5-websockets"
  "qt5-quickcontrols"
  "qt6-declarative"
  "qt6-multimedia"
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings/archive/v$pkgver.tar.gz"
  "${pkgname}_launch.sh"
)
sha256sums=(
  "2bd7e610a3b44e1525621b6fef17b4f0e1f40f8c4719bc0d4540cd8f81f3f8c5"
  "09f3c0c5eeea7d63e914d97f53c5f2b8af6acfed398957e202142be93ea85fb4"
)

build() {
    cd "OpenVR-AdvancedSettings-$pkgver"

    LDFLAGS=${LDFLAGS/-Wl,-z,pack-relative-relocs}
    qmake PREFIX="$pkgdir/opt/"
    make
}

package() {
    cd "OpenVR-AdvancedSettings-$pkgver"

    install -Dm644 "src/res/img/icons/thumbicon.png" "$pkgdir/opt/AdvancedSettings/AdvancedSettings.png"

    install -Dm644 "src/package_files/linux/AdvancedSettings.desktop" "$pkgdir/usr/share/applications/AdvancedSettings.desktop"
    sed -i 's@Exec=.*@Exec=/opt/AdvancedSettings/AdvancedSettings@' "$pkgdir/usr/share/applications/AdvancedSettings.desktop"
    sed -i 's@Icon=.*@Icon=/opt/AdvancedSettings/AdvancedSettings.png@' "$pkgdir/usr/share/applications/AdvancedSettings.desktop"
    echo "Path=/opt/AdvancedSettings" >> "$pkgdir/usr/share/applications/AdvancedSettings.desktop"

    install -Dm755 "${srcdir}/${pkgname}_launch.sh" "${pkgdir}/usr/bin/${pkgname}"

    make install
    sed -i '/binary_path_windows/a "binary_path_linux": "/usr/bin/ovras",' "$pkgdir/opt/AdvancedSettings/manifest.vrmanifest"
}
