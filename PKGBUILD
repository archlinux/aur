# Maintainer: Jochem Broekhoff <(lastname) dot (firstname) @ gmail.com>
pkgname=marble-marcher-ce
_pkgtag=1.4.6
pkgver=${_pkgtag//[-v]/}
pkgrel=2
pkgdesc="A video game demo that uses a fractal physics engine and fully procedural rendering to produce beautiful and unique gameplay unlike anything you've seen before."
arch=('x86_64')
license=('GPL2')
url="https://github.com/WAUthethird/Marble-Marcher-Community-Edition"

depends=("sfml2"
         "anttweakbar"
         "glm"
         "eigen"
         "glew")

makedepends=("git"
             "cmake")

source=(
    "${pkgname}::git+https://github.com/WAUthethird/Marble-Marcher-Community-Edition#tag=${_pkgtag}"
    "0001-Optimize-CMakeLists-to-detect-SFML2.patch")
sha256sums=(
    "SKIP"
    "10f63aa36137ac5f1b7eec565fb1b072c6fc3c06764fe60890130f0bca17e883")

prepare() {
    cd "${pkgname}"

    # Patch CMakeLists.txt with the correct prefix
    # NOTE: This is a temporary solution
    sed -e "s/\\/home\\/MMCE/\\/usr\\/share\\/${pkgname}/" \
        -i "CMakeLists.txt"

    # Apply further custom patches
    patch -Np1 -i "$srcdir/0001-Optimize-CMakeLists-to-detect-SFML2.patch"
}

build() {
    cd "${pkgname}"

    cmake -S . -B build
    cmake --build build
}

package() {
    # General install
    DESTDIR="${pkgdir}/" cmake --install "${pkgname}"/build

    # Main binary symlink
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/MarbleMarcher" "${pkgdir}/usr/bin/${pkgname}"

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
