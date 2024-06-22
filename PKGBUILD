# Maintainer: Andreas Björkman <akb95@disroot.org>

_pkgname='armortools'
pkgname='armorpaint'
pkgver=0.9
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Software for 3D PBR texture painting"
url="https://armorpaint.org/"
license=('Zlib')
depends=('alsa-lib' 'opengl-driver' 'gtk3')
makedepends=('binutils' 'git' 'clang' 'make' 'gcc' 'vulkan-headers' 'libxinerama' 'libxrandr' 'libxi')
conflicts=('armorpaint-git')
source=("git+https://github.com/armory3d/armortools#tag=23.08"
        "armorpaint.sh"
        "armorpaint.desktop"
        "armorpaint.png"
        "zui_ext.c.patch"
        "zui_nodes.c.patch")
md5sums=('da1fc6cb5f29938dc18113e690c0621f'
         '74001d6c572fc79c96d0bee24427f7ba'
         'efecf7e2db8570fe494f47703927d67d'
         '67cf4a0cb08c66c4a68c677885e8ac99'
         '4d78293d603442d3e4ccf3afe2db53a8'
         '6d39eb7502da5c7bf4b74c4caa197630')

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/${_pkgname}"/armorcore/v8/libraries/linux/release
    ar x libv8_monolith.a

    cd "$srcdir/"
    cp zui_ext.c.patch "$srcdir/${_pkgname}"/armorcore/Sources/zui/zui_ext.c.patch
    cp zui_nodes.c.patch "$srcdir/${_pkgname}"/armorcore/Sources/zui/zui_nodes.c.patch

    cd "$srcdir/${_pkgname}"/armorcore/Sources/zui/
    patch zui_nodes.c zui_nodes.c.patch
    patch zui_ext.c zui_ext.c.patch

    cd "$srcdir/${_pkgname}/${pkgname}"

    ../armorcore/Kinc/make --from ../armorcore -g opengl --compiler clang --compile

    strip ../armorcore/Deployment/ArmorPaint
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p ${pkgdir}/usr/{bin,share,lib}
    mkdir -p ${pkgdir}/usr/lib/armorpaint
    install -Dm755 ${srcdir}/armorpaint.sh ${pkgdir}/usr/bin/armorpaint
    install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 armorcore/Deployment/ArmorPaint ${pkgdir}/usr/lib/armorpaint/
    install -Dm644 ${srcdir}/armorpaint.desktop ${pkgdir}/usr/share/applications/armorpaint.desktop
    mkdir -p ${pkgdir}/usr/share/armorpaint
    cp -r "${srcdir}/${_pkgname}"/armorpaint/build/krom ${pkgdir}/usr/share/armorpaint/krom
    install -Dm644 ${srcdir}/armorpaint.png ${pkgdir}/usr/share/icons/armorpaint.png
}
