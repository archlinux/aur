# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=jbofihe-git
epoch=2
pkgver=0.43.19.gcc6fe66
pkgrel=3
pkgdesc='Tools to operate on Lojban text (main feature: approximate translation to English)'
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/lojban/jbofihe"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git' 'perl')
options=('lto' '!makeflags')
source=("git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd jbofihe

  git describe --tags | sed -e 's/^[^0-9\-]*//' -e 'y/-/./'
}

build() {
  cd jbofihe

  echo "Running config.pl…"
  perl config.pl --prefix=/usr

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

  for _makefile in {.,dfasyn}/Makefile; do
    sed -i 's/^CFLAGS=/CFLAGS+=-Wno-implicit-int -Wno-implicit-function-declaration $(LDFLAGS)/g' "$_makefile"
  done

  echo "Running make…"
  # There is a Perl script that expects the locale to be an English one.
  env LANG=C LC_ALL=C make all
}

package() {
  cd jbofihe

  make DESTDIR="$pkgdir" install

  chmod -v 0644 "$pkgdir"/usr/share/man/man1/*.1

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    NEWS README README.*

  cp -vfa contrib "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
