# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Zanny <lordzanny@gmail.com>
# Contributor: Pavel Lymarev <x-user at bk dot ru>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Rene Schoebel (wesley) <schoebel.r at gmail dot com>
pkgname=openjk-git
pkgver=r3732.26b871955
pkgrel=1
pkgdesc="Open Source Jedi Knight II + III Engine"
arch=("x86_64")
url="https://github.com/JACoders/OpenJK"
license=(GPL2)
depends=(
    "libjpeg"
    "libpng"
    "sdl2"
)
makedepends=(
    "cmake"
    "git"
)
provides=("openjk")
conflicts=(
    "openjk"
    "openjk-bin"
)
source=(
    "${pkgname}::git+https://github.com/JACoders/OpenJK.git"
    'openjkmp.png'
    'openja.png'
    'openjo.png'
    'openjkmp.desktop'
    'openja.desktop'
    'openjo.desktop'
)
b2sums=(
    'SKIP'
    'b38394fdd39de7b9cb2dc32322effedfb157c51811d36c9e26c4bc41105a0915669f22e038a8bcfdce3f6226b0abef5eb123bec405eb4a63ea9f064de92639b5'
    '37b0a14fb3951e6c3823f9f3c7ab6c98a7ef8ee9458a6cf8f10c8659b66a14a6d46da8d2c2105d2ccd47065e64c292e42a94a3ebd05b0bc3ed988c90bd322e29'
    'eca10a82232e9c0cebf60fa2577f519947cde8091072794a997a54b9c7109cc08d38b0e4119dda0e7ee9340b9b06b540b9e40ec0c7c27ec8868eea9e62d19a8c'
    'ef77412eb197af5874c61e4b8d6b41629d2715ff8e144fae44a8d03a8e93fb780b8bb4d4f6e81181c7057fe8a6801bb6c17f153cc974e46e94cef8e8e4273399'
    '3ad946ceb3f0065e2ec85316c1649bd1f6f96880aa26371c55ce99dc5edecb82995a2db3489b89e6960c0c7479be02baa3e5da32063b71ee1c7b9213de387ba2'
    '2a31ef14a1fc662a186779083fa27325fba9500749c42b0475840a59a33841e3c8fd36bad041ffd2d2b9b419fefd1a2a0963b0c25619667c2250edd5acc6da7b'
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s"                  \
        "$(git rev-list --count HEAD)"   \
        "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/opt/${pkgname/-git}" \
        -DBuildJK2SPEngine=on \
        -DBuildJK2SPGame=on \
        -DBuildJK2SPRdVanilla=on
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    _jkarch="${CARCH}"
    echo "${_jkarch}"

    install -m 755 -d "${pkgdir}/usr/bin"

    for _bin in 'openjk' 'openjk_sp' 'openjkded'; do
        cat > "${pkgdir}/usr/bin/${_bin}" << EOF
#!/bin/bash
cd /opt/${pkgname/-git}/JediAcademy
exec ./${_bin}.${_jkarch} \s@
EOF
        chmod +x ${pkgdir}/usr/bin/${_bin}
    done

    cat > "${pkgdir}/usr/bin/openjo" << EOF
#!/bin/bash
cd /opt/${pkgname/-git}/JediOutcast
exec ./openjo_sp.${_jkarch} \s@
EOF
    chmod +x ${pkgdir}/usr/bin/openjo

    install -Dm644 "${srcdir}/openjkmp.png" "${pkgdir}/usr/share/pixmaps/openjkmp.png"
    install -Dm644 "${srcdir}/openja.png" "${pkgdir}/usr/share/pixmaps/openja.png"
    install -Dm644 "${srcdir}/openjo.png" "${pkgdir}/usr/share/pixmaps/openjo.png"
    install -Dm755 "${srcdir}/openjkmp.desktop" "${pkgdir}/usr/share/applications/openjkmp.desktop"
    install -Dm755 "${srcdir}/openja.desktop" "${pkgdir}/usr/share/applications/openja.desktop"
    install -Dm755 "${srcdir}/openjo.desktop" "${pkgdir}/usr/share/applications/openjo.desktop"
}
