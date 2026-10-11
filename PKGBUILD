# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rdborg
_pkgname=Mediarium
_appname=${_pkgname,,}
pkgname=${_appname}-bin

pkgver=3.0.0
pkgrel=1
_pkgvername=v${pkgver}

pkgdesc="Self-hosted media manager for movies, TV, music, ebooks and audiobooks: search, download and organise"

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://mediarium.app"
_gurl="https://github.com/${_pkgauthor}/${_pkgname}"
_gurlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('AGPL-3.0')

depends=('par2cmdline' 'p7zip')
conflicts=("${pkgname%-bin}")
provides=("${_appname}")

source=("${_appname}.sysusers"
        "${_appname}.tmpfiles")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${_gurl}/releases/download/${_pkgvername}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${_gurl}/releases/download/${_pkgvername}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('b9ed5becafa699a8c3f058473ccc997a853c63ed5ad1167716d1d3fc0e30dccf'
            '4227a0b0f667a3821d2924a84089f76df8d3b6c5dcd861ae0c881f942f04ca9a')
sha256sums_x86_64=('2478a7e26857970edfbc8ee61928fed3cb46b03e1bb8ee191c244583a4888a74')
sha256sums_aarch64=('0e84f2c8e34c80e2c9ddc835c79c3fb6e72dc5d8a0ab566468094e62c871f253')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

prepare() {
    cd "${srcdir}/${_appname}_${pkgver}_${_CARCH}/" || exit

    sed -e 's|/usr/local/|/usr/|g' -i "${_appname}.service"
}

package() {
    cd "${srcdir}/${_appname}_${pkgver}_${_CARCH}/" || exit

    install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 "${_appname}.env.example" "${pkgdir}/etc/${_appname}/${_appname}.env"

    install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

    install -Dm644 "../${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
    install -Dm644 "../${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"

    install -Dm644 "README-INSTALL.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "docs/INSTALL.md" "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
