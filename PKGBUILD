# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2023.1.2'
pkgrel=5
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
_srcfile="JetBrains.Rider-${pkgver}.tar.gz"
source=("https://download-cf.jetbrains.com/rider/${_srcfile}")
sha256sums=('50eb2deb303162dc77c802c4402c2734bdae38a47ab534921e064a107dc284ae')

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
