# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=flaresolverr
_pkgname=flaresolverr
__pkgname=FlareSolverr
pkgver=3.0.1
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=('x86_64')
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=('python>=3.10.0' 'chromium' 'python-bottle' 'python-waitress' 'python-selenium' 'python-func-timeout' 'python-requests' 'python-websockets' 'python-xvfbwrapper')
# makedepends=('python-webtest')
install='flaresolverr.install'
source=("git+https://github.com/FlareSolverr/FlareSolverr.git#tag=v$pkgver"
        "flaresolverr.service"
        "flaresolverr.sysusers"
        "flaresolverr.tmpfiles"
        "flaresolverr.install")
sha512sums=('SKIP'
            'bf13516d2de87e10266367011add60287b2a68c5cdcd3da01de44ddc74a46174a04ec6a30252003dd8fd0ec7e4e17e8b0f4df565dac053ef8792783d86f3e33d'
            '0423d10d964a187e5a153140597e7cee3a6112bf6569dfcda7848bfbce4e5660534db3bdbe4a4de9a63fbf0ecc2b874937afd94495691f76176243d2ac4b080d'
            'f27805d81e19547862f5e8ebf18633dd400543ebd85566301386dc143ad2de1920dd6c37d1ae38623221dcb42edecdd6b753ccfd20ad33e92a4633cfb7a50548'
            'e12ca34e2f66524d15da36cdebea300ae061a16c8a4d7147ab0cea11cb70879d0d3061c9c852dec9593f348bc8507055f1868cfe754e2e5f92db4466ca3ec2a1')


# check() {
#     cd "${srcdir}/${__pkgname}/src"
#
#     python tests.py
#     python tests_sites.py
# }

package() {
    cd "${pkgdir}"

    install -dm755 "opt/${_pkgname}"

    install -Dm644 "${srcdir}/${__pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    rm "${srcdir}/${__pkgname}/LICENSE"

    install -Dm644 "${srcdir}/flaresolverr.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    # Checks one directory above src/
    # We don't want that
    sed -i "s/os.pardir, //" "${srcdir}/${__pkgname}/src/utils.py"

    cp -a "${srcdir}/${__pkgname}/src/"* "${pkgdir}/opt/${_pkgname}"
    cp "${srcdir}/${__pkgname}/package.json" "${pkgdir}/opt/${_pkgname}"

    install -Dm644 "${srcdir}/flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${srcdir}/flaresolverr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
