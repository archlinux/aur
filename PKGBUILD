# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Thanks to asm0dey for making this easier
pkgname=3proxy-git
pkgver=r520.22cf925
pkgrel=3
pkgdesc="A tiny crossplatform proxy server (git version)"
arch=('x86_64')
url="https://3proxy.org/"
license=('BSD')
_pkgname=3proxy
provides=('3proxy')
conflicts=('3proxy')
makedepends=('git')
install=
changelog=
noextract=()
source=("${_pkgname}::git+https://github.com/z3APA3A/${_pkgname}.git"
	'3proxy@.service'
	'no_useradd.patch'
	'no_useradd.patch.sig'
	'3proxy@.service.sig')
sha512sums=('SKIP'
            '54207ceb651510e771a6b5d1f02ca451e3d7521ded7268403ef596f3213bc15a9c200c8a480aed587a46c0aa768d6052db4d27f379d79c5b7232ba9152c38624'
            '9a21b07db619e16fa7fe2a34437f9c133c218364fc8c20635e072f4b44d712afa337415c3d71a05e8ade467d2415a103faec5b625e6f7f21cc41c2f613aca351'
            'SKIP'
            'SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${_pkgname}
    patch -p1 < ${srcdir}/no_useradd.patch
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
    install -D -m0644 ${srcdir}/${_pkgname}/copying ${pkgdir}${_prefix}/share/licenses/$pkgname/copying
    install -D -m0644 ${srcdir}/${_pkgname}/cfg/3proxy.cfg.sample ${pkgdir}${_etcdir}/3proxy.cfg.sample
    install -D -m0644 ${srcdir}/${_pkgname}/cfg/counters.sample ${pkgdir}${_etcdir}/counters.sample
    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    install -D -m0644 "${srcdir}/3proxy@.service" "${pkgdir}/usr/lib/systemd/system/"

    rm -rf ${pkgdir}/etc/init.d
}
