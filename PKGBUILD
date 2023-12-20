# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2023.3.2'
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

_installdir='/usr/share'
_pkgdir="JetBrains Rider-${pkgver}"
_srcfile="JetBrains.Rider-${pkgver}"
source_x86_64=("https://download-cf.jetbrains.com/rider/${_srcfile}.tar.gz")
sha256sums_x86_64=('22a35999146be6677260e603cf6af06dbbfa4c2d6e6ec653b2a9e322f954924d')
source_aarch64=("https://download-cf.jetbrains.com/rider/${_srcfile}-aarch64.tar.gz")
sha256sums_aarch64=('f73dc36e2c6eca10ea734e2f0c2e89a569bcd84d40092771681214578f5e3978')

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
