# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Contributor: Uffe Jakobsen <uffe at uffe dot org>
# -*- mode: sh -*-

pkgname='mlmmj'
pkgver=1.4.5
_pkgver=1_4_5
pkgrel=3
pkgdesc='Simple and slim mailing list manager (MLM) inspired by ezmlm'
depends=('bash' 'glibc' 'smtp-server')
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

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    ChangeLog FAQ README README.* TODO TUNABLES UPGRADE

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    AUTHORS COPYING LICENSE

  cd "$srcdir"

  install -vDm0644 sysuser.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm0644 tmpfile.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

sha256sums=(
  '957a018d9e6d169fd54b7109bab747309cf72fe0072b54d11d174675da526126'
  'SKIP' 'SKIP'  # Skip to my lou
)
b2sums=(
  '9390cfd343449160f6c9e244e75af539b73a4ba468e9c3ddf4bc21423e79c6d4d2905b8be829ad0232be00e63f47881d34cf571c9d480b95228df732c32bb7fe'
  'SKIP' 'SKIP'  # Skip to my lou
)

# eof
