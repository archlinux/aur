# Maintainer: Nico <desoxhd@gmail.com>
pkgname=anydesk-bin
pkgver=5.5.5
pkgrel=4
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support (Generic based package)"
arch=('i686' 'x86_64')
url="https://anydesk.com"
license=('custom')
depends=('fakeroot' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrender' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs')
optdepends=('libpulse: audio support')
conflicts=('anydesk' 'anydesk-test' 'anydesk-debian' 'pango-anydesk' 'pangox-compat')
provides=('anydesk' 'libpangox-1.0.so.0')

source_i686=("https://download.anydesk.com/linux/anydesk-${pkgver}-i386.tar.gz")
source_x86_64=("https://download.anydesk.com/linux/anydesk-${pkgver}-amd64.tar.gz")

sha256sums_i686=('ead02c9778711a6f028fb0f26f9ef9a48b76ef8f374124b45827e451a55f082a')
sha256sums_x86_64=('606950997cfa607eff0f68018b8e6962f2491037a7c590d6e150befcaabe5225')

package() {
    # workaround because pangox-compat package has been removed
    mkdir -p "${pkgdir}/usr/lib/"
    ln -sf "/usr/lib/libpangoxft-1.0.so" "${pkgdir}/usr/lib/libpangox-1.0.so.0"

    # install binary
    install -Dm 755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk"
    # install desktop entry
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/anydesk.desktop" "${pkgdir}/usr/share/applications/anydesk.desktop"
    # install polkit action
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/polkit-1/com.philandro.anydesk.policy" "${pkgdir}/usr/share/polkit-1/actions/com.philandro.anydesk.policy"
    # install icon
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/icons/hicolor/scalable/apps/anydesk.svg" "${pkgdir}/usr/share/pixmaps/anydesk.svg"
    # install license
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    msg2 "\e[1;32mAnyDesk has a systemd service for unattended access. Enable it with: systemctl enable --now anydesk \e[0m"
    # install systemd service
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
