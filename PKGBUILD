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
pkgver=2.4.1
pkgrel=1
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
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('36855263d7f78082d234981642635904858d72dd7f0f196a4aadd6c6ce3178850047b792300dae92ce611cd00306f3ec562353c7ffb094ae4def567ebf27977a')

_octave_run() {
  octave --no-history --no-init-file --no-window-system -q -f --eval "$*"
}

_install_dir() {
  src=$1
  dst=$2
  mkdir -p "$(dirname "$dst")"
  cp -rT "$src" "$dst"
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
		pkg install -verbose -nodeps $_archive;
		EOF
  )"
}

package() {
  prefix=$pkgdir/usr/share/octave/packages
  archprefix=$pkgdir/usr/lib/octave/packages
  _install_dir "$srcdir"/install_prefix "$prefix"
  _install_dir "$srcdir"/install_archprefix "$archprefix"
}
