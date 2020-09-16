# $Id$
# Maintainer : Jens Staal <staal1978@gmail.com>
# Adapted from: Dan McGee <dan@archlinux.org>

pkgname=dash-static-musl
_pkgbase=dash
pkgver=0.5.11.2
pkgrel=1
pkgdesc="A POSIX compliant shell that aims to be as small as possible, statically linked to musl libc"
arch=('i686' 'x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
makedepends=('musl') #we are static
install=dash.install
source=("https://git.kernel.org/pub/scm/utils/dash/dash.git/snapshot/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('851abffe9087c79f580801b323cc1c26ca5a370a34ca4aa241f47802ba645fe854f8623a0f81e0e14f05b7b824828bace22901ac4ad77d7ce4630cb5368243c2')
b2sums=('7a7e86e226e646adaddaf2e5bcc86c8c1ef72649851709c1aa77ce819924d6b9729dd37a2a443586849eb32a961ac7f253cfcf2c2bb9c01c1a2d7bfdcebac97d')


prepare() {
  cd ${_pkgbase}-${pkgver}
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  export CC="musl-gcc -static"
  export CFLAGS='-Os -static'
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix=""  \
    --with-libedit

  make V=1
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # license
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${_pkgbase}/COPYING
}
 
