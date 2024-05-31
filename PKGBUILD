# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='kanzi-git'
_pkgname="${pkgname/-git}"
pkgver=2.3.0.r13.g0335279c
pkgrel=2
pkgdesc='Modern, modular, portable and efficient lossless data compressor and decompressor (built from latest commit)'
arch=('aarch64' 'x86_64')
url='https://github.com/flanglet/kanzi-cpp'
source=("$_pkgname::git+$url.git")
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('lto')
depends=('gcc-libs' 'glibc')
makedepends=('git')

prepare() {
  cd "$srcdir/$_pkgname/src"

  sed -i 's/CXXFLAGS=/CXXFLAGS+=/g' Makefile
  sed -i 's/LDFLAGS=/LDFLAGS+=/g'   Makefile
}

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --tags |  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/src"

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

  make clean
  make kanzi
}

package() {
  cd "$srcdir/$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" \
    bin/kanzi

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md

  install -vDm0644 -t "$pkgdir/usr/share/man/man1/" \
    kanzi.1.gz
}

sha256sums=('SKIP')

# eof
