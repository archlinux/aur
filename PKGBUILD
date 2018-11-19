# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sébastien Luttringer

_pkgname=lz4
pkgname=lib32-lz4
_gitcommit=641b453d9db536ee020851bfcb1dc39f61006f0a
pkgver=1.8.3
pkgrel=1
pkgdesc='Extremely fast compression algorithm (32-bit)'
url='https://www.lz4.org/'
arch=('x86_64')
license=('GPL2')
makedepends=('git')
checkdepends=('diffutils')
depends=('lz4' 'lib32-glibc')
source=("git+https://github.com/lz4/lz4.git#commit=${_gitcommit}?signed")
sha512sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # GitHub (web-flow commit signing) <noreply@github.com>

pkgver() {
  cd ${_pkgname}
  git describe --tags --always|sed 's/^v//;s/-/./g'
}

build() {
  cd ${_pkgname}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  # do not use the main makefile, it calls sub make with -e
  # exported CLFAGS by makepkg break the version. see FS#50071
  make -C lib PREFIX=/usr
  make -C programs PREFIX=/usr lz4 lz4c
}

check() {
  rm -f passwd.lz4
  ${_pkgname}/programs/lz4 /etc/passwd passwd.lz4
  ${_pkgname}/programs/lz4 -d passwd.lz4 passwd
  diff -q /etc/passwd passwd
  rm passwd
}

package() {
  cd ${_pkgname}
  make install \
    PREFIX=/usr \
    LIBDIR=/usr/lib32 \
    PKGCONFIGDIR=/usr/lib32/pkgconfig \
    DESTDIR="${pkgdir}"
  rm -rf "${pkgdir}"/usr/{share,include,bin}
}

# vim: ts=2 sw=2 et:
