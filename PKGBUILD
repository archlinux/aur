# Maintainer: xaque <xaque at duck dot com>

pkgname=o3de-bin
pkgver=2111.2
_engver=21.11.2
pkgrel=2
pkgdesc='Open 3D Engine - An open-source, real-time 3D development engine'
arch=('x86_64')
license=('APACHE' "MIT")
url='https://o3de.org/'
depends=('clang' 'cmake' 'curl' 'fontconfig' 'gcc-libs' 'glibc' 'glu' 'libffi6' 'libglvnd' 'libxau' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'mesa' 'openssl' 'sdl2' 'zlib')
optdepends=('ninja: Support for multiple build configurations per project')
makedepends=('icoutils')
options=('!strip')
provides=('o3de')
install="${pkgname}.install"
source=("open-3d-engine.desktop"
        "${pkgname}-${pkgver}-x86_64.deb::https://o3debinaries.org/main/Latest/Linux/o3de_2111_2.deb"
        "o3de-releases.gpg::https://o3debinaries.org/main/Latest/Linux/o3de-releases.gpg"
        "LICENSE.txt::https://raw.githubusercontent.com/o3de/o3de/development/LICENSE.txt"
        "LICENSE_MIT.txt::https://raw.githubusercontent.com/o3de/o3de/development/LICENSE_MIT.TXT"
        "LICENSE_APACHE2.txt::https://raw.githubusercontent.com/o3de/o3de/development/LICENSE_APACHE2.TXT")
sha256sums=('SKIP'
            'c91644993afc54e06782f7159cbeaccf1c473667729c3bef059b3a4a4c331eee'
            'f27d4324d7fe38ed228e4e0218d5e988ecaf73e550210df4b897f99146def037'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    echo -n "    Verifying PGP for ${pkgname}-${pkgver}-x86_64.deb ..."
    gpgv --keyring "./o3de-releases.gpg" "${pkgname}-${pkgver}-x86_64.deb" >/dev/null 2>&1
    echo " Passed"
}

package() {
    echo -n "    Extracting data to /opt/O3DE ."
    tar -xzf data.tar.gz -C "${pkgdir}" --checkpoint=.50000
    echo " Done"

    if [ ! -d "${pkgdir}/opt/O3DE/${_engver}" ]; then
        echo "Expected O3DE ${_engver}. PKGBUILD may need to be updated for modified paths with a new major engine version. Aborting." 1>&2
        exit 1
    fi

    # Delete packaged versions of libssl and libcrypto to use system ones
    # Fixes libssh2 EVP_cast5_cbc issue (https://github.com/o3de/o3de/issues/4898)
    rm "${pkgdir}"/opt/O3DE/${_engver}/bin/Linux/profile/Default/libssl.so \
       "${pkgdir}"/opt/O3DE/${_engver}/bin/Linux/profile/Default/libssl.so.1.1 \
       "${pkgdir}"/opt/O3DE/${_engver}/bin/Linux/profile/Default/libcrypto.so \
       "${pkgdir}"/opt/O3DE/${_engver}/bin/Linux/profile/Default/libcrypto.so.1.1
    
    # Trying to create new project fails if launcher doesn't find clang-12
    # Force use of system clang with local symlink in PATH
    mkdir -p "${pkgdir}"/opt/O3DE/${_engver}/symbin
    ln -s $(which clang) "${pkgdir}"/opt/O3DE/${_engver}/symbin/clang-12
    ln -s $(which clang++) "${pkgdir}"/opt/O3DE/${_engver}/symbin/clang++-12
    ln -s $(which clang++) "${pkgdir}"/opt/O3DE/${_engver}/symbin/clang++-13

    # Script in /usr/bin to run o3de with modified env
    mkdir -p "${pkgdir}/usr/bin"
    echo '#!/bin/sh' >"${pkgdir}/usr/bin/o3de"
    echo "PATH=\""'$PATH'":/opt/O3DE/${_engver}/symbin\" CC=/opt/O3DE/${_engver}/symbin/clang-12 CXX=/opt/O3DE/${_engver}/symbin/clang++-12 /opt/O3DE/${_engver}/bin/Linux/profile/Default/o3de" >>"${pkgdir}/usr/bin/o3de"
    chmod +x "${pkgdir}/usr/bin/o3de"

    # Extract .ico and install icons
    icotool -x "${pkgdir}"/opt/O3DE/${_engver}/cmake/Platform/Windows/Packaging/product_icon.ico -o .
    iter=1
    for size in 256 128 64 48 32 16; do
        install -Dm644 "product_icon_${iter}_${size}x${size}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/o3de.png"
        ((iter++))
    done

    # Install desktop file
    install -Dm644 open-3d-engine.desktop "${pkgdir}"/usr/share/applications/open-3d-engine.desktop

    # Install license files
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm644 LICENSE_MIT.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_MIT.txt"
    install -Dm644 LICENSE_APACHE2.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_APACHE2.txt"

    # Fix warning for mismatched /opt permissions
    chmod --reference /opt "${pkgdir}"/opt
}
