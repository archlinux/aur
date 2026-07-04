# Maintainer: nekoside <contact@nekoside.com>

pkgname=sylvakru
pkgver=3.4.5
pkgrel=2
pkgdesc="A cross-platform music player for local and self-hosted libraries, built with Flutter"
arch=('x86_64')
url="https://github.com/AfalpHy/sylvakru"
license=('Apache-2.0')
_commit=cb60387957ea64d4ab70667a4eb9b099e465ea76
_flutter=3.44.0
_pkgsrc="${pkgname}"
source=("git+https://github.com/AfalpHy/sylvakru.git#commit=${_commit}")
sha256sums=('SKIP')
makedepends=(
    'git'
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
    'glibc'
    'glib2'
    'libepoxy'
    'libstdc++'
    'libgcc'
    'libsecret'
)

options=('!debug' 'strip')

build() {
    cd "${_pkgsrc}" || exit 1
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

    # copy ${srcdir}/sylvakru/build/linux/x64/release/bundle/. to ${pkgdir}
    # /opt/sylvakru/
    cp -r "${srcdir}/${pkgname}/build/linux/x64/release/bundle/." "${pkgdir}/opt/${pkgname}"

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
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
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
