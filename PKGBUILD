# Maintainer:	Tomas Krizek <tomas.krizek@nic.cz>
# Contributor:	Ondřej Surý <ondrej@sury.org>

pkgname=knot-resolver
pkgver=5.2.1
pkgrel=1
pkgdesc='Caching DNSSEC-validating DNS resolver'
arch=('x86_64' 'armv7h')
url='https://www.knot-resolver.cz/'
license=('GPL3')
depends=(
    'dnssec-anchors'
    'gnutls'
    'knot'
    'libedit'
    'libuv'
    'lmdb'
    'luajit'
    'systemd'
    'libcap-ng'
    'libnghttp2'
)
makedepends=(
    'cmocka'
    'meson'
    'systemd-libs'
)
optdepends=(
    'lua51-basexx: experimental_dot_auth module'
    'lua51-cqueues: http and dns64 module, policy.rpz() function'
    'lua51-http: http and prefill modules, trust_anchors bootstrap'
    'lua51-psl: policy.slice_randomize_psl() function'
)
backup=('etc/knot-resolver/kresd.conf')
options=(debug strip)
source=("https://secure.nic.cz/files/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('aa37b744c400f437acba7a54aebcbdbe722ece743d342cbc39f2dd8087f05826')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson build \
        --buildtype=release \
        --prefix=/usr \
        --sbindir=bin \
        -D keyfile_default=/etc/trusted-key.key \
        -D systemd_files=enabled \
        -D client=enabled \
        -D install_kresd_conf=enabled \
        -D unit_tests=enabled
    ninja -C build
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson test -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR=${pkgdir} ninja -C build install

    # add kresd.target to multi-user.target.wants to support enabling kresd services
    install -d -m 0755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
    ln -s ../kresd.target "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/kresd.target"

    # remove modules with missing dependencies
    rm "${pkgdir}/usr/lib/knot-resolver/kres_modules/etcd.lua"
}
