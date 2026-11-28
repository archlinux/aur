# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=vento
pkgname=${_pkgname}-bin
pkgver="8"
pkgrel="1"
pkgdesc="Fast, fluid VNC/RDP remote desktop client (Linux client, upstream release binary)"
# Upstream ships a Linux release for x86_64 only.
arch=('x86_64')
url="https://pgaskin.net/vento"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'zlib')
optdepends=(
    'vulkan-driver: window rendering (Vulkan)'
    'vulkan-icd-loader: window rendering (Vulkan)'
    'libglvnd: window rendering (OpenGL fallback)'
    'wayland: Wayland session'
    'libx11: X11 session'
    'libxcb: X11 session'
    'libva: hardware video decoding'
    'libpulse: audio'
    'pipewire: audio'
    'alsa-lib: audio'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# Upstream strips the backend libraries itself; keep the binaries byte-identical to the release.
options=('!strip' '!debug')

# The release tarball has no LICENSE, README or icon, so take them from the tag.
source=("${_pkgname}-${pkgver}-x86_64-linux-gnu.tar.gz::https://github.com/pgaskin/vento/releases/download/v${pkgver}/vento-x86_64-linux-gnu.tar.gz"
        "${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pgaskin/vento/v${pkgver}/LICENSE"
        "${_pkgname}-${pkgver}-README.md::https://raw.githubusercontent.com/pgaskin/vento/v${pkgver}/README.md"
        "${_pkgname}-${pkgver}-icon.png::https://raw.githubusercontent.com/pgaskin/vento/v${pkgver}/linux/metadata/icon.png")

sha256sums=('dde3339f72ff18faedcf4e78322cdbfbeba4301866b6c65a73c322ea8a8bf008'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '65ec587383d675ff4d307a4bf4b9147dfa0aac2116dec5e10294fc677e6871f4'
            '1a1cc259bb4037ad51062bde11fb697a4d6cf1776be3fb49f41bfd8581d7d932')

package() {
    # The binary finds its backends through the rpath $ORIGIN/lib, so keep upstream's tree whole.
    install -Dm0755 "${srcdir}/vento/vento" "${pkgdir}/usr/lib/${_pkgname}/vento"
    install -Dm0755 -t "${pkgdir}/usr/lib/${_pkgname}/lib" "${srcdir}"/vento/lib/libvento_*.so
    install -dm0755 "${pkgdir}/usr/bin"
    ln -s "../lib/${_pkgname}/vento" "${pkgdir}/usr/bin/vento"

    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/vento.png"
    # The window's Wayland app_id is "vento".
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/vento.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Vento
Comment=Fast, fluid VNC/RDP remote desktop client
Exec=vento
Icon=vento
Terminal=false
Categories=Network;RemoteAccess;
StartupWMClass=vento
EOF

    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
