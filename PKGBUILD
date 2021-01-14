# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sébastien Luttringer

_pkgname=lz4
pkgname=lib32-lz4
_gitcommit=d44371841a2f1728a3f36839fd4b7e872d0927d3
pkgver=1.9.3
pkgrel=1
pkgdesc='Extremely fast compression algorithm (32-bit)'
url='https://www.lz4.org/'
arch=('x86_64')
license=('GPL2')
makedepends=('git')
checkdepends=('diffutils')
depends=('lz4' 'lib32-glibc')
provides=('liblz4.so')
source=("git+https://github.com/lz4/lz4.git#commit=${_gitcommit}")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
