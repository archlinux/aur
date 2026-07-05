# Maintainer: nekoside <contact@nekoside.com>

pkgname=sylvakru
pkgver=3.4.5
pkgrel=3
pkgdesc="A cross-platform music player for local and self-hosted libraries, built with Flutter"
arch=('x86_64')
url="https://github.com/AfalpHy/sylvakru"
license=('Apache-2.0')
_flutter=3.44.0
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AfalpHy/sylvakru/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e93f02a819be8df04c81f44ea7ca8f51f6f568413efb4c8df18ca55ecd13f9b')
makedepends=(
    'fvm'
    'cmake'
    'ninja'
    'clang'
    'patchelf'
)

depends=(
    'gtk3'
    'fontconfig'
    'pango'
    'libayatana-appindicator'
    'at-spi2-core'
    'cairo'
    'glib2'
    'libepoxy'
    'libsecret'
)

options=('!debug' 'strip')

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    fvm install "${_flutter}"
    fvm use "${_flutter}"
    fvm flutter pub get
    fvm flutter build linux --release
}

package() {
    # ${pkgdir} and ${srcdir} are temp dirs for packaging
    # ${pkgdir} -> pkg/${pkgname}/
    # ${srcdir} -> src/

    # create directory ${pkgdir}/opt/sylvakru/
    install -d "${pkgdir}/opt/${pkgname}"

    # copy ${srcdir}/sylvakru-${pkgver}/build/linux/x64/release/bundle/. to ${pkgdir}/opt/sylvakru/
    cp -r "${srcdir}/${pkgname}-${pkgver}/build/linux/x64/release/bundle/." "${pkgdir}/opt/${pkgname}"

    # set rpath for ${pkgdir}/opt/sylvakru/sylvakru
    patchelf --set-rpath '$ORIGIN/lib' "${pkgdir}/opt/${pkgname}/${pkgname}"

    # set rpath for ${pkgdir}/opt/sylvakru/lib/*.so
    find "${pkgdir}/opt/${pkgname}/lib" -name '*.so' -exec patchelf --set-rpath '$ORIGIN' {} \;

    # create directory ${pkgdir}/usr/bin/
    install -d "${pkgdir}/usr/bin"

    # symbol link ${pkgdir}/usr/bin/sylvakru -> /opt/sylvakru/sylvakru
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # add execute permission
    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"

    # create ${pkgdir}/usr/share/applications/sylvakru.desktop
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=${pkgname^}
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname}
Icon=/opt/${pkgname}/data/flutter_assets/assets/app_icon.png
Type=Application
Categories=AudioVideo;Audio;Video;Player;TV;
Terminal=false
EOF
}
