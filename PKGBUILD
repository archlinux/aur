# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=flaresolverr-git
_pkgname=flaresolverr
__pkgname=FlareSolverr
pkgver=2.2.8.r21.g36226b3
pkgrel=2
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=('x86_64')
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=('python' 'chromium' 'python-bottle' 'python-waitress' 'python-selenium' 'python-func-timeout' 'python-requests' 'python-websockets' 'python-xvfbwrapper')
makedepends=('git')
provides=('flaresolverr')
conflicts=('flaresolverr-bin')
install='flaresolverr.install'
source=("git+$url#branch=v3beta"
        "flaresolverr.service"
        "flaresolverr.sysusers"
        "flaresolverr.tmpfiles"
        "flaresolverr.install")
b2sums=('SKIP'
        'd4bd9d9b94bb010e84ce4c20d01b3892de0aa2ec5c1b0479d2a508a775c8cc6b402c3fe95e2a0684380d737ecd3d00074fefa2f44d4fa3c64087bdcb9fe443e2'
        'dcddece13d5e2f4cf67f67de656fd0b282c465c903221ce8f2194181e64323bb66e7b6e40738e4d04fdbb730a00f661d4b0725ae177a2adc333fa64faa2adb20'
        'a1c34e40611e30a86d6ead6bec5fea3ca217dd3b317c84967ffb6f187c35e00eedcfcebda64cbb8bc42ea96b778366e71be702aeab5f1f9d320fe087b6147474'
        '51d89f0c3bc9c0c66dfa56e6756e5e3525fad523f0f843a662684ccd288f958898257a4be00f92debf416203aabdbeeb75233e5d154da74f670e2cf10dbfd801')

pkgver() {
  cd $__pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/v//;s/-/./g'
}

package() {
  mkdir -p "$pkgdir/srv/http/$_pkgname"
  install -Dm644 flaresolverr.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  rm "${srcdir}/${__pkgname}/flaresolverr.service"
  install -Dm644 "${srcdir}/${__pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  rm "${srcdir}/${__pkgname}/LICENSE"
  cp -a "${srcdir}/${__pkgname}/". "${pkgdir}/srv/http/${_pkgname}"
  ln -s "/srv/http/${_pkgname}/src/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/flaresolverr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
