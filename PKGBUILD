# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=flaresolverr
_pkgname=FlareSolverr
pkgver=3.3.12
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=('any')
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=('chromium' 'python-bottle' 'python-waitress' 'python-selenium' 'python-func-timeout'
         'python-pefile' 'python-requests' 'python-websockets' 'python-xvfbwrapper'
         'python-prometheus_client')
# checkdepends=('python-webtest')
conflicts=('flaresolverr-bin' 'flaresolverr-git')
install='flaresolverr.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "flaresolverr.service"
        "flaresolverr.sysusers"
        "flaresolverr.tmpfiles"
        "flaresolverr.install")
sha256sums=('a91a4a0438605189e9e3a2b712cad48bdf9ab721d3723773d61d491a4fa27d86'
            'c147d51e7fd78e5e2b4648db5d1052a36b151559bfa08aa7776bd34aa0897bd0'
            '62f114d4e559cf9dae22bfd90759eff697e42da5f700a52988e70e78f3048ae2'
            '4a61a6d9db1a9f4ec0812d86ef524a7f575a45f272404f0ebfc79376628feeb2'
            'f3585f385fe8dd2d619144b8e666f1883d3501ce05d81e7c3ed4a57f0d093e85')


# check() {
#     cd "${srcdir}/${_pkgname}/src"
#
#     python tests.py
#     python tests_sites.py
# }

package() {
    cd "${pkgdir}"

    install -dm755 "opt/${pkgname}"

    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${srcdir}/${_pkgname}-${pkgver}/LICENSE"

    install -Dm644 "${srcdir}/flaresolverr.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # Checks one directory above src/
    # We don't want that
    sed -i "s/os.pardir, //" "${srcdir}/${_pkgname}-${pkgver}/src/utils.py"

    cp -a "${srcdir}/${_pkgname}-${pkgver}/src/"* "${pkgdir}/opt/${pkgname}"
    cp "${srcdir}/${_pkgname}-${pkgver}/package.json" "${pkgdir}/opt/${pkgname}"

    install -Dm644 "${srcdir}/flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/flaresolverr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
