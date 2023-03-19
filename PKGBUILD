# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=slrn-snapshot
_pkgname=slrn
pkgver=1.0.4.9
_prever='pre1.0.4-9'
pkgrel=1
pkgdesc='An easy-to-use, text-mode, threaded Usenet/NNTP client/newsreader (development snapshot)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://jedsoft.org/snapshots/'
license=('GPL')
makedepends=('uudeview')
depends=('glibc' 'openssl' 'slang')
provides=('slrn')
conflicts=('slrn')
backup=(etc/slrnrc)
options=('!makeflags' 'docs' 'zipman' 'lto')
source=("https://jedsoft.org/snapshots/${_pkgname}-${_prever}.tar.gz")
sha256sums=(
  '827d01c529c658492e45a376b99495a932d0d6be1e8e207df6f0062a25f1cff8'
)
sha512sums=(
  '05c05f523565d7af3936f98665a85a1cb0589f4b25dd4a957bcd309293a50c9d624104cca86dae28e37d56243af6296e237214cb767ba2418c21265d91381a5a'
)
b2sums=(
  '667654876dfb087da62288d646a78454a3387e65555e56d34835b9bd6dfe3cf47d5e61ef52e3b11b2df377660db271d1a74e4e986fa826f475cf2bd51ddf6a5d'
)

# The current community/uudeview package is broken.
# To build the slrn-snapshot without UU support, set the
# SLRN_NO_UU variable to true|yes|t|y|1, e.g.:
#   env SLRN_NO_UU=true makepkg
build() {
  cd "$_pkgname-$_prever" || exit 1

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
	--with-uulib=/usr/lib/uudeview \
	--with-uuinc=/usr/include/uudeview \
	--enable-spoilers

      make UUDEVIEW_LIB='/usr/lib/uudeview/*.o'
    ;;
  esac

}

package() {
  cd "$_pkgname-$_prever" || exit 1

  make DESTDIR="$pkgdir" install

  install -Dm0644 COPYRIGHT   "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  install -Dm0644 doc/slrn.rc "$pkgdir/etc/slrnrc"
}

# eof
