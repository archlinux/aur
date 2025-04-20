# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='most-snapshot'
_pkgname="${pkgname/-snapshot/}"
pkgver=5.2.0
_prever=5.2.0
pkgrel=10
epoch=1
# shellcheck disable=SC1112
pkgdesc='A terminal pager similar to ‘more’ and ‘less’ (latest development snapshot)'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
depends=('glibc' 'slang')
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
url='https://www.jedsoft.org/most/'
source=("https://www.jedsoft.org/snapshots/${_pkgname}-${_prever}.tar.gz")
#validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis <davis@space.mit.edu>
provides=('most')
conflicts=('most')
options=('lto' '!makeflags')
# Taken from https://jedsoft.org/snapshots/
md5sums=('9677a974b85ca60c05f2c86063316faa')

build() {
  cd "${srcdir}/${_pkgname}-${_prever}"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
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

package() {
  cd "${srcdir}/${_pkgname}-${_prever}"

  make DESTDIR="${pkgdir}" install
}

# Calculated
sha256sums=(
  'a8babadf68a7e01608340efe4d987eb954e782731232f4aa090d935068610e9f'
)

b2sums=(
  'e26bdb7ecf85baecb50998c6c54ba0cb8ebd81ba4e6b4790c5c85f39b96ffbc109ff5735b30e1df782f2949890185d6024ffffe62ff885b8c772644ee70e0a24'
)

# eof
