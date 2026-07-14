# Maintainer: Custom Beta Builder <custom at aur dot archlinux dot org>
pkgname=bluebubbles-beta-bin
_pkgname=BlueBubbles
pkgver=2.0.0+87_desktop_b.3
_tagver="2.0.0%2B87-desktop-b.3"
pkgrel=1
pkgdesc="A cross-platform app ecosystem, bringing iMessage to Linux, Android, and Windows (Beta Prebuilt Release)"
arch=('x86_64')
url="https://bluebubbles.app/"
_ghurl="https://github.com/BlueBubblesApp/bluebubbles-app"
license=('Apache-2.0')
provides=("bluebubbles-beta=${pkgver}" "bluebubbles")
conflicts=("bluebubbles" "bluebubbles-bin")
depends=(
    'webkit2gtk-4.1'
    'gdk-pixbuf2'
    'mpv'
    'libdbusmenu-glib'
    'libnotify'
    'libappindicator-gtk3'
    'gtk3'
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source_x86_64=("bluebubbles-beta-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${_tagver}/bluebubbles-linux-x86_64.tar.gz")
source=("bluebubbles-beta.sh")
sha256sums=('efe4503308a1e4e44b892065b6fb8f582bd2f7d01e3f0232e4d86539101ebbb5')
sha256sums_x86_64=('49f592658692d68b6447edb9cbdeb39d33ca74e4b12d351ad5d811e4b3b2ed4c')

prepare() {
    sed -i -e "
        s/@appname@/bluebubbles-beta/g
        s/@runname@/bluebubbles-beta/g
    " "${srcdir}/bluebubbles-beta.sh"
    gendesk -f -n -q \
        --pkgname="bluebubbles-beta" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname} Beta" \
        --exec="bluebubbles-beta %U"
}

package() {
    install -Dm755 "${srcdir}/bluebubbles-beta.sh" "${pkgdir}/usr/bin/bluebubbles-beta"
    install -Dm755 "${srcdir}/bluebubbles" "${pkgdir}/usr/lib/bluebubbles-beta/bluebubbles-beta.real"
    cat <<EOF > "${pkgdir}/usr/lib/bluebubbles-beta/bluebubbles-beta"
#!/bin/bash
export GDK_BACKEND=x11
if command -v prime-run >/dev/null 2>&1; then
    exec prime-run "/usr/lib/bluebubbles-beta/bluebubbles-beta.real" "\$@"
else
    exec "/usr/lib/bluebubbles-beta/bluebubbles-beta.real" "\$@"
fi
EOF
    chmod 755 "${pkgdir}/usr/lib/bluebubbles-beta/bluebubbles-beta"
    cp -a "${srcdir}/"{data,lib} "${pkgdir}/usr/lib/bluebubbles-beta"
    install -Dm644 "${srcdir}/data/flutter_assets/assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/bluebubbles-beta.png"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/bluebubbles-beta/libmpv.so.1"
    install -Dm644 "${srcdir}/bluebubbles-beta.desktop" -t "${pkgdir}/usr/share/applications"
}
