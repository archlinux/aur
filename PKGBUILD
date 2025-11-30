# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=jbofihe-git
epoch=2
pkgver=0.44.r0.g652c20e
pkgrel=3
pkgdesc='Tools to operate on Lojban text. main feature: approximate translation to English (development version)'
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/lojban/jbofihe"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git' 'perl')
options=('!makeflags')
source=("git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd jbofihe

  git describe --tags --long --abbrev=7 \
  | sed 's/\([^-]*-g\)/r\1/;s/^v//;s/-/./g'
}

prepare() {
  cd jbofihe

  git clean -dfx
}

build() {
  cd jbofihe

  echo "Running config.pl…"
  perl config.pl --prefix=/usr

  for _makefile in {.,dfasyn}/Makefile; do
    # shellcheck disable=SC2016
    #sed -i 's/^CFLAGS=/CFLAGS+= -Wno-implicit-int -Wno-implicit-function-declaration $(LDFLAGS) /g' "$_makefile"
    # It seems we no longer need the ‘-Wno-implicit-*’ flags.
    # However, ‘+=’ is still needed for full RELRO.
    sed -i 's/^CFLAGS=/CFLAGS += $(LDFLAGS) /g' "$_makefile"
  done

  echo "Running make…"
  # There is a Perl script that expects an English locale.
  env LANG=C LC_ALL=C make all
}

package() {
  cd jbofihe

  make DESTDIR="$pkgdir" install

  chmod -v 0644 "$pkgdir"/usr/share/man/man1/*.1

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    NEWS README README.*

  cp -vfa contrib "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
