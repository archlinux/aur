# Maintainer: Simon Perry <pezz [at] sanxion [dot] net>

pkgname=tcprstat-bzr
_pkgname=tcprstat
pkgver=73
pkgrel=1
pkgdesc="A protocol-agnostic libpcap-based tool for measuring TCP response times"
arch=('i686' 'x86_64')
url="https://launchpad.net/tcprstat"
license=('GPL')
depends=('libpcap')
makedepends=('bzr')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=('!libtool' '!emptydirs')
source=(configure.patch makefile.patch)
md5sums=('a0a259c1498927b0d14f94f7178ac910'
         '7395c29d5937ee04e137a990adb5a054')

_bzrtrunk="lp:${_pkgname}"
_bzrmod="${_pkgname}"

build() {
  cd "${srcdir}"

  msg "Connecting to the server...."

  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  fi

  msg "bzr checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${_bzrmod}-build"
  cp -r "${_bzrmod}" "${_bzrmod}-build"
  chmod 700 "${_bzrmod}-build/bootstrap"
  cd "${_bzrmod}-build"

  patch -Np1 -i $srcdir/configure.patch
  patch -Np1 -i $srcdir/makefile.patch

  ./bootstrap
  ./configure --prefix=/usr --disable-static

  make
  make DESTDIR=$pkgdir install
}
# vim: ts=2 sw=2 et:
