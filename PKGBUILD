# -*- sh -*-

#  Maintainer: Klaus Alexander Seistrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=w3m-rkta
_gitbranch='gemini'
pkgname="$_pkgname-git"
pkgver=v0.5.3+git20230121.r142.ge4f734f
pkgrel=1
pkgdesc="Rene Kita's fork of the text-based web browser/pager w3m with gemini support (latest commit)"
url='https://git.sr.ht/~rkta/w3m'
license=('LicenseRef-W3M')  # SPDX-License-Identifier: LicenseRef-W3M
arch=('aarch64' 'x86_64')
makedepends=('git')
depends=(
  'gc'
  'glibc'
  'gpm'
  'imlib2'
  'libx11'
  'ncurses'
  'openssl'
  'perl'
  'sh'
  'zlib'
)
source=("$pkgname::git+$url#branch=$_gitbranch")
sha256sums=('SKIP')
options=('lto')
provides=('w3m')
conflicts=('w3m')

pkgver() {
  cd "$pkgname"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

# There are three important branches: master, next and oldstable.
# Additionally there is a branch gemini which is just branch master but
# with a patch to add support for the gemini protocol and hypertext format.

build() {
  cd "$pkgname"

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

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-image=x11,fb \
    --with-imagelib=imlib2 \
    --with-termlib=ncurses \
    --disable-w3mmailer

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" doc/*
  install -vDm0644 doc/README "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
