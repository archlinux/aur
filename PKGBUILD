# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=rider-eap
_buildver=144.5342
_pkgver=1.0
_eap="True"
pkgver="${_pkgver}.${_buildver}"
pkgrel=1
pkgdesc="A cross-platform C# IDE by JetBrains."
arch=('any')
options=('!strip')
url="https://www.jetbrains.com/rider/"
license=("custom")
optdepends=('mono: .Net runtime')
# makedepends=("wget")
provides=("rider")
conflicts=("rider")
groups=("development" "IDE" "editor" "jetbrains")

source=("file://riderRS-${_buildver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('f49c806790d3fac2e629181da5e4d623c4b185e7138dd51b79df6ebd4c0ea506'
            'da5f1c679605da35ae1fce934bed2439f4454062dc7661d1676bdd6a1d777146')

package() {
    cd "${srcdir}"
    install -dm 755 \
        "${pkgdir}/opt/${pkgname}" \
        "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/licenses/${pkgname}/" \
        "${pkgdir}/usr/share/applications/"

    if [[ "True" = "${_eap}" ]]; then
        cp -R --no-preserve=ownership "${srcdir}/riderRS-${_buildver}/"* "${pkgdir}/opt/${pkgname}"
    # else
    fi

    if [[ "i686" = "${CARCH}" ]]; then
        rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
        rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
    fi

    sed -i "s/Version=/Version=${pkgver}/g" "${pkgname}.desktop"
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

    ln -s "/opt/${pkgname}/bin/rider.sh" "${pkgdir}/usr/bin/rider-eap"
}

