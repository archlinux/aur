# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2025.1.2'
pkgrel=2
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

_installdir='/usr/share'
_pkgdir="JetBrains Rider-${pkgver}"
_srcfile="JetBrains.Rider-${pkgver}"
source_x86_64=("https://download-cf.jetbrains.com/rider/${_srcfile}.tar.gz")
sha256sums_x86_64=('cdf8a824c7daa3247b09d76a29acb31cfa623b90643d3d2a814982cb0a32879d')
source_aarch64=("https://download-cf.jetbrains.com/rider/${_srcfile}-aarch64.tar.gz")
sha256sums_aarch64=('c1ad139252fd3158aa86e9ac4532db5d9dd653807fc9f1dc4458170f3f1c3de6')

package() {
    cd "${srcdir}"

    install -d -m755 "${pkgdir}${_installdir}"
    cp -a "$_pkgdir" "${pkgdir}${_installdir}/${pkgname}"
    chown -R root:root "${pkgdir}${_installdir}/${pkgname}"

    install -d -m755 "$pkgdir"/usr/bin
    ln -s "${_installdir}/${pkgname}"/bin/rider.sh "${pkgdir}"/usr/bin/"${pkgname}"

    install -d -m755 "$pkgdir"/usr/share/applications
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "${_installdir}/${pkgname}/bin/rider.sh %f" --icon "${_installdir}/${pkgname}/bin/rider.png"
    echo "StartupWMClass=jetbrains-rider" >> "${pkgname}.desktop"
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
}
