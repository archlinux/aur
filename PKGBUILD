# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname='slang-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=2.3.4-16
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
md5sums=('8983eaa3b50ed9ada632a01c836683fc')
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

  cd "$pkgdir/usr/share/slsh"

  # Let's byte-compile *.sl for greater goodness
  # shellcheck disable=SC2016
  ../../bin/slsh -e '
    for ($1=0; $1<__argc; $1++) {
      $2 = __argv[$1];
      () = printf("Byte-compiling %s …", $2);
      byte_compile_file($2, 0);
      () = printf("\n");
    }
  ' ./*.sl ./*/*.sl

  # We shouldn't have byte-compiled this, as it
  # contains both the client and the server code.
  rm -vf sldbsock.slc
}

# Calculated
b2sums=(
  '9eb146c8aaa52b2bd47eac3f8d75c994e626a39f681b3db7ffbbfa391c7e110f13cedcef2b7a014eaff8e94ee1fd521b6419401a670150d3149f03020e3c8477'
)

# eof
