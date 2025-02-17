# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='dut-git'
_pkgname="${pkgname/-git/}"
pkgver=1.0.r0.g3cb317f
pkgrel=2
pkgdesc='A disk usage calculator for Linux (latest commit)'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url='https://codeberg.org/201984/dut'
source=("git+$url.git")
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
provides=("$_pkgname")
conflicts=("${provides[@]}")
depends=('gcc-libs' 'glibc')
makedepends=('git' 'make')
options=('lto')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags --abbrev=7 \
  | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

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

  make
}

check() {
  cd "$_pkgname"

  ./dut -v
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md
}

# eof
