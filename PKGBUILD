# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>
# Adapted from: Jens Staal <staal1978@gmail.com>

pkgname=dash-static-musl
_pkgbase=dash
pkgver=0.5.13.4
pkgrel=1
pkgdesc="A POSIX compliant shell that aims to be as small as possible"
arch=('x86_64' 'aarch64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
makedepends=('musl' 'gcc' 'make') #we are static. The Arch libedit package has stopped to ship the static library :(
install=dash.install
source=("https://git.kernel.org/pub/scm/utils/dash/dash.git/snapshot/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('ff0e8a86097bbc39270e7aec9801997f302212e8c81fd24e9d8895830298041916be00a0cfb7a611845703dad4e2cdf51e9909bfcfadc00d4b82772ee5fed33d')
b2sums=('8555459905a99772830a82c070ce4b1fe1ea8e3a89cf9618505737dce0614cfdafb706e11c82d134fdd6a5150b16ed7a170641cb770625bfc7899d1791430c6d')

prepare() {
  cd ${_pkgbase}-${pkgver}
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  export CC="musl-gcc"
  export CFLAGS="$CFLAGS -Os"
  ./configure \
    --enable-static \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix=""  #\
#    --with-libedit # disabled libedit for now
  make V=1
}

package() {
  make -C "${srcdir}/${_pkgbase}-${pkgver}" DESTDIR="${pkgdir}" install
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${_pkgbase}/COPYING
}
