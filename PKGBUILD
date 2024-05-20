# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname='slang-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=2.3.4-14
_prever="pre$_pkgver"
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc='S-Lang is a powerful interpreted language (development snapshot)'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
provides=('libslang.so' 'slang' 'slsh')
conflicts=('libslang.so' 'slang' 'slsh')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=(
  'glibc'
  'libpng'
  'oniguruma'
  'pcre'
  'zlib'
)
backup=('etc/slsh.rc')
options=('lto' '!makeflags')
source=("${url}${_pkgname}-$_prever.tar.gz")
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
# Taken from $url
md5sums=('4639535fd2c12d518adb887cf7dcb631')
changelog="$pkgname.changelog"

build() {
  cd "${_pkgname}-${_prever}"

  # RFC-0023
  # https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zi386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  ./configure --prefix=/usr --sysconfdir=/etc

  make
}

check() {
  cd "${_pkgname}-${_prever}"

  test "$CARCH" != 'i686' && make check
}

package() {
  cd "${_pkgname}-${_prever}"

  make DESTDIR="${pkgdir}" install-all
}

# Calculated
b2sums=(
  '1d90de08556f8ca5b4aba422c218142188a9f529965eacae2968bc88f2419af5dfd574dbc7bc1a95dee2fd7f2b89e37ae2ba4590088d9a1a7801ad4d86a30a34'
)

# eof
