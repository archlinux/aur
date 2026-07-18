# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='jed-git'
_pkgname="${pkgname/-git/}"
pkgver=0.99.20.r203.g40c0b67
pkgrel=1
pkgdesc='Powerful scriptable editor designed for use by programmers (development version)'
arch=("$CARCH")
url='https://www.jedsoft.org/jed/'
source=('git://git.jedsoft.org/git/jed.git')
license=('GPL-2.0-or-later')
provides=('jed' 'jed-script' 'xjed' 'rgrep')
conflicts=('jed' 'jed-script' 'xjed' 'rgrep')
options=('!makeflags')
depends=(
  'fontconfig'
  'glibc'
  'gpm'
  'hicolor-icon-theme'
  'slang'
  'libx11'
  'libxft'
)
makedepends=('awk' 'git' 'libxext' 'libxt')
install="$_pkgname.install"

prepare() {
  cd "$srcdir/$_pkgname"

  git clean -dfx

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

  ./configure --prefix=/usr JED_ROOT=/usr/share/jed

  make clean
  make
  make xjed
  make getmail
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  install -Dm0755 src/objs/rgrep \
    -t "$pkgdir/usr/bin"
  install -Dm0644 desktop/{jed,xjed}.desktop \
    -t "$pkgdir/usr/share/applications"
  install -Dm0644 desktop/{jed,xjed}.svg \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"

  cd "$pkgdir/usr/share/jed/lib"

  env JED_ROOT="$pkgdir/usr/share/jed" \
    "$pkgdir/usr/bin/jed" -batch -n -l preparse.sl

  cd "$pkgdir/usr/share/doc" && ln -srf "$pkgname" "$_pkgname"

  cd "$pkgdir/usr/share/man/man1" && {
    ln -rsf jed.1 jed-script.1
    ln -rsf jed.1 xjed.1
  }
}

sha256sums=('SKIP')

# eof
