# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=radar-contact
pkgver=3.4
pkgrel=1
pkgdesc="Radar Contact is a 2D game where you manage airspace, guiding planes to their destinations while avoiding collisions and storms."
arch=('x86_64')
url="https://github.com/Bogdanctx/Radar-Contact"
license=('custom')
provides=("radar-contact")
conflicts=("radar-contact")
depends=('curl' 'libxrandr' 'libxcursor' 'libsystemd' 'openal' 'flac' 'libvorbis' 'mesa' 'libegl' 'libdrm' 'freetype2')
makedepends=('cmake' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bogdanctx/Radar-Contact/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f301f44db5ce97e8efa01f92ec5718085313969255d01cf08d94a63d311ff76b')

build() {
    cd "${srcdir}/Radar-Contact-${pkgver}"
    cmake -S . -B build \
        -DCPR_BUILD_TESTS=OFF \
        -DCPR_FORCE_USE_SYSTEM_CURL=ON \
        -DBUILD_CURL_EXE=OFF
    cmake --build build -j$(nproc)
}

package() {
    cd "${srcdir}/Radar-Contact-${pkgver}"
    install -d "${pkgdir}/opt/${pkgname}"
    cmake --install build --prefix="${pkgdir}/opt/${pkgname}"
    
    # Create a wrapper script to run the application with the correct working directory
    install -d "${pkgdir}/usr/bin"
    echo -e "#!/bin/bash\ncd /opt/${pkgname}/bin && ./radar_contact" > "${pkgdir}/usr/bin/radar-contact"
    chmod +x "${pkgdir}/usr/bin/radar-contact"

        # Install the .desktop file
    install -d "${pkgdir}/usr/share/applications"
    echo -e "[Desktop Entry]\n\
Name=Radar Contact\n\
Exec=/usr/bin/radar-contact\n\
Icon=/opt/${pkgname}/bin/resources/general_textures/icon.png\n\
Type=Application\n\
Categories=Game;\n\
Terminal=false" > "${pkgdir}/usr/share/applications/radar-contact.desktop"
}

