# $Id$
# Maintainer: Andreas Björkman <akb95@disroot.org>
# Contributor: Julio Campagnolo <juliocampagnolo@gmail.com>

pkgname=('armorpaint-git')
_pkgname='armorpaint'
pkgver=1.0alpha.r4232.ga65e7d82
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="ArmorPaint is a software for 3D PBR texture painting"
url="https://armorpaint.org/"
license=('Zlib')
depends=('mesa' 'alsa-lib' 'libxinerama' 'gcc-libs' 'nodejs')
makedepends=('git' 'clang' 'make' 'gcc' 'gtk3' 'vulkan-headers')
provides=('armorpaint')
conflicts=('armorpaint')
source=("git+https://github.com/armory3d/armortools"
        "armorpaint.desktop"
        "armorpaint.png"
        "armorpaint.sh")
sha256sums=(SKIP
         '325857205ed9fc48bf787a36626f19c20f7d688ee184c749fe9470f913ce0d4a'
         'e780b3093d5dd9bea1d7e17959cc678ca35a8b41f272a59218c4b14be8d8dea7'
         '891771901064e3d718c7a14ae61d55458429d4b56207b29265ce433aab02e1e8')

pkgver() {
  cd "${srcdir}"/armortools/"${_pkgname}"
  ver=$(grep -Po '(^|\s)+(let manifest_version: string =)(\s)+\"\K(([a-z0-9|\.]\s*)+)' 'sources/manifest.ts')
  ver=$(sed -E 's/\s//m;t' <<< $ver)
  printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}"/armortools
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}"/armortools/"${_pkgname}"
    ../armorcore/make --graphics opengl --release --compile
    strip build/Release/ArmorPaint
}

package() {
    cd "${srcdir}"/armortools/"${_pkgname}"
    mkdir -p ${pkgdir}/usr/{bin,share,lib}
    mkdir -p ${pkgdir}/usr/lib/armorpaint/data
    mkdir -p ${pkgdir}/usr/share/armorpaint
    install -Dm755 ${srcdir}/armorpaint.sh ${pkgdir}/usr/bin/armorpaint
    install -Dm755 ${srcdir}/armortools/"${_pkgname}"/build/Release/ArmorPaint ${pkgdir}/usr/bin/ArmorPaint
    install -Dm644 ../license.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${srcdir}/armorpaint.desktop ${pkgdir}/usr/share/applications/armorpaint.desktop
    install -Dm644 ${srcdir}/armorpaint.png ${pkgdir}/usr/share/icons/armorpaint.png
    cp -R ${srcdir}/armortools/"${_pkgname}"/build/out/data ${pkgdir}/usr/lib/armorpaint/
    chmod -R 755 ${pkgdir}/usr/lib/armorpaint/data
}
