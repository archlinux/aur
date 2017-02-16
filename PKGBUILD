# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=rider-eap
_buildver=171.3085.362
_pkgver=1.0
_eap="True"
pkgver="${_pkgver}.${_buildver}"
pkgrel=1
pkgdesc="A cross-platform C# IDE by JetBrains."
arch=('any')
options=('!strip')
url="https://www.jetbrains.com/rider/"
license=("custom")
optdepends=('mono: .NET runtime')
makedepends=("wget")
provides=("rider")
conflicts=("rider")
groups=("development" "IDE" "editor" "jetbrains")

_srcfile="riderRS-${_buildver}.tar.gz"
source=("https://download.jetbrains.com/resharper/${_srcfile}"
        "${pkgname}.desktop")
sha256sums=($(wget -q "${source}.sha256" && cat "${_srcfile}.sha256" | cut -f1 -d" ")
            'f9311f901c27f3dc17dc9e9ede3698ccfda8f9e07a9827d174655e90d352e734')

package() {
    cd "${srcdir}"
    install -dm 755 \
        "${pkgdir}/opt/${pkgname}" \
        "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/applications/"

    if [[ "True" = "${_eap}" ]]; then
        cp -R --no-preserve=ownership "${srcdir}/Rider-${_buildver}/"* "${pkgdir}/opt/${pkgname}"
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

