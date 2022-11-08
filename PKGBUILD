#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=quaternion
pkgname=octave-${_pack}
pkgver=2.4.0
pkgrel=6
pkgdesc="Quaternion package for GNU Octave, includes a quaternion class with overloaded operators"
arch=(any)
url="https://gnu-octave.github.io/packages/${_pack}"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=3.8.0')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
_archive_patched=${_pack}-${pkgver}-patched.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('cfdeaee08b8c17adb4f5e3ef4bdf8e55d3dad80cc4223dcdcf6b73555109589830ae74c9d0c44b67b91d7774996a1064d8f97a8658de6f22f0acffbb17497b6b')

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
  # https://salsa.debian.org/pkg-octave-team/octave-quaternion/-/blob/debian/latest/debian/patches/build-against-octave-6.patch
  sed -i 's/                || ! ((args(i).is_numeric_type () && args(i).is_real_type ())/                || ! ((args(i).isnumeric () \&\& args(i).isreal ())/g' ${_pack}/src/is_real_array.cc
  sed -i 's/                      || args(i).is_bool_type ()))/                      || args(i).islogical ()))/g' ${_pack}/src/is_real_array.cc
  tar czf "$_archive_patched" "$_pack"
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
