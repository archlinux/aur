# Maintainer: pikl <me@pikl.uk>
pkgname=actual-server
pkgver=23.12.0
pkgrel=2
pkgdesc="Actual Budget Server"
arch=('any')
url="https://github.com/actualbudget/actual-server"
license=('MIT')
groups=()
depends=('yarn' 'nodejs')
makedepends=('git' 'gcc' 'make')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/actualbudget/actual-server/archive/refs/tags/v${pkgver}.tar.gz"
    'actual-server.service'
    'sysusers'
    'tmpfiles'
    'migrations.js.patch'
)
noextract=()
sha256sums=('da85dd0143c70690a66c5412fbd52b84b0f6479dc9a8f7b8dbb90728bc4e3d2d'
            '6d70d436bff95b6ca7ae270219a4288c81ccf119ad57158528fdda19585b2067'
            '4dfa4502df8d72212ccfb96cfc2509c9a1461f542adb38304af54097b30ca0d5'
            'cba6a5df66a42ced857822e1099be00f2e37ec800f29cbbfca7210020140291b'
            '2931be9c68a6028b3a3658cd05b092443dcd20d64f44d1d36f9704f2a1ca310e')

prepare() {

    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p0 -i "${srcdir}/migrations.js.patch"
}

build() {

    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn config set enableTelemetry 0
    yarn install
}

package() {

    install -d -m 0755 "${pkgdir}/usr/share/webapps/actual-server"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -r * "${pkgdir}/usr/share/webapps/actual-server"

    install -d -m 0750 "${pkgdir}/var/lib/actual"

    cd "${srcdir}"
    install -D -m 0644 sysusers "${pkgdir}/usr/lib/sysusers.d/actual-server.conf"
    install -D -m 0644 tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/actual-server.conf"
    install -D -m 0644 actual-server.service "${pkgdir}/usr/lib/systemd/system/actual-server.service"
}
