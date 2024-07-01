# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Uffe Jakobsen <uffe at uffe dot org>

pkgname='mlmmj'
pkgver=1.4.7
_pkgver=1_4_7
pkgrel=1
pkgdesc='Simple and slim mailing list manager (MLM) inspired by ezmlm'
depends=('bash' 'glibc' 'smtp-server')
optdepends=(
  'perl: for running some of the contributed scripts'
  'python: for running some of the contributed scripts'
)
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
#url='http://mlmmj.org/'
url='https://codeberg.org/mlmmj/mlmmj'
license=('MIT')  # SPDX-License-Identifier: MIT
# Development has moved to Codeberg
source=(
  "$url/releases/download/RELEASE_$_pkgver/mlmmj-$pkgver.tar.xz"
  'sysuser.conf'
  'tmpfile.conf'
)
options=('lto')
changelog="$pkgname.changelog"
install="$pkgname.install"

build() {
  cd "$pkgname-$pkgver"

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

  # Tests require “atf-c”. Anyone?
  ./configure --prefix=/usr --disable-tests

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ChangeLog FAQ README.* TODO TUNABLES.md UPGRADE

  cp -vfa contrib "$pkgdir/usr/share/doc/$pkgname/"

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    AUTHORS COPYING LICENSE

  cd "$srcdir"

  install -vDm0644 sysuser.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm0644 tmpfile.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

sha256sums=(
  '5ad42ac2867376c48133106f2e5b4768c266b89294b206762ca4c4bb219cf3d6'
  'SKIP' 'SKIP'  # Skip to my lou
)
b2sums=(
  'edf9caa10643374a02dfea633348ab8da1af33961f5d1496615863aec1c4d1b8366b88ac30f34a4fa704bf719e07357a78e6bf4eb95ab793b5c37f66d2ab20c1'
  'SKIP' 'SKIP'  # Skip to my lou
)

# eof
