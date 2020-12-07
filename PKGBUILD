# Maintainer: dszryan
# Contributor: Bryce Beagle <first dot last at gmail dot com>
# Contributor: Giampaolo Mancini <mancho at trmpln dot com>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

# https://download.jetbrains.com/rider/JetBrains.Rider-2020.3-EAP10-203.5981.86.Checked.tar.gz
pkgname=rider-eap
eapver=2020.3
eaprelease=10
pkgver=203.5981.86
_dlver="${eapver}-EAP${eaprelease}-${pkgver}.Checked"
pkgrel=2
epoch=1
pkgdesc="A cross-platform C# IDE by JetBrains."
arch=('any')
options=('!strip' 'staticlibs')
url="https://www.jetbrains.com/rider/eap/"
license=("custom")
optdepends=('mono: .NET runtime' 'msbuild-15-bin: build .NET Core projects')
provides=("rider-eap")
groups=("development" "IDE" "editor" "jetbrains")

source=("https://download.jetbrains.com/rider/JetBrains.Rider-${_dlver}.tar.gz"
        "${pkgname}.desktop"
        "ResharperHost-runtime-folder.sh")
sha256sums=('4f081b76b01775fa3ad3dcac253423c16ef682590fd148b7e22df3a94619e9ed'
            'ada362803d6d2b5ff84680277694d0ecdcb97d46f85d140f79850500966f1ecf'
            '4bc086ff245cf18c5fd2351008b05a0d0e792e8af0394fb094a9118c312c373d')

package() {
    cd "${srcdir}"
    install -dm 755 \
        "${pkgdir}/usr/share/${pkgname}" \
        "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/applications/" \
        "${pkgdir}/usr/share/licenses/${pkgname}/"

    cp -R --no-preserve=ownership "${srcdir}/JetBrains Rider-${pkgver}/"* "${pkgdir}/usr/share/${pkgname}"
    cp -R --no-preserve=ownership "${srcdir}/JetBrains Rider-${pkgver}/license/"* "${pkgdir}/usr/share/licenses/${pkgname}"

    if [ -n ${DOTNET_ROOT} ]; then
        # assumption if DOTNET_ROOT is set, we will use that version instead of the bundled version
        runtimeFolder=$(${srcdir}/../ResharperHost-runtime-folder.sh)
        find ${pkgdir}/usr/share/${pkgname}/lib/ReSharperHost -maxdepth 1 -type d \( -name "*-x64*" -or -name "*-arm*" -or -name "*-x86*" \) -and -not \( -name "*symref" -or -name "$runtimeFolder" \) -exec rm -rf {} \;

        #dotnet
        if [ -f "${DOTNET_ROOT}/dotnet" ]; then
            rm "${pkgdir}/usr/share/${pkgname}/lib/ReSharperHost/${runtimeFolder}/dotnet"/dotnet
            ln -s "${DOTNET_ROOT}"/dotnet "${pkgdir}/usr/share/${pkgname}/lib/ReSharperHost/${runtimeFolder}/dotnet"/dotnet
        fi

        #host
        if [ -d "${DOTNET_ROOT}/host" ]; then
            rm -rf "${pkgdir}/usr/share/${pkgname}/lib/ReSharperHost/${runtimeFolder}/dotnet"/host
            ln -s "${DOTNET_ROOT}"/host "${pkgdir}/usr/share/${pkgname}/lib/ReSharperHost/${runtimeFolder}/dotnet"/host
        fi

        #shared
        if [ -d "${DOTNET_ROOT}/shared" ]; then
            rm -rf "${pkgdir}/usr/share/${pkgname}/lib/ReSharperHost/${runtimeFolder}/dotnet"/shared
            ln -s "${DOTNET_ROOT}"/shared "${pkgdir}/usr/share/${pkgname}/lib/ReSharperHost/${runtimeFolder}/dotnet"/shared
        fi
    fi

    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    ln -s "/usr/share/${pkgname}/bin/rider.sh" "${pkgdir}/usr/bin/rider-eap"
}
