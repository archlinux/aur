# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>
# Adapted from: Jens Staal <staal1978@gmail.com>

pkgname=dash-static-musl
_pkgbase=dash
pkgver=0.5.13.4
pkgrel=2
pkgdesc="A POSIX compliant shell that aims to be as small as possible"
arch=('x86_64' 'aarch64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
makedepends=('musl' 'gcc' 'make') #we are static. The Arch libedit package has stopped to ship the static library :(
install=dash.install
source=("http://gondor.apana.org.au/~herbert/dash/files/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('383d0ea8316fea3ce523dc535173a94a22e58bfaec2dec3309d3496a864e5e67711965563db82e7e181f8d7b67a25033107b4c9453c3d6b3820c6586d1f99675')
b2sums=('3c774e3e084c9f6c3b3e2cbb44d915c579379bdeccb9c0974bb6424d371ada06e3387df518ffbb5ba1e9722860d390fc014a9d84833d11dd814a403f3e96cee6')

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
