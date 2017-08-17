# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2017.1'
pkgrel=2
epoch=1
pkgdesc='A cross-platform C# IDE by JetBrains.'
arch=('any')
options=('!strip')
url='https://www.jetbrains.com/rider/'
license=('Commercial')
optdepends=('mono: .NET runtime' 'msbuild-15-bin: build .NET Core projects')
provides=('rider')
conflicts=('rider')

_installdir='/usr/share'
_pkgdir="Rider-${pkgver}"
_srcfile="JetBrains.Rider-${pkgver}.tar.gz"
source=("https://download-cf.jetbrains.com/resharper/${_srcfile}"
        'rider.desktop')
sha256sums=('f018c9bda072adac8e83af16ee200f8a9364c2245cf71649ad1a9e05e81268ed'
            'd039d85d40fcf03e2694d7321151984de6209596290a3d8257a6f1c3c780a5df')

package() {
    cd "${srcdir}"

    install -d -m755 "${pkgdir}${_installdir}"
    cp -a "$_pkgdir" "${pkgdir}${_installdir}/${pkgname}"
    chown -R root:root "${pkgdir}${_installdir}/${pkgname}"

    install -d -m755 "$pkgdir"/usr/bin
    ln -s "${_installdir}/${pkgname}"/bin/rider.sh "${pkgdir}"/usr/bin/"${pkgname}"

    install -d -m755 "$pkgdir"/usr/share/applications
    sed -i "s#Version=#Version=${pkgver}#g" "${pkgname}.desktop"
    sed -i "s#Icon=#Icon=${_installdir}/${pkgname}/bin/rider.png#g" "${pkgname}.desktop"
    sed -i "s#Exec=#Exec=\"${_installdir}/${pkgname}/bin/rider.sh\" %f#g" "${pkgname}.desktop"
    sed -i "s/Comment=/Comment=${pkgdesc}/g" "${pkgname}.desktop"
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
}
