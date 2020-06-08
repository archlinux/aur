# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot de>

_pkgname=castools
pkgname="${_pkgname}-git"
pkgver=1.31.r7.218b177
pkgrel=1
pkgdesc="Convert WAV files of MSX tapes into .cas format and back (git version)"
arch=('x86_64')
url="http://home.kabelfoon.nl/~vincentd/"
license=('GPL2')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/joyrex2001/${_pkgname}.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(grep '^/\* version:' wav2cas.c | awk '{print $3}')"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make CFLAGS="$CFLAGS" cpu
  make CFLAGS="$CFLAGS $LDFLAGS" CLIBS= wav2cas casdir
  make CFLAGS="$CFLAGS $LDFLAGS" cas2wav
}

package() {
  cd "${srcdir}/${_pkgname}"
  # install binaries
  install -s -Dm755 wav2cas cas2wav casdir -t "${pkgdir}/usr/bin"
  # documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
