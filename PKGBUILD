# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Thanks to asm0dey for making this easier
pkgname=3proxy-git
pkgver=r520.22cf925
pkgrel=7
pkgdesc="A tiny crossplatform proxy server (git version)"
arch=('x86_64')
url="https://3proxy.org/"
license=('BSD')
_pkgname=3proxy
provides=('3proxy')
conflicts=('3proxy')
depends=('bash')
makedepends=('git')
install=
changelog=
noextract=()
source=("${_pkgname}::git+https://github.com/z3APA3A/${_pkgname}.git"
	'3proxy@.service'
	'pkging.patch'
	'pkging.patch.sig'
	'3proxy@.service.sig')
sha512sums=('SKIP'
            '7e789def8a783944a93980a898aaf6dd8f5c230ca9ee64b36b3ad6a60e61ef489067616615c78c6e74f60c70ac5388b54dac508a4f000c9c8d0fe068bfffb4b3'
            '80c3c6fca8d297c7fd2fe13802432957220ea850d3ae0433451c9b4a9079a063daf23f1b2cfa328bfdccf2ba69aa035f483269af47a496fc116aee2b5825d80a'
            'SKIP'
            'SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${_pkgname}
    patch -p1 < ${srcdir}/pkging.patch
}
package() {

    _prefix='/usr'
    _etcdir='/etc/3proxy'

    install -d -m 0755 ${pkgdir}/usr/etc/init.d

    cd "${srcdir}/${_pkgname}"
    make='make -f Makefile.Linux INSTALL=/usr/bin/install'
    ${make} prefix="${_prefix}" ETCDIR="${_etcdir}"
    ${make} prefix="${_prefix}" install DESTDIR="${pkgdir}" ETCDIR="${pkgdir}${_etcdir}"
    ( cd ${pkgdir}${_prefix}/bin && mv proxy 3proxy-proxy ) || return 1
    rm -f ${pkgdir}${_etcdir}/counters ${pkgdir}${_etcdir}/passwd ${pkgdir}${_etcdir}/bandlimiters
    install -d -m0755 ${pkgdir}/var/lib/3proxy
    install -D -m0644 ${srcdir}/${_pkgname}/copying ${pkgdir}${_prefix}/share/licenses/$pkgname/copying
    install -D -m0644 ${srcdir}/${_pkgname}/cfg/3proxy.cfg.sample ${pkgdir}${_etcdir}/3proxy.cfg.sample
    install -D -m0644 ${srcdir}/${_pkgname}/cfg/counters.sample ${pkgdir}${_etcdir}/counters.sample
    install -d -m0755 "${pkgdir}/usr/lib/systemd/system/"
    install -D -m0644 "${srcdir}/3proxy@.service" "${pkgdir}/usr/lib/systemd/system/"

    rm -rf ${pkgdir}/usr/etc/init.d
}
