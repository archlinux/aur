# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap-git
pkgver=2.46
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=('x86_64')
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=(libcap 'lib32-glibc' 'lib32-pam')
makedepends=('linux-api-headers')
provides=('libcap.so' 'libpsx.so' 'lib32-libcap')
conflicts=(lib32-libcap)
source=(git+https://git.kernel.org/pub/scm/libs/libcap/libcap.git
        "${_name}-2.45-makefile.patch")
b2sums=('SKIP'
        '6f50d5a03c3532e6e50506cd878b1c9ca5cee5f1758f9318d4cb5d1e319cbe5f31210ba46a81b1af30730e2329aed7921c11f1a468a596a3f210972ca0da9d64')
#validpgpkeys=('38A644698C69787344E954CE29EE848AE2CCF3F4') # Andrew G. Morgan <morgan@kernel.org>

pkgver() {
  cd libcap
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libcap
  # SBINDIR is hardcoded to sbin. set to bin
  # add CPPFLAGS
  patch -Np1 -i ../"${_name}-2.45-makefile.patch"
}

build() {
  cd libcap
  make KERNEL_HEADERS='/usr/include' CC="gcc -m32" lib='lib32' prefix='/usr'
}

#check() {
#  cd libcap
#  make test
#}

package() {
  cd libcap
  make DESTDIR="$pkgdir" RAISE_SETFCAP='no' lib='lib32' prefix='/usr' install

  # docs
#  install -vDm 644 {CHANGELOG,README} -t "${pkgdir}/usr/share/doc/libcap/"
  rm -r "${pkgdir}/usr/"{include,share/man,bin}
}
