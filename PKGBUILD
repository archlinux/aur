# Maintainer: Custom Source Builder <custom at aur dot archlinux dot org>
pkgname=bluebubbles-desktop-app
_pkgname=BlueBubbles
pkgver=2.0.0+87_desktop_b.3
_tagver="2.0.0+87-desktop-b.3"
pkgrel=1
pkgdesc="A cross-platform app ecosystem, bringing iMessage to Linux, Android, and Windows (Beta Release, Compiled From Source)"
arch=('x86_64')
url="https://bluebubbles.app/"
_ghurl="https://github.com/BlueBubblesApp/bluebubbles-app"
license=('Apache-2.0')
provides=("bluebubbles-desktop-app=${pkgver}" "bluebubbles")
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
    'flutter'
    'cmake'
    'ninja'
    'pkg-config'
    'clang'
    'gendesk'
)
options=(
    '!emptydirs'
)
source=("${pkgname}::git+${_ghurl}.git#tag=v${_tagver}")
sha256sums=('SKIP')

prepare() {
    # Generate desktop entry
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname} Beta (Source)" \
        --exec="${pkgname} %U"
}

build() {
    cd "${pkgname}"
    flutter pub get
    flutter build linux --release
}

package() {
    cd "${pkgname}"
    
    # Create target directories
    install -d "${pkgdir}/usr/lib/${pkgname}"
    
    # Copy compiled bundle assets
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}/"
    
    # Launcher wrapper script
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/${pkgname}"
#!/bin/bash
export GDK_BACKEND=x11
export LD_LIBRARY_PATH="/usr/lib/${pkgname}/lib:\${LD_LIBRARY_PATH}"
if command -v prime-run >/dev/null 2>&1; then
    exec prime-run "/usr/lib/${pkgname}/bluebubbles" "\$@"
else
    exec "/usr/lib/${pkgname}/bluebubbles" "\$@"
fi
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
    
    # Setup icon and symlink libmpv
    install -Dm644 "assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/${pkgname}/libmpv.so.1"
    
    # Install desktop launcher
    install -Dm644 "../${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
