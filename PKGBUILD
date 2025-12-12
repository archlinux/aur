# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2025.3.0.4'
pkgrel=1
epoch=1
pkgdesc='A cross-platform .NET IDE by JetBrains.'
arch=('x86_64' 'aarch64')
options=('!strip' 'staticlibs')
url='https://www.jetbrains.com/rider/'
license=('Commercial')
makedepends=('gendesk')
optdepends=('mono: .NET runtime' 'msbuild: build .NET Core projects')
provides=('rider')
conflicts=('rider')

_pkgdir="JetBrains Rider-${pkgver}"
_srcfile="JetBrains.Rider-${pkgver}"
source_x86_64=("https://download-cf.jetbrains.com/rider/${_srcfile}.tar.gz")
sha256sums_x86_64=('ff9a6064aef78ab35f6c1e3544d70d6ab38b6f9af919fdeae9be98942dae8f8f')
source_aarch64=("https://download-cf.jetbrains.com/rider/${_srcfile}-aarch64.tar.gz")
sha256sums_aarch64=('dadb847fc78aaca3542b450770baf7e2030ba61198134c45dfc46a08e6db6b66')

package() {
    install_base="/opt"
    install_dir="${install_base}/${pkgname}"

    build_install_base="${pkgdir}${install_base}"
    build_install_dir="${pkgdir}${install_dir}"

    install -d -m755 "${build_install_base}"
    cp -a "$_pkgdir" "${build_install_dir}"
    chown -R root:root "${build_install_dir}"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s "${install_dir}/bin/rider.sh" "${pkgdir}/usr/bin/${pkgname}"

    build_desktop_dir="${pkgdir}/usr/share/applications"
    install -d -m755 "${build_desktop_dir}"
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "${install_dir}/bin/rider.sh %f" --icon "${install_dir}/bin/rider.png"
    echo "StartupWMClass=jetbrains-rider" >> "${pkgname}.desktop"
    install -m644 "${pkgname}.desktop" "${build_desktop_dir}"
}
