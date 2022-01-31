#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=strings
pkgname=octave-${_pack}
pkgver=1.2.0
pkgrel=5
pkgdesc="Additional functions for manipulation and analysis of strings"
arch=(any)
url="https://octave.sourceforge.io/${_pack}"
license=('custom')
groups=('octave-forge')
depends=('octave>=3.8.0')
makedepends=('pcre')
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
_archive_patched=${_pack}-${pkgver}-patched.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('5635e67796c7f04fe6bf8cd1d39f3aa6d473ceae067b8127edfade936359cea015efe4418a4865b9aacbb254b9c6f4cf0dfd681d7da33d3fa6e5015ec89fdc0f')

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
  # https://savannah.gnu.org/bugs/?57000
  sed -i 's/gripe_wrong_type_arg/err_wrong_type_arg/g' ${_pack}-${pkgver}/src/pcregexp.cc
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
