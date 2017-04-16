# based on unigine-valley by ajs124 and meyithi

pkgname=unigine-superposition
_pkgname=Unigine_Superposition
pkgver=1.0
pkgrel=4
pkgdesc="Interactive Unigine Benchmark: walk through a lab of a lone professor"
arch=('x86_64')
url="http://www.unigine.com"
license=('custom:UNIGINE Engine')
depends=('libgl' 'gcc-libs' 'libxrandr' 'libxinerama' 'fontconfig' 'qt5-declarative' 'libxkbcommon-x11') #'openssl-1.0'
optdepends=('openal: sound support')
options=("!strip")
source=("https://assets.unigine.com/d/${_pkgname}-${pkgver}.run" "Superposition.desktop")
sha512sums=('1aa51b04381bedb0d3519f1ef90dcc77607b04b124ea3577dcc38eb8e609e5e8c2d21de4b4b19ca5d92542856d152fcec88d19d5b86fca307aa8f7e84f5b28b1'
            '7b37670e77088d05b639b9f6f67a6d88d0aafa8e67dfbe4ea23059c5a3422c58359f5d9642846eff3e0ce95253746997a95f8dcd8f44da13b5837618d5e1f000')
PKGEXT=.pkg.tar

build() {
    sh ${_pkgname}-${pkgver}.run --target ${pkgname} --noexec
}

package() {
    cd "${srcdir}/${pkgname}"
    # bulk data
    install -d "${pkgdir}/opt/${pkgname}"
    cp -R *    "${pkgdir}/opt/${pkgname}"/
    # launcher
    install -d "${pkgdir}/usr/bin"
    cat >> "${pkgdir}/usr/bin/unigine-superposition" << \here
#!/bin/sh
cd /opt/unigine-superposition/bin
./launcher
here
    chmod a+x "${pkgdir}/usr/bin/unigine-superposition"
    # misc
    install -Dm644 docs/Superposition_Benchmark_End-User_License_Agreement.pdf "${pkgdir}"/usr/share/licenses/${pkgname}/license
    install -Dm644 docs/Superposition_Benchmark_User_Manual.pdf "${pkgdir}"/usr/share/doc/${pkgname}/User_Manual.pdf
    install -Dm644 ../Superposition.desktop "${pkgdir}/usr/share/applications/Superposition.desktop"
    # icons
    for RES in 16 24 32 48 64 128 256
    do
        convert -resize ${RES}x${RES} Superposition.png Superposition_${RES}.png
        install -Dm644 Superposition_${RES}.png "${pkgdir}/usr/share/icons/hicolor/${RES}x${RES}/apps/Superposition_${RES}.png"

    done
}
