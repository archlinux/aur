# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='slrn-snapshot-canlock'
_pkgname='slrn'
pkgver=1.0.4.9
_prever='pre1.0.4-9'
pkgrel=6
pkgdesc='An easy-to-use, text-mode, threaded Usenet/NNTP client/newsreader (development snapshot with modern cancel-lock)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'pentium4' 'x86_64')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
makedepends=('uudeview>=20230502')
depends=(
  'glibc'
  'libcanlock'
  'openssl'
  'sh'
  'slang'
)
provides=('slrn')
conflicts=('slrn')
backup=(etc/slrnrc)
options=('!makeflags' 'docs' 'zipman' 'lto')
# <canlock>
_canlock_ver=1.0.4-6
_canlock_url='https://micha.freeshell.org/libcanlock/patches'
_canlock_src="$_canlock_url/slrn-${_canlock_ver}_libcanlock3_patches.tar.gz"
_canlock_dir="slrn-${_canlock_ver}_libcanlock3_patches"
# </canlock>
source=(
  "https://jedsoft.org/snapshots/${_pkgname}-${_prever}.tar.gz"
  "$_canlock_src"
)
# Taken from https://jedsoft.org/snapshots/
md5sums=(
  'f193d983e104a82ef4fd70b1037f8b60'
  'SKIP'
)

prepare() {
  cd "$srcdir/$_pkgname-$_prever" || exit 1
  patch < "../$_canlock_dir/patch-changes.txt"  # FIXME: FAIL

  for folder in doc src; do
    cd "$srcdir/$_pkgname-$_prever/$folder" || exit 1
    for diff in "$srcdir/$_canlock_dir/patch-$folder"_*.*; do
      patch < "$diff"
    done
  done
}

# The current community/uudeview package is broken.
# To build the slrn-snapshot without UU support, set the
# SLRN_NO_UU variable to true|yes|t|y|1, e.g.:
#   env SLRN_NO_UU=true makepkg
build() {
  cd "$_pkgname-$_prever" || exit 1

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

  case "$SLRN_NO_UU" in
    [Tt][Rr][Uu][Ee] | [Yy][Ee][Ss] | [Tt] | [Yy] | 1 )
      ./configure \
        --prefix=/usr \
	--sysconfdir=/etc \
	--enable-setgid-code \
	--with-canlock \
	--with-canlocklib=/usr/lib \
	--with-canlockinc=/usr/include/libcanlock-3 \
	--without-uu \
	--with-slrnpull \
	--with-ssl \
	--enable-spoilers

      make
    ;;
    * )
      ./configure \
        --prefix=/usr \
	--sysconfdir=/etc \
	--enable-setgid-code \
	--with-canlock \
	--with-canlocklib=/usr/lib \
	--with-canlockinc=/usr/include/libcanlock-3 \
	--with-slrnpull \
	--with-ssl \
	--with-uu \
	--with-uuinc=/usr/include/uudeview \
	--enable-spoilers

      make UUDEVIEW_LIB='/usr/lib/libuu.a'
    ;;
  esac

}

package() {
  cd "$_pkgname-$_prever" || exit 1

  make DESTDIR="$pkgdir" install

  install -Dm0644 COPYRIGHT   "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  install -Dm0644 doc/slrn.rc "$pkgdir/etc/slrnrc"
}

sha256sums=(
  '827d01c529c658492e45a376b99495a932d0d6be1e8e207df6f0062a25f1cff8'
  'e70b6980b80d4fa65651fe9deb50c458943d833dddd39925fb53e5ded2059739'
)
b2sums=(
  '667654876dfb087da62288d646a78454a3387e65555e56d34835b9bd6dfe3cf47d5e61ef52e3b11b2df377660db271d1a74e4e986fa826f475cf2bd51ddf6a5d'
  '0bfd30519f681636d33ade106b35672c9d43c024c9af6580f73b3b3ddc01137124b51a29c8b93810dbe200affa97206475876eff3fd7bccc5d4b0beca05d185f'
)

# eof
