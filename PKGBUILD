# Maintainer: pikl <me@pikl.uk>
# Maintainer: POGMAN <adrian.maurin@gmail.com>

# Official Documentation: https://actualbudget.org/docs/install/
pkgname=actual-server
pkgver=25.3.0
pkgrel=1
pkgdesc="Actual Budget Server"
arch=('any')
url="https://github.com/actualbudget/actual"
license=('MIT')
depends=('yarn' 'nodejs')
makedepends=('git')
backup=("etc/conf.d/${pkgname}")
options=('!strip' '!debug')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.service"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
    "${pkgname}.conf"
)
sha256sums=('SKIP'
            '4b7d8705609d0538edc2827bbaa58088c310b4cb668e6ba03fdfc33818ec8635'
            '4dfa4502df8d72212ccfb96cfc2509c9a1461f542adb38304af54097b30ca0d5'
            'cba6a5df66a42ced857822e1099be00f2e37ec800f29cbbfca7210020140291b'
            '81a69c3376a1470c2f30aea4ebb3a354cf3c6a14679fa676e427e8b144d29f7c')
__gitpkg="${pkgname%-*}-${pkgver}"

build() {
    cd "${srcdir}/${__gitpkg}"
    yarn config set enableTelemetry 0
    yarn workspaces focus @actual-app/sync-server --production
}

package() {
    install -d -m 0755 "${pkgdir}/usr/share/webapps/${pkgname}"
    cd "${srcdir}/${__gitpkg}"
    cp -r {.,}* "${pkgdir}/usr/share/webapps/${pkgname}"

    install -d -m 0750 "${pkgdir}/var/lib/actual"

    cd "${srcdir}"
    install -D -m 0644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m 0644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -D -m 0644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m 0644 ${pkgname}.conf "${pkgdir}/etc/conf.d/${pkgname}"
}
