# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='jed-git'
_pkgname="${pkgname/-git/}"
pkgver=0.99.20.r180.g68f0c75
pkgrel=8
pkgdesc='Powerful scriptable editor designed for use by programmers (built from latest git commit)'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url='https://www.jedsoft.org/jed/'
source=('git://git.jedsoft.org/git/jed.git')
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
provides=('jed' 'jed-script' 'xjed' 'rgrep')
conflicts=('jed' 'jed-script' 'xjed' 'rgrep')
options=('lto' '!makeflags')
depends=(
  'fontconfig'
  'glibc'
  'gpm'
  'hicolor-icon-theme'
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
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  # Increase verbosity if standard output is a TTY
  test -t 1 && _v='v' || _v=''

  install -${_v}Dm0755 src/objs/rgrep             \
    -t "$pkgdir/usr/bin/"
  install -${_v}Dm0644 desktop/{jed,xjed}.desktop \
    -t "$pkgdir/usr/share/applications/"
  install -${_v}Dm0644 desktop/{jed,xjed}.svg     \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  cd "$pkgdir/usr/share/jed/lib"

  env JED_ROOT="$pkgdir/usr/share/jed" \
    "$pkgdir/usr/bin/jed" -batch -n -l preparse.sl

  cd "$pkgdir/usr/share/man/man1/" && {
    ln -${_v}rs jed.1 jed-script.1
    ln -${_v}rs jed.1 xjed.1
  }
}

sha256sums=('SKIP')

# eof
