# Maintainer: rzhli <tayuebuliuhen@gmail.com>
pkgname=dwsim-bin
pkgver=9.0.5
pkgrel=2
pkgdesc="Open Source Chemical Process Simulator (binary release)"
arch=('x86_64')
url="https://dwsim.org"
license=('LGPL-3.0-or-later')
depends=('dotnet-runtime-8.0' 'gtk3' 'libgdiplus')
optdepends=('coin-or-ipopt: Interior Point OPTimizer for advanced optimization')
provides=('dwsim')
conflicts=('dwsim')
options=('!strip' '!debug')
source=("https://github.com/DanWBR/dwsim/releases/download/v${pkgver}/dwsim_${pkgver}-amd64.deb")
sha256sums=('52c041b1d659ea26e22750e8b7045c7bc68d3d95f6384abe28d07d967eafa20c')
noextract=("dwsim_${pkgver}-amd64.deb")

prepare() {
    cd "${srcdir}"
    mkdir -p dwsim-data
    ar x "${srcdir}/dwsim_${pkgver}-amd64.deb"
    bsdtar xf data.tar.zst -C dwsim-data
}

package() {
    # Install application files to /opt/dwsim
    install -dm755 "${pkgdir}/opt/dwsim"
    cp -a "${srcdir}/dwsim-data/usr/local/lib/dwsim/." "${pkgdir}/opt/dwsim/"

    # Install launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/dwsim" << 'EOF'
#!/bin/sh
# Force XWayland when running under Wayland to fix Eto.Forms drag-and-drop
if [ -n "$WAYLAND_DISPLAY" ]; then
    export GDK_BACKEND=x11
fi
export LD_LIBRARY_PATH=/opt/dwsim:/opt/dwsim/ThermoCS${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
cd /opt/dwsim
exec /usr/bin/dotnet DWSIM.UI.Desktop.exe "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/dwsim"

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/dwsim.desktop" << 'EOF'
[Desktop Entry]
Name=DWSIM
Comment=Open Source Chemical Process Simulator
Exec=dwsim %F
Icon=dwsim
Terminal=false
Type=Application
Categories=Science;Chemistry;Education;
StartupNotify=true
MimeType=application/x-dwsim;
EOF

    # Install icon
    install -Dm644 "${srcdir}/dwsim-data/usr/share/pixmaps/dwsim.png" \
        "${pkgdir}/usr/share/pixmaps/dwsim.png"
}
