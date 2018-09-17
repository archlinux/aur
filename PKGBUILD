# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc.archlinux.org>
# Contributor: Eric Johnson <eric.archlinux.org>

pkgname=lib32-libidn-133-compat
_pkgname=libidn
pkgver=1.33
pkgrel=1
pkgdesc="Compatibility package for libidn, providing libidn.so.11 (32-bit)"
url="https://www.gnu.org/software/libidn/"
arch=('x86_64')
license=('GPL3' 'LGPL')
depends=('lib32-glibc')
source=(https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz{,.sig}
        gcc7_buildfix.diff)
validpgpkeys=('9AA9BDB11BB1B99A21285A330664A76954265E8C'  # Simon Josefsson <simon@josefsson.org>
              '1CB27DBC98614B2D5841646D08302DB6A2670428') # Tim Rühsen <tim.ruehsen@gmx.de>
sha256sums=('44a7aab635bb721ceef6beecc4d49dfd19478325e1b47f3196f7d2acc4930e19'
            'SKIP'
            '1b539ba3916fe8982d596f4de9a65138ae9a35a042e1673328a092a478b7fb33')

prepare() {
  cd ${_pkgname}-${pkgver}
  # fix build with gcc7
  patch -Np1 -i ../gcc7_buildfix.diff
}

build() {
  cd ${_pkgname}-${pkgver}
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr
  make
}

check() {
  cd ${_pkgname}-${pkgver}
  make check
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 lib/.libs/libidn.so.11.6.16 "$pkgdir/usr/lib32/libidn.so.11.6.16"
  ln -s libidn.so.11.6.16 "$pkgdir/usr/lib32/libidn.so.11"
}
