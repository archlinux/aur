# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=slrn-snapshot-canlock
_pkgname=slrn
pkgver=1.0.4.6
_prever='pre1.0.4-6'
pkgrel=2
pkgdesc='An easy-to-use, text-mode, threaded Usenet/NNTP client/newsreader (development snapshot with cancel-lock)'
arch=('x86_64' 'armv7h')
url='https://jedsoft.org/snapshots/'
license=('GPL')
makedepends=('uudeview')
depends=('openssl' 'slang' 'libcanlock')
provides=('slrn')
conflicts=('slrn')
backup=(etc/slrnrc)
options=('!makeflags' 'docs' 'zipman')
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
  '07cceea256b53b876ba3e684f7fb1174'
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

  install -Dm0644 COPYRIGHT   "$pkgdir/licenses/$pkgname/COPYRIGHT"
  install -Dm0644 doc/slrn.rc "$pkgdir/etc/slrnrc"
}

sha256sums=(
  'baa2d41d8b55896d393352ea7bb8ca130fa7d3a4d69094a71e6db7077d0333e0'
  'e70b6980b80d4fa65651fe9deb50c458943d833dddd39925fb53e5ded2059739'
)
sha512sums=(
  '160eb6336ab694d15fa80b6746fca00fe02665cd1be55f5693790f4f0e91568a4d3ccb4af9cbdfbce252c637f4a09f64a64139dfc9ac04b067e3af91bb6f7d5e'
  '31d88d6e4ddf24da0ed870001e1c41ccdb88c2d7c5bf8a5b1671cd2ac48c03a24343f2fa3590ad73c5f9e5ff603b2e3241959e8f8dc5f7a849f9f44c28c6f363'
)
b2sums=(
  'ec48f0897fa536d11d0bd2ab600ef048a89d88b0e399a56e28716035b91ddb4d0f6e475c5c1eee4a096c45e108a104b05a970ff0706eea0121b14cd88c5fb6d7'
  '0bfd30519f681636d33ade106b35672c9d43c024c9af6580f73b3b3ddc01137124b51a29c8b93810dbe200affa97206475876eff3fd7bccc5d4b0beca05d185f'
)

# eof
