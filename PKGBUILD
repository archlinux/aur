#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=secs2d
pkgname=octave-${_pack}
pkgver=0.0.8
pkgrel=5
pkgdesc="A Drift-Diffusion simulator for 2d semiconductor devices"
arch=(any)
url="https://gnu-octave.github.io/packages/${_pack}"
license=('GPL')
groups=('octave-forge')
depends=('octave>=2.9.17')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
_archive_patched=${_pack}-${pkgver}-patched.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}"
  "octave_map.patch")
noextract=("${_archive}")
sha512sums=('25828a2972e9c5e5572b1fd33ece3546f8089e9fac51b53987491a0d74ca8704aa3caae351719ae2db3fda1a1f343a03a988e3dd2f989f57054623ff9a90ccfe'
  'd05462dc6cd77c4de6d6983778b9fc1a9e42e6638a6e694a837c7b54981338af42c3faf69aac86a6766b566cc5fdbbde7ed4d71fb6853f45c8f745fd538e193b')

_octave_run() {
  octave --no-history --no-init-file --no-window-system -q -f --eval "$*"
}

_install_dir() {
  src=$1
  dst=$2
  mkdir -p "$(dirname "$dst")"
  cp -rT "$src" "$dst"
}

prepare() {
  cd "$srcdir"
  tar xzf "$_archive"
  patch -Np0 -i octave_map.patch
  # https://savannah.gnu.org/bugs/?59606
  sed -i 's/^  octave_idx_type lx = X.length();/  octave_idx_type lx = X.numel();/' ${_pack}-${pkgver}/src/Ubern.cc
  tar czf "$_archive_patched" "$_pack-$pkgver"
}

build() {
  _prefix="$srcdir"/install_prefix
  _archprefix="$srcdir"/install_archprefix
  mkdir -p "$_prefix" "$_archprefix"
  cd "$srcdir"
  _octave_run "$(
    cat <<-EOF
			pkg local_list octave_packages;
			pkg prefix $_prefix $_archprefix;
			pkg install -verbose -nodeps $_archive_patched;
		EOF
  )"
}

package() {
  prefix=$pkgdir/usr/share/octave/packages
  archprefix=$pkgdir/usr/lib/octave/packages
  _install_dir "$srcdir"/install_prefix "$prefix"
  _install_dir "$srcdir"/install_archprefix "$archprefix"
}
