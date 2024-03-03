# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='slang-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=2.3.4-11
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
md5sums=('f94a0e56168a4673dfe9f3d21ac3859a')
changelog="$pkgname.changelog"

build() {
  cd "${_pkgname}-${_prever}"

  # RFC-0023
  # https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "${CARCH:-unknown}" in
    'x86_64' | 'i386' )
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
sha256sums=(
  '8b1c937ac8085ad436fb88e2708d4b45eec4261c151dffa2b7f9d38bab11519f'
)
b2sums=(
  '5db15f5883db37d9d9c971c208a312455137e4452f711ad67db57c98f74c5a4fe42b8a3d6ca804e49e8716952d3b7be9f406d39b8e2d9b3b42e7ff806b1132f2'
)

# eof
