# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2019.2.3'
pkgrel=1
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
_pkgdir="JetBrains Rider-${pkgver}"
_srcfile="JetBrains.Rider-${pkgver}.tar.gz"
source=("https://download-cf.jetbrains.com/rider/${_srcfile}"
        'rider.desktop')
sha256sums=('23fd2bfc8ae7a87697d804b6ccd9c9ff8122e1a4ca366e1a8329ee8beb37798d'
            '91f41e1a5deae9f66bab7d7798a679a39350120aa229b4093415ef8269449714')

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
