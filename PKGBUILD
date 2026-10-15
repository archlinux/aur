# Maintainer: czyt <czytcn@gmail.com>
pkgname=openless-bin
pkgver=1.3.18
pkgrel=3
pkgdesc="Hold a key, speak, release — AI-polished text appears at your cursor in any app."
arch=('x86_64')
url="https://github.com/Open-Less/openless"
license=('MIT')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'xdotool')
makedepends=('patchelf')
optdepends=('fcitx5: reliable text insertion support, especially under Wayland')
provides=('openless')
conflicts=('openless')
source_x86_64=("OpenLess_${pkgver}_amd64.deb::https://github.com/Open-Less/openless/releases/download/v${pkgver}-tauri/OpenLess_${pkgver}_amd64.deb")
md5sums_x86_64=('fca2fa129afbb477a97aaa7047fefea7')

package() {
    local _debfile="OpenLess_${pkgver}_amd64.deb"

    # Extract the deb package
    ar p "${srcdir}/${_debfile}" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"

    # Arch ships libxdo.so.4, while the upstream Debian binary requests
    # libxdo.so.3. Patch only this binary instead of installing a global,
    # unowned compatibility symlink.
    patchelf --replace-needed libxdo.so.3 libxdo.so.4 \
        "${pkgdir}/usr/bin/openless"
    readelf -d "${pkgdir}/usr/bin/openless" | grep -q 'libxdo.so.4'

    # Debian uses a multiarch Fcitx5 module directory. Install the module in
    # Arch's native addon directory and remove the misplaced duplicate.
    install -Dm755 \
        "${pkgdir}/usr/lib/OpenLess/linux-fcitx5-plugin/libopenless.so" \
        "${pkgdir}/usr/lib/fcitx5/libopenless.so"
    rm -rf "${pkgdir}/usr/lib/x86_64-linux-gnu"
}
