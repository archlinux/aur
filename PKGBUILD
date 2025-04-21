# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slrn-snapshot-canlock'
_pkgname='slrn'
pkgver=1.0.4.9
_prever='pre1.0.4-9'
pkgrel=9
pkgdesc='An easy-to-use, text-mode, threaded Usenet/NNTP client/newsreader with modern cancel-lock (development snapshot)'
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
provides=('slrn' 'slrnpull')
conflicts=("${provides[@]}")
backup=('etc/slrn/slrn.rc' 'etc/slrn/slrnpull.conf')
options=('!makeflags' 'docs' 'zipman')
# <canlock>
_canlock_ver=1.0.4-6
_canlock_url='https://micha.freeshell.org/libcanlock/patches'
_canlock_src="$_canlock_url/slrn-${_canlock_ver}_libcanlock3_patches.tar.gz"
_canlock_dir="slrn-${_canlock_ver}_libcanlock3_patches"
# </canlock>
source=(
  "$url${_pkgname}-${_prever}.tar.gz"
  "$_canlock_src"
)
# Taken from https://jedsoft.org/snapshots/
md5sums=(
  'f193d983e104a82ef4fd70b1037f8b60'
  'SKIP'
)

prepare() {
  cd "$srcdir/$_pkgname-$_prever"

  patch < "../$_canlock_dir/patch-changes.txt"  # FIXME: FAIL

  for _folder in doc src; do
    cd "$srcdir/$_pkgname-$_prever/$_folder"
    for diff in "$srcdir/$_canlock_dir/patch-$_folder"_*.*; do
      patch < "$diff"
    done
  done

  cd "$srcdir/$_pkgname-$_prever"

  # GCC 14 barfs over undefined VA_COPY
  # https://github.com/jedsoft/slrn/pull/1
  # https://github.com/jedsoft/slrn/issues/2
  sed -i '/#undef VA_COPY_AS_ARRAY/i#define VA_COPY va_copy' src/config.hin
}

# The current community/uudeview package is broken.
# To build the slrn-snapshot without UU support, set the
# SLRN_NO_UU variable to true|yes|t|y|1, e.g.:
#   env SLRN_NO_UU=true makepkg
build() {
  cd "$_pkgname-$_prever"

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
  cd "$_pkgname-$_prever"

  make DESTDIR="$pkgdir" install

  install -vDm0644 -t "$pkgdir/etc/slrn/" \
    doc/slrn.rc doc/slrnpull/slrnpull.conf
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    COPYRIGHT
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
