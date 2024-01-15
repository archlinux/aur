# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='slang-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=2.3.4-8
_prever="pre$_pkgver"
pkgver="${_pkgver/-/.}"
pkgrel=7
pkgdesc='S-Lang is a powerful interpreted language (development snapshot)'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
provides=('libslang.so' 'slang' 'slsh')
conflicts=('libslang.so' 'slang' 'slsh')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')
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
md5sums=('c740ca7ded82fa29849046ca33c572b1')

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
  'bd2de566dba919a0cc230b970236c89b095d693cc15344e28f7f9d4e646b9a6b'
)
sha512sums=(
  'bca104861f947b8a7a318c0cf4128be236eea603f0ca73125d7609d6ff4a7a425d99388e6df64f2d5b1f92a1e32bddb655dcaaa85acd397507559cdf11daf98b'
)

# eof
