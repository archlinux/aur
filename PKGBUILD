# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=('jed-git')
_pkgname="${pkgname/-git/}"
pkgver=0.99.20.r180.g68f0c75
pkgrel=6
pkgdesc='Powerful scriptable editor designed for use by programmers (built from latest git commit)'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url='https://www.jedsoft.org/jed/'
source=(
  'git://git.jedsoft.org/git/jed.git'
  "$pkgname.install"
)
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
provides=('jed' 'xjed' 'rgrep')
conflicts=('jed' 'xjed' 'rgrep')
options=('lto' '!makeflags')
depends=(
  'fontconfig'
  'glibc'
  'gpm'
  'slang'
  'libx11'
  'libxft'
)
makedepends=('git' 'libxext' 'libxt')
install="$pkgname.install"

prepare() {
  cd "$srcdir/$_pkgname"

  sed \
    -e "s|\(^all.*\)|\1 xjed rgrep getmail|" \
    -e "s|..DEST.*doc|$pkgdir/usr/share/doc/$pkgname|g" \
    -i src/Makefile.in
}

pkgver() {
  cd "$srcdir/$_pkgname"

  # The usual “git describe --long” doesn't work here,
  # so let's invent our own thing:
  _version=$(
    awk '$2 == "JED_VERSION_STR" {print $3}' src/version.h \
    | sed -e 's/pre//;s/-/.r/;s/"//g'
  )
  _commit=$(git log -n 1 --pretty=format:'g%h')

  printf '%s.%s\n' "$_version" "$_commit"
}

build() {
  cd "$srcdir/$_pkgname"

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

  ./configure --prefix=/usr JED_ROOT=/usr/share/jed

  make clean
  make
  make xjed
  make getmail
}

package() {
  cd "$srcdir/$_pkgname" || exit 1

  make DESTDIR="$pkgdir" install

  install -Dm0755 'src/objs/rgrep' "$pkgdir/usr/bin/rgrep"

  cd "$pkgdir/usr/share/jed/lib" || exit 1

  env JED_ROOT="$pkgdir/usr/share/jed" \
    "$pkgdir/usr/bin/jed" -batch -n -l preparse.sl
}

sha256sums=('SKIP' 'SKIP')  # Skip to my Lou

# eof
