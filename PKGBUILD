# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=flaresolverr
_pkgname=FlareSolverr
pkgver=3.5.2
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=(any)
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=(
  chromium
  python
  python-bottle
  python-certifi
  python-func-timeout
  python-packaging
  python-pefile
  python-prometheus_client
  python-requests
  python-selenium
  python-waitress
  python-websockets
  python-xvfbwrapper
)
install=flaresolverr.install
options=(!debug)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  flaresolverr.service
  flaresolverr.sysusers
  flaresolverr.tmpfiles
  flaresolverr.install
)
sha256sums=('e83ffb2e7f8b95769d33fad7848ea31c3a84d2e0a7771f7536209457ea03661c'
            '8f71d609bf31ec88930bf582e1fda0d894bbb4fe6b2049fdf6e98703830cc15c'
            '62f114d4e559cf9dae22bfd90759eff697e42da5f700a52988e70e78f3048ae2'
            '4a61a6d9db1a9f4ec0812d86ef524a7f575a45f272404f0ebfc79376628feeb2'
            '35881784db47d88cf6a3ee33e831f3655183c248282a348595bef013c7695f54')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Checks one directory above src/
  # We don't want that
  sed -i 's/os.pardir, //' src/utils.py
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm LICENSE

  cp -dr "${srcdir}/${_pkgname}-${pkgver}/src/"* "${pkgdir}/opt/${pkgname}"
  cp package.json "${pkgdir}/opt/${pkgname}"

  install -Dm644 "${srcdir}/flaresolverr.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/flaresolverr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
