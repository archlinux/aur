# Maintainer: Amish <contact at via dot aur>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>
# Contributor: Lubomir Krajcovic <lubomir.krajcovic(AT)gmail(DOT)com>
# Contributor: Vladimir Kutyavin <vlkut(AT)bk(DOT)ru>
pkgname=xtables-addons-dkms
_pkgname="${pkgname%-*}"
pkgver=3.29
pkgrel=1
pkgdesc='DKMS for additional extensions for Xtables packet filter present in the Linux kernel'
arch=('x86_64' 'aarch64')
license=('GPL2')
url="https://inai.de/projects/${_pkgname}/"
depends=('dkms')
optdepends=('perl-text-csv-xs: required for building GeoIP database'
            'perl-net-cidr-lite: required for building GeoIP database'
            'wget: required for building GeoIP database'
            'unzip: required for building GeoIP database')
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-multikernel")
replaces=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-multikernel")
source=("https://inai.de/files/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"
        dkms.conf)
sha256sums=('eb4a2238a1e928f817f5eb2a58ffb830e2e3bea31fac936d7565c7f2069a38b1'
            '5e131d43ce1b282ada4b02599d2c203a01e2444817f5835bd11ba55578e49111')

prepare() {
    cd "${_pkgname}-${pkgver}"

    # disable install-exec-hook (avoids useless calling of depmod -a at 'make install' stage)
    sed -i 's/^install-exec-hook:$/dont-run:/' Makefile.am
    # disable building of xt_ECHO (it's an example module, and it breaks the build)
    sed -i 's/^build_ECHO=.*$/build_ECHO=n/' mconfig

    autoreconf -fvi
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --libdir=/usr/lib \
        --mandir=/usr/share/man \
        --docdir=/usr/share/doc \
        --libexecdir=/usr/lib/xtables \
        --with-xtlibdir=/usr/lib/xtables \
        --without-kbuild
}

build() {
    cd "${_pkgname}-${pkgver}"
    make
}

check() {
    cd "${_pkgname}-${pkgver}"
    make check
}

package() {
    cd "${_pkgname}-${pkgver}"

    # prepare dkms build tree
    dkmsDst="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -Dm644 -t "${dkmsDst}" "${srcdir}/dkms.conf"
    sed -i -e "s/@_PKGNAME/${_pkgname}/" -e "s/@PKGVER@/${pkgver}/" "${dkmsDst}/dkms.conf"
    cp -r . "${dkmsDst}"

    make DESTDIR="${pkgdir}" install
}
