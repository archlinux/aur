# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgdesc='Dynamic, bytecode-compiled programming language and a dialect of Python (development version)'
pkgname='kuroko-git'
pkgver=1.4.0.r148.g0ae991c
pkgrel=1
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
  git clean -dfx

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

  make -C "$_pkgname" prefix=/usr
}

check () {
  make -C "$_pkgname" prefix=/usr test
}

package () {
  make -C "$_pkgname" prefix=/usr DESTDIR="$pkgdir" install

  install "-vDm0644" "$_pkgname/README.md"   "$pkgdir/usr/share/doc/$pkgname/README.md"
  install "-vDm0644" "$_pkgname/SECURITY.md" "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
  install "-vDm0644" "$_pkgname/LICENSE"     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
