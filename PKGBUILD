# Maintainer: tuanapi <tuanapi@proton.me>
_pkgname=openanime
pkgname="${_pkgname}-bin"
pkgver=1.0.8
pkgrel=1
pkgdesc="Unofficial OpenAnime Linux istemcisi - WebGPU/Vulkan destekli"
arch=('x86_64')
url="https://github.com/tuanapi/OpenAnime-Linux"
license=('MIT')
depends=('fuse2' 'gtk3' 'nss' 'libxss' 'alsa-lib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
_appimage="OpenAnime-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/tuanapi/OpenAnime-Linux/releases/download/v${pkgver}/${_appimage}")
sha256sums=('a1903d5134ffd150b3b41c0072435d15f5efbe194fa2dd7ecbe5de4a2062814c')
noextract=("${_appimage}")

package() {
    # 1. Install AppImage to /opt
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # 2. Link binary to /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # 3. Install Desktop File
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=OpenAnime
Comment=WebGPU destekli anime izleme uygulaması
Exec=${_pkgname} %u
Icon=${_pkgname}
Terminal=false
Categories=AudioVideo;Video;Player;
MimeType=x-scheme-handler/openanime;
StartupWMClass=OpenAnime
PrefersNonDefaultGPU=true
EOF

    # 4. Extract and install icon from AppImage
    cd "${srcdir}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract usr/share/icons 2>/dev/null || true
    if [ -f "squashfs-root/usr/share/icons/hicolor/512x512/apps/openanime.png" ]; then
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/openanime.png" \
            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    fi
    rm -rf squashfs-root
}
