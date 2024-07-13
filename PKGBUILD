#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=queueing
pkgname=octave-${_pack}
pkgver=1.2.8
pkgrel=1
pkgdesc="The queueing package provides functions for queueing networks and Markov chains analysis"
arch=(any)
url="https://github.com/mmarzolla/${_pack}"
license=(GPL-3.0-or-later)
groups=('octave-forge')
depends=('octave>=4.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
source=("${_archive}::${url}/archive/refs/tags/${pkgver}.tar.gz")
noextract=("${_archive}")
sha512sums=('67a0a7c36297da5949e29e3b32b96502b7292c4faa83ac470f798a41ca39182dc2e8dd441d4385d7fdf3c0e52533d3c081582ce155967eadff2d2041131e154f')

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
