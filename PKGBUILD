# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2024.2.6'
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
sha256sums_x86_64=('0f322e17fd0d2692ffd19c91c5d9c368c0846742406c413e1cfb14375f3faf4b')
source_aarch64=("https://download-cf.jetbrains.com/rider/${_srcfile}-aarch64.tar.gz")
sha256sums_aarch64=('9d53865edae2d5da86298840c05969d53abb9b6c68a4ef6ca0908eb5289c50ce')

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
