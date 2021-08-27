# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2021.2.1'
pkgrel=1
epoch=1
pkgdesc='A cross-platform C# IDE by JetBrains.'
arch=('x86_64')
options=('!strip' 'staticlibs')
url='https://www.jetbrains.com/rider/'
license=('Commercial')
optdepends=('mono: .NET runtime' 'msbuild: build .NET Core projects')
provides=('rider')
conflicts=('rider')

_installdir='/usr/share'
_pkgdir="JetBrains Rider-${pkgver}"
_srcfile="JetBrains.Rider-${pkgver}.tar.gz"
source=("https://download-cf.jetbrains.com/rider/${_srcfile}"
        'rider.desktop')
sha256sums=('955a41490203b1324ef09d73ed8f98735c956af8aed177fa45baf989b081b1ac'
            '6bb04056a20674c95dc5f103671bb8cd14910c6b7a4b80d9aa636e01d31ebdf1')

package() {
    cd "${srcdir}"

    install -d -m755 "${pkgdir}${_installdir}"
    cp -a "$_pkgdir" "${pkgdir}${_installdir}/${pkgname}"
    chown -R root:root "${pkgdir}${_installdir}/${pkgname}"

    install -d -m755 "$pkgdir"/usr/bin
    ln -s "${_installdir}/${pkgname}"/bin/rider.sh "${pkgdir}"/usr/bin/"${pkgname}"

    install -d -m755 "$pkgdir"/usr/share/applications
    sed -i "s#Version=#Version=${pkgver}#g" "${pkgname}.desktop"
    sed -i "s#Exec=#Exec=\"${_installdir}/${pkgname}/bin/rider.sh\" %f#g" "${pkgname}.desktop"
    sed -i "s/Comment=/Comment=${pkgdesc}/g" "${pkgname}.desktop"
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
}
