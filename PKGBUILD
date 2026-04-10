# Maintainer: czyt <czytcn@gmail.com>
pkgname=karing-bin
pkgver=1.2.16.1912
pkgrel=1
pkgdesc="Simple & Powerful proxy utility, Support routing rules for clash/sing-box"
arch=('x86_64')
url="https://github.com/KaringX/karing"
license=('GPL-3.0-or-later')
depends=(
    'gtk3'
    'libayatana-appindicator'
    'glib2'
    'libnotify'
    'libsecret'
    'xdg-user-dirs'
    'zenity'
    'libkeybinder3'
)
optdepends=(
    'libappindicator-gtk3: for system tray icon support'
)
provides=('karing')
conflicts=('karing' 'karing-git')
source=("${pkgname}-${pkgver}.deb::https://github.com/KaringX/karing/releases/download/v${pkgver}/karing_${pkgver}_linux_amd64.deb")
sha256sums=('47a719bd41e9fc17b27bd7b055b0e0c18bdaa8cd18ce1b9f550c9cd0f2bc7825')
noextract=("${pkgname}-${pkgver}.deb")

package() {
    cd "${srcdir}"

    bsdtar -xf "${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.zst -C "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} \;

    # Set proper permissions for executables
    if [ -d "${pkgdir}/usr/share/karing" ]; then
        find "${pkgdir}/usr/share/karing" -type f -name "karing" -exec chmod 755 {} \;
    fi

    # Remove unnecessary documentation
    rm -rf "${pkgdir}/usr/share/doc"

    # Create symlink for the binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/usr/share/karing/karing" "${pkgdir}/usr/bin/karing"
}
