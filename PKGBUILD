# Maintainer: pikl <me@pikl.uk>
# Maintainer: POGMAN <adrian.maurin@gmail.com>

# Official Documentation: https://actualbudget.org/docs/install/
_npmscope=@actual-app
_npmpkg=sync-server
_npmver=25.10.0

pkgname=actual-server
pkgver=${_npmver//-/_}
pkgrel=1
pkgdesc="Actual Budget server used for syncing across devices. Includes the web client."
arch=(x86_64)
url="https://actualbudget.org"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'python')
backup=("etc/conf.d/${pkgname}")
options=('!debug')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://registry.npmjs.org/${_npmscope}/${_npmpkg}/-/${_npmpkg}-${_npmver}.tgz"
    "${pkgname}.service"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
    "${pkgname}.conf"
)
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=(
    '8ebb9731bc69f77a1559944de1f0648f74df0e3984f1e02a2f1941f42474db61' # tgz
    '7359980edd568ddbaaef2a2d8c60fab277cb7f5d09372f72f8f1e0ee61df62f7' # service
    '041744d6403aa2cdf18a09d0e82d005203d11d56795c6738fbc4f9b0cccb2c12' # sysusers
    '8112d19ee07f43c8cd100796bb4b995f45f4304d5c78cfa21b6750c04a82b194' # tmpfiles
    '3c58a11ca5a57d0a640b852e3e24c0c19d5be52557743af0a93e384ad5851a0c' # conf
)

package() {
    npm install --no-fund -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"

    install -D -m 0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m 0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -D -m 0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m 0644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/conf.d/${pkgname}"

    install -D -m 0644 "${pkgdir}/usr/lib/node_modules/@actual-app/sync-server/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
