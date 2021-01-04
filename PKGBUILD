# Maintainer: Jochem Broekhoff <(lastname) dot (firstname) @ gmail.com>
pkgname=marble-marcher-ce
_pkgtag=1.4.5
pkgver=$(echo "${_pkgtag}" | sed "s/-//;s/v//")
pkgrel=1
pkgdesc="A video game demo that uses a fractal physics engine and fully procedural rendering to produce beautiful and unique gameplay unlike anything you've seen before."
arch=('x86_64')
license=('GPL2')
url="https://github.com/WAUthethird/Marble-Marcher-Community-Edition"

depends=("sfml"
         "anttweakbar"
         "glm"
         "eigen"
         "glew")

makedepends=("git"
             "cmake")

source=("${pkgname}::git+https://github.com/WAUthethird/Marble-Marcher-Community-Edition#tag=${_pkgtag}")
sha256sums=("SKIP")

prepare() {
    # Patch CMakeLists.txt with the correct prefix
    # NOTE: This is a temporary solution
    sed -e "s/\\/home\\/MMCE/\\/usr\\/share\\/${pkgname}/" \
        -i "${pkgname}/CMakeLists.txt"
}

build() {
    cd "${pkgname}"

    mkdir -p build
    cd build
    cmake ..
    cd ..
    cmake --build build
}

package() {
    cd "${pkgname}/build"

    # General install
    DESTDIR="${pkgdir}/" make install

    # Launcher script
    mkdir -p "${pkgdir}/usr/bin"
    cat >"${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
cd "/usr/share/${pkgname}"
./MarbleMarcher                      
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Entry
    mkdir -p "${pkgdir}/usr/share/applications"
    cat >"${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=Marble Marcher: Community Edition
Icon=/usr/share/${pkgname}/images/MarbleMarcher.png
Exec=/usr/bin/${pkgname}
Categories=Game;
Terminal=false
EOF
    chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Licenses
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
