#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=octproj
pkgname=octave-${_pack}
pkgver=3.0.2
pkgrel=1
pkgdesc="This package allows to call functions of PROJ library for cartographic projections and CRS transformations"
arch=(any)
url="https://bitbucket.org/jgpallero/${_pack}"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=3.0.0' 'proj')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
source=("${_archive}::${url}/downloads/${_archive}")
noextract=("${_archive}")
sha512sums=('d7009e8db843528b76b90967d8900e85046227fa98ffd4690b7f12fb54f81f070f155fee1cd58d446e7ade54e8755f080c8561f9f98e6b83629739a5954556b5')

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
