# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgdesc='Dynamic, bytecode-compiled programming language and a dialect of Python (development version)'
pkgname='kuroko-git'
pkgver=1.4.0.r80.g9ad8501
pkgrel=2
url='https://github.com/kuroko-lang/kuroko'
arch=('aarch64' 'x86_64')
conflicts=('kuroko')
depends=('glibc')
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=('git')
options=('lto')
provides=('kuroko' 'libkuroko')
sha256sums=('SKIP')
source=("git+$url.git")

_pkgname="${pkgname/-git/}"

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
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

  make -C "$_pkgname" prefix=/usr
}

check () {
  make -C "$_pkgname" prefix=/usr test
}

package () {
  make -C "$_pkgname" prefix=/usr DESTDIR="$pkgdir" install

  # Be more verbose if standard output is a TTY
  test -t 1 && _v='v' || _v=''

  install "-${_v}Dm0644" "$_pkgname/README.md"   "$pkgdir/usr/share/doc/$pkgname/README.md"
  install "-${_v}Dm0644" "$_pkgname/SECURITY.md" "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
  install "-${_v}Dm0644" "$_pkgname/LICENSE"     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
