# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='slang-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=2.3.4-12
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
md5sums=('a73e5a83ccb461227f5d30bb9784e26b')
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
  'e1ee510a3fe620cade67ec912fedcf7fab697910de717dffed0b7065d960931a'
)
b2sums=(
  '69c70bcb3a137197faebc9ea24f710755c1ee23d9b70322a231765b033424cfd74906bd4e7c32be301dd34fff278707dd1d8a42e88d7bce4ee6695aa709950cd'
)

# eof
