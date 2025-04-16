# Maintainer: pikl <me@pikl.uk>
# Maintainer: POGMAN <adrian.maurin@gmail.com>

# Official Documentation: https://actualbudget.org/docs/install/
pkgname=actual-server
pkgver=25.4.0
pkgrel=3
pkgdesc="Actual Budget Server"
arch=('any')
url="https://github.com/actualbudget/actual"
license=('MIT')
depends=('yarn' 'nodejs')
makedepends=('git' 'npm')
backup=("etc/conf.d/${pkgname}")
options=('!strip' '!debug')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.service"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
    "${pkgname}.conf"
)
sha256sums=('9e27d36318617d0ce2ff05891e0eeccab2a8c245d624608f13000bf9526ddf6a'
            '9a09ef74fe190d655f91d13cb3305a2943d191ef939e6b21944ea860ba977f70'
            '4dfa4502df8d72212ccfb96cfc2509c9a1461f542adb38304af54097b30ca0d5'
            'cba6a5df66a42ced857822e1099be00f2e37ec800f29cbbfca7210020140291b'
            '3c58a11ca5a57d0a640b852e3e24c0c19d5be52557743af0a93e384ad5851a0c')
__gitpkg="${pkgname%-*}-${pkgver}"
__distdir="dist"

build() {
    cd "${srcdir}/${__gitpkg}"
    yarn config set enableTelemetry 0
    yarn install
    yarn build:browser
    yarn workspaces focus @actual-app/sync-server --production

    # Copy sync-server build files
    mkdir -p ${__distdir}
    cp -r node_modules ${__distdir}/
    cp -r packages/sync-server/{package.json,app.js} ${__distdir}/
    cp -r packages/sync-server/src ${__distdir}/
    cp -r packages/sync-server/migrations ${__distdir}/

    # Remove symbolic links for @actual-app/web package
    rm -rf ${__distdir}/node_modules/@actual-app/web ${__distdir}/node_modules/@actual-app/sync-server

    # Copy the @actual-app/web artifacts manually
    mkdir -p ${__distdir}/node_modules/@actual-app/web
    cp packages/desktop-client/package.json ${__distdir}/node_modules/@actual-app/web/package.json
    cp -r packages/desktop-client/build ${__distdir}/node_modules/@actual-app/web/
}

package() {
    install -d -m 0755 "${pkgdir}/usr/share/webapps/${pkgname}"
    cd "${srcdir}/${__gitpkg}/${__distdir}"
    cp -r * "${pkgdir}/usr/share/webapps/${pkgname}"

    install -d -m 0750 "${pkgdir}/var/lib/actual"

    cd "${srcdir}"
    install -D -m 0644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m 0644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -D -m 0644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m 0644 ${pkgname}.conf "${pkgdir}/etc/conf.d/${pkgname}"
}
