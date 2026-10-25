# PKGBUILD forked from https://gitea.artixlinux.org/packages/calc by:
# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
_pkgname=calc
pkgname=ccalc-git
pkgver=2.17.0.2.r9.gc8edd3e
pkgrel=1
pkgdesc="Arbitrary precision console calculator"
arch=(x86_64)
url="https://github.com/lcn2/calc"
license=(LGPL-2.1-only)
depends=(readline)
makedepends=(mandoc)
provides=(calc)
conflicts=(calc)
source=(git+$url)
b2sums=('SKIP')

pkgver() {
  git -C $_pkgname describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  sed -i 's/${CC} ${LIBCALC_SHLIB}/${CC} ${LDFLAGS} ${LIBCALC_SHLIB}/' Makefile
  sed -i 's/${CC} ${LIBCUSTCALC_SHLIB}/${CC} ${LDFLAGS} ${LIBCUSTCALC_SHLIB}/' custom/Makefile
}

build() {
  cd "${_pkgname}"

  make \
    USE_READLINE="-DUSE_READLINE" \
    READLINE_LIB="-lreadline" \
    READLINE_EXTRAS="-lhistory -lncurses" \
    EXTRA_CFLAGS="${CPPFLAGS} ${CFLAGS} -Wno-error=format-security" \
    EXTRA_LDFLAGS="${LDFLAGS}" \
    ARCH_CFLAGS="" \
    LD_SHARE="" \
    DEBUG=""
}

check() {
  cd "${_pkgname}"

  make chk
}

package() {
  cd "${_pkgname}"

  make T="${pkgdir}" install
  mv "${pkgdir}/usr/bin/cscript" "${pkgdir}/usr/share/calc/"
}
