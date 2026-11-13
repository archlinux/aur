# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=openq4-bin
_pkgname=openq4
pkgver=0.14.1
_q4ver=1.4.2
pkgrel=1
pkgdesc="Open-source Quake 4 engine and game code replacement (binary release). You need the retail Quake 4 data to play."
arch=('x86_64' 'aarch64')
url="https://github.com/themuffinator/openQ4"
license=('GPL-3.0-or-later' 'LicenseRef-Quake4-SDK' 'LicenseRef-Quake4-EULA')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libgl' 'libx11' 'libxcursor' 'libxext' 'libxi' 'libxrandr' 'openal')
optdepends=('quake4-data: retail Quake 4 data in /opt/quake4 (otherwise a Steam/GOG install is detected)'
            'vulkan-icd-loader: experimental Vulkan renderer (r_renderApi vulkan)'
            'wayland: native Wayland video'
            'libxkbcommon: native Wayland keyboard input'
            'libdecor: Wayland window decorations')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip' '!debug')
install=${pkgname}.install
source=("openq4.sh"
        "https://aur.slashbunny.com/quake4/quake4-linux-${_q4ver}.x86.run")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64-preview.tar.xz")
noextract=("quake4-linux-${_q4ver}.x86.run")
sha256sums=('15423ab60c6a738fa92926d994e63c12ea71a59a7b0fd50a62283d964b882f4b'
            '9203b387b1a4075a1b9ad1eb7be32b49a88141a448d9330d9cbe1f40a145bd6a')
sha256sums_x86_64=('8ff29f91fe3bbf1e8ae7ff45dfcdf7b7530d3f69a9b11f37ecb33fb9bd39aef8')
sha256sums_aarch64=('563a437e45edf8108eeda9f90fd3497a3eb3520fe9c2c11ce36b885e507d3c80')

# Upstream names its binaries and modules by architecture tag.
case "${CARCH}" in
    x86_64)  _arch=x64 ;;
    aarch64) _arch=arm64 ;;
esac

prepare() {
    # Unpack the Quake 4 1.4.2 Linux point release (makeself archive) for its
    # patch paks. openQ4 requires pak013.pk4 - pak022.pk4, which the
    # quake4-data-* packages leave out.
    rm -rf "quake4-${_q4ver}"
    sh "quake4-linux-${_q4ver}.x86.run" --noexec --nox11 --target "quake4-${_q4ver}"
}

package() {
    local _q4dir="${srcdir}/quake4-${_q4ver}"

    # The arm64 archive carries a -preview suffix.
    cd "${srcdir}/${_pkgname}-${pkgver}-linux-${_arch}"*/

    # Install engine, renderers and openQ4 runtime content
    install -D -m 755 -t "${pkgdir}/opt/${_pkgname}/" \
        "openQ4-client_${_arch}" "openQ4-ded_${_arch}" renderer-*_"${_arch}".so
    install -D -m 644 -t "${pkgdir}/opt/${_pkgname}/" VERSION.txt
    install -D -m 755 -t "${pkgdir}/opt/${_pkgname}/baseoq4/" baseoq4/*.so
    install -D -m 644 -t "${pkgdir}/opt/${_pkgname}/baseoq4/" baseoq4/*.pk4 baseoq4/mod.json
    # Startup splash, loaded relative to the working directory
    install -D -m 644 -t "${pkgdir}/opt/${_pkgname}/assets/splash/" assets/splash/*.bmp

    # Install Quake 4 1.4.2 patch paks into the q4base overlay
    install -D -m 644 -t "${pkgdir}/opt/${_pkgname}/q4base/" \
        "${_q4dir}"/q4base/pak0??.pk4 \
        "${_q4dir}"/q4base/q4cmp_pak001.pk4 \
        "${_q4dir}"/q4base/zpak_english_0?.pk4 \
        "${_q4dir}"/us/q4base/*.pk4

    # Install launcher and its dedicated server / Steam Deck aliases
    sed "s/@ARCH@/${_arch}/g" "${srcdir}/openq4.sh" > "${srcdir}/openq4"
    install -D -m 755 "${srcdir}/openq4" "${pkgdir}/usr/bin/openq4"
    ln -s openq4 "${pkgdir}/usr/bin/openq4-dedicated"
    ln -s openq4 "${pkgdir}/usr/bin/openq4-steamdeck"

    # Install desktop files, pointed at the launcher
    for _desktop in share/applications/*.desktop; do
        sed -e 's/^Exec=openQ4-steamdeck/Exec=openq4-steamdeck/' \
            -e 's/^Exec=openQ4-client_.*/Exec=openq4/' "${_desktop}" > "${srcdir}/${_desktop##*/}"
        install -D -m 644 "${srcdir}/${_desktop##*/}" "${pkgdir}/usr/share/applications/${_desktop##*/}"
    done

    # Install icons
    for _icon in share/icons/hicolor/*/apps/openq4.*; do
        install -D -m 644 "${_icon}" "${pkgdir}/usr/${_icon}"
    done

    # Install documentation
    install -d "${pkgdir}/usr/share/doc/${_pkgname}"
    install -m 644 README.html CONTRIBUTORS.md LICENSING.md "${pkgdir}/usr/share/doc/${_pkgname}/"
    cp -r --no-preserve=ownership docs "${pkgdir}/usr/share/doc/${_pkgname}/"

    # Install licenses (openQ4 GPL, Quake 4 SDK EULA and notices, id Software license for the patch paks)
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/licenses/" licenses/*
    install -D -m 644 "${_q4dir}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Quake4-License.txt"
}
