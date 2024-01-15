# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=timestampit
pkgver=0.3.3.2
pkgrel=4
pkgdesc='Prefix each input line with a date/time stamp (formerly timestamp/stampit)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://codeberg.org/kas/timestampit/'
license=('GPL3')
depends=('glibc')
optdepends=('scdoc: for recompiling manual pages')
provides=(
  'timestamp'
  'stampit'
)
conflicts=(
  'timestamp'
  'stampit'
)
source=(
  "$pkgname-$pkgver.tar.gz::${url}archive/v$pkgver.tar.gz"
)
options=('lto')

build() {
  cd "$pkgname" || exit 1

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "${CARCH:-unknown}" in
    'x86_64' | 'i386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  make -C src
}

package() {
  cd "$pkgname" || exit 1

  make -C src PREFIX=/usr DESTDIR="$pkgdir" install
}

sha256sums=(
  '0d990cd90d3ddabded70fcb81a4487c48403cb983a985e063d4035abcf75c451'
)
b2sums=(
  '1469f46ca77a75bfd21366f3ba83e77c8b183773d6e50f862fa06c7a9a24625c733f280d3ba65cb7b064ab565669cefceb81504af1c158032377a4fcc7b9da84'
)

# eof
