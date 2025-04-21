# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slrn-snapshot'
_pkgname='slrn'
pkgver=1.0.4.9
_prever='pre1.0.4-9'
pkgrel=8
pkgdesc='An easy-to-use, text-mode, threaded Usenet/NNTP client/newsreader (development snapshot)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'pentium4' 'x86_64')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
makedepends=('uudeview>=20230502')
depends=('glibc' 'openssl' 'sh' 'slang')
provides=('slrn')
conflicts=('slrn')
backup=('etc/slrn/slrn.rc' 'etc/slrn/slrnpull.conf')
options=('!makeflags' 'docs' 'zipman')
source=("$url${_pkgname}-${_prever}.tar.gz")
sha256sums=(
  '827d01c529c658492e45a376b99495a932d0d6be1e8e207df6f0062a25f1cff8'
)
sha512sums=(
  '05c05f523565d7af3936f98665a85a1cb0589f4b25dd4a957bcd309293a50c9d624104cca86dae28e37d56243af6296e237214cb767ba2418c21265d91381a5a'
)

prepare() {
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

# eof
