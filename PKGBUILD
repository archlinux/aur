# Maintainer: a15355447898a <a15355447898a@outlook.com>

# The plain "comtool" name belongs to [extra] (the python package), so this
# prebuilt-bundle variant uses the usual -bin suffix. _upstream is the name the
# project itself uses: it is baked into the release tarball and into the
# launcher inside the PyInstaller bundle, so those two keep it.
pkgname=comtool-bin
_upstream=comtool
pkgver=3.4.1
pkgrel=1
pkgdesc="A cross platform serial debug tool written by python (upstream prebuilt bundle)"
arch=('x86_64')
url="https://github.com/Neutree/COMTool"
license=('LGPL-3.0-or-later')
depends=('glibc'
    'zlib'
    'libxcb'
    'libglvnd'
    'libdrm'
    'fontconfig'
    'freetype2')
makedepends=()
checkdepends=()
optdepends=()
provides=('COMTool')
conflicts=('COMTool' 'python-comtool')
options=('!debug')
install="${pkgname}.install"
source=("${_upstream}_ubuntu_v${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_upstream}_ubuntu_v${pkgver}.tar.xz"
    "${pkgname}.install")
sha256sums=('1f92aa43fac2f28f5a873d00864c031eb7ec158a950de92378a981f1e64df782'
    'adf8b608536716fc01d7644c016b41dd45060c564e9911bff0d2d522ea5629cb')

package() {
    # Upstream ships a self-contained PyInstaller onedir bundle (launcher +
    # _internal/) that has to stay in one directory, so it lives under /opt.
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/${_upstream}/." "${pkgdir}/opt/${pkgname}/"

    # The bundled Ubuntu fontconfig/freetype predate the syntax used by Arch's
    # fontconfig configuration and print parse errors on every start. The
    # system libraries are ABI-compatible with the bundled Qt, so use those.
    rm -f "${pkgdir}/opt/${pkgname}/_internal/libfontconfig.so.1" \
        "${pkgdir}/opt/${pkgname}/_internal/libfreetype.so.6"

    install -Dm0644 "${pkgdir}/opt/${pkgname}/_internal/assets/logo.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/io.github.neutree.${pkgname}.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=COMTool
Comment=Cross platform serial debug tool
Exec=/opt/${pkgname}/${_upstream} %U
Icon=${pkgname}
Categories=Development;Utility;
Terminal=false
StartupNotify=true
EOF
}
