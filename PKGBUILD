# Maintainer:	Tomas Krizek <tomas.krizek@nic.cz>
# Contributor:	Ondřej Surý <ondrej@sury.org>

pkgname=knot-resolver
pkgver=4.1.0
pkgrel=1
pkgdesc='full caching DNS resolver implementation'
url='https://www.knot-resolver.cz/'
arch=('x86_64' 'armv7h')
license=('GPL3')
backup=('etc/knot-resolver/kresd.conf')
options=(debug strip)
install=install
depends=(
    'dnssec-anchors'
    'gnutls'
    'knot>=2.8'
    'libedit'
    'libuv'
    'lmdb'
    'lua51-sec'
    'lua51-socket'
    'luajit'
    'systemd'
)
optdepends=(
    'lua51-basexx: experimental_dot_auth module',
    'lua51-http: http module',
    'lua51-filesystem: prefill module',
)
makedepends=(
    'cmocka'
    'meson'
    'systemd-libs'
)

source=("https://secure.nic.cz/files/${pkgname}/${pkgname}-${pkgver}.tar.xz")

sha256sums=('2fe470f9bb1007667cdd448f758087244b7195a0234c2b100a9beeed0a2d3e68')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson build_arch \
        --buildtype=release \
        --prefix=/usr \
        --sbindir=bin \
        -Dkeyfile_default=/etc/trusted-key.key \
        -Dsystemd_files=enabled \
        -Dclient=enabled \
        -Dinstall_kresd_conf=enabled \
        -Dunit_tests=enabled
    ninja -C build_arch
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson test -C build_arch
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR=${pkgdir} ninja -C build_arch install

    # add kresd.target to multi-user.target.wants to support enabling kresd services
    install -d -m 0755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
    ln -s ../kresd.target "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/kresd.target"

    # remove modules with missing dependencies
    rm "${pkgdir}/usr/lib/knot-resolver/kres_modules/etcd.lua"
}
