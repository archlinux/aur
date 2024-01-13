# Maintainer: pikl <me@pikl.uk>
pkgname=actual-server
pkgver=24.1.0
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
    # Hack to work around .migrate file creation in project root
    # (/usr/share/webapps/actual-server) which is setup to be
    # read-only for actual user. This patch forces the file
    # creation in the /var/lib/actual directory.
    # See following issue upstream:
    # https://github.com/actualbudget/actual/issues/2011#issuecomment-1837295607
    'load-config.js.patch'
)
noextract=()
sha256sums=('c996935ff6748fe990c4e586944ce1299bb0e36b1708b8735314706fe1d1cdb5'
            '6d70d436bff95b6ca7ae270219a4288c81ccf119ad57158528fdda19585b2067'
            '4dfa4502df8d72212ccfb96cfc2509c9a1461f542adb38304af54097b30ca0d5'
            'cba6a5df66a42ced857822e1099be00f2e37ec800f29cbbfca7210020140291b'
            'b84aeaddd9c03907d8addb2dd7e494e3d9cb2fbe8a50dac1db2ddf2fe1c0eeac')

prepare() {

    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p0 -i "${srcdir}/load-config.js.patch"
}

build() {

    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn config set enableTelemetry 0
    yarn install
}

package() {

    install -d -m 0755 "${pkgdir}/usr/share/webapps/actual-server"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -r {.,}* "${pkgdir}/usr/share/webapps/actual-server"

    install -d -m 0750 "${pkgdir}/var/lib/actual"

    cd "${srcdir}"
    install -D -m 0644 sysusers "${pkgdir}/usr/lib/sysusers.d/actual-server.conf"
    install -D -m 0644 tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/actual-server.conf"
    install -D -m 0644 actual-server.service "${pkgdir}/usr/lib/systemd/system/actual-server.service"
}
