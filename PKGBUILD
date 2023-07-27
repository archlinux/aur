# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Conributor: fordperfect (AUR user)
# Based on unigine-valley by ajs124 and meyithi

pkgname=unigine-superposition
_pkgname=Unigine_Superposition
pkgver=1.1
pkgrel=4
pkgdesc="Interactive Unigine Benchmark: walk through a lab of a lone professor"
arch=('x86_64')
url="https://benchmark.unigine.com/superposition"
license=('custom:UNIGINE Engine')
depends=(
    'dbus'
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glib2'
    'hicolor-icon-theme'
    'libgl'
    'libice'
    'libsm'
    'libxcb'
    'libxext'
    'libxi'
    'libxinerama'
    'libxrandr'
    'libxrender'
    'libx11'
    'qt5-base'
    'sh'
    'zlib'
)
options=('!strip')
_tarname="${_pkgname}-${pkgver}.run"
source=("${_tarname}::https://assets.unigine.com/d/${_tarname}" "Superposition.desktop")
noextract=("${_tarname}")
b2sums=('f0447b0ccd860e653c2308637c93ed29ec851ff9923251edbd37a14b021149038f1c252deb0f3c4954fd4508883b1a2994a87b34a5e18902cef6c82c6ccc6b6b'
        '1d9987b5a910b86dac2e252c3187a6a07095da81d06dfafbd2c16bcacb72f602c183334fb6b3c03c7b35418f8dc6e4f2d34a44ab22831d66b67d9e5ed45bc93e')
PKGEXT=.pkg.tar

prepare() {
    sh "${_tarname}" --noexec --nox11 --target "${pkgname}"
}

build() {
    mkdir bin
    cat >> "${srcdir}/bin/unigine-superposition" << \here
#!/bin/sh
cd /opt/unigine-superposition/bin
./launcher
here
}

package() {
    cd "${srcdir}/${pkgname}"

    # bulk data
    install -v -dm755 "${pkgdir}/opt/${pkgname}"
    cp -Rv *    "${pkgdir}/opt/${pkgname}"/

    # launcher
    install -v -Dm755 "${srcdir}/bin/unigine-superposition" -t "${pkgdir}/usr/bin"

    # fix openssl1.0 stuff
    mv -v "${pkgdir}/opt/${pkgname}/bin/qt/lib/libcrypto.so"{,.1.0.0}
    find "${pkgdir}/opt/${pkgname}/bin/qt" -name "*.so*" -exec chmod a+x {} \;
    ln -sv /opt/unigine-superposition/bin/qt/lib/libcrypto.so.1.0.0 "${pkgdir}/opt/${pkgname}/bin/qt/lib/libcrypto.so"

    # remove unneeded install scripts
    rm -v "${pkgdir}/opt/${pkgname}/"*install.sh

    # misc
    install -v -Dm644 docs/Superposition_Benchmark_End-User_License_Agreement.pdf "${pkgdir}"/usr/share/licenses/${pkgname}/license
    install -v -Dm644 docs/Superposition_Benchmark_User_Manual.pdf "${pkgdir}"/usr/share/doc/${pkgname}/User_Manual.pdf
    install -v -Dm644 ../Superposition.desktop "${pkgdir}/usr/share/applications/Superposition.desktop"
    # icons
    for RES in 16 24 32 48 64 128 256
    do
        install -v -Dm644 icons/superposition_icon_${RES}.png "${pkgdir}/usr/share/icons/hicolor/${RES}x${RES}/apps/Superposition.png"
    done
}
