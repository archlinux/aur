# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.mtbeclipse and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

pkgname=modustoolbox-eclipse
pkgver=2026.9.1.1069
pkgrel=1
pkgdesc="Custom Eclipse IDE for ModusToolbox development."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('alsa-lib' 'glibc' 'lib32-glibc' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'python' 'gtk3' 'libgcc' 'libstdc++' 'jre25-openjdk')
makedepends=('patchelf')
optdepends=('webkit2gtk-4.1')
options=('!strip' '!debug' 'staticlibs')
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.mtbeclipse"
_source="mtbeclipse_${pkgver}_Linux_x64.deb"
source=("file://${_source}")
sha256sums=('e3b623889e0883cc0aac16ab4ccece9f7711fb764b6219731d6ec6136b092aca')


prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst
    rm data.tar.zst
    install -d usr/lib
    mv opt/Tools/ModusToolboxEclipse usr/lib/${pkgname}

    # Vendor plugins require Java 23; use a supported system LTS runtime.
    rm -r usr/lib/${pkgname}/jre
    sed -i 's|../../jre/bin/java|/usr/lib/jvm/java-25-openjdk/bin/java|' \
        usr/lib/${pkgname}/ide/eclipse/modustoolbox-eclipse.ini
    # Keep bundled clang library lookup without searching the current directory.
    patchelf --set-rpath '$ORIGIN/../lib' usr/lib/${pkgname}/clangd/bin/clangd
    # JNA selects only linux-x86-64 natives on this package architecture.
    local native
    for native in usr/lib/${pkgname}/ide/eclipse/plugins/com.sun.jna_*/com/sun/jna/*/libjnidispatch.* \
                  usr/lib/${pkgname}/ide/eclipse/plugins/com.sun.jna_*/com/sun/jna/*/jnidispatch.dll; do
        [[ -f "${native}" ]] || continue
        [[ "${native}" == */linux-x86-64/* ]] || rm -r "${native%/*}"
    done
    sed -i "s|/opt/Tools/ModusToolboxEclipse|/usr/lib/${pkgname}|g" \
        usr/share/applications/Eclipse-for-ModusToolbox-${pkgver}.desktop
}

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
    install -d "${pkgdir}/opt/Tools"
    ln -s /usr/lib/${pkgname} "${pkgdir}/opt/ModusToolboxEclipse"
    ln -s /usr/lib/${pkgname} "${pkgdir}/opt/Tools/ModusToolboxEclipse"

    install -Dm644 "${srcdir}/usr/share/doc/Eclipse-for-ModusToolbox-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
