# Maintainer: tuanapi <tuanapi@proton.me>
pkgname=openanime
pkgver=1.1.6
pkgrel=2
pkgdesc="Unofficial OpenAnime Linux client - Compiled from source (WebGPU/Vulkan support)"
arch=('x86_64' 'aarch64')
url="https://github.com/tuanapi/OpenAnime-Linux"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'alsa-lib' 'libxtst' 'libxkbfile')
makedepends=('nodejs' 'npm' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
options=('!debug')
source=("git+https://github.com/tuanapi/OpenAnime-Linux.git#tag=v${pkgver}-${pkgrel}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/OpenAnime-Linux"
    npm install
    npm run dist -- --linux --dir
}

package() {
    cd "${srcdir}/OpenAnime-Linux"

    # 1. Install app files
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r dist/linux-unpacked/* "${pkgdir}/opt/${pkgname}/"

    # 2. Link binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # 3. Install Icon
    install -Dm644 "icon512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    # 4. Install Desktop File
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=OpenAnime
Comment=WebGPU destekli anime izleme uygulaması
Exec=${pkgname} %u
Icon=${pkgname}
Terminal=false
Categories=AudioVideo;Video;Player;
StartupWMClass=OpenAnime
PrefersNonDefaultGPU=true
EOF
}
