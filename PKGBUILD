#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=fuzzy-logic-toolkit
pkgname=octave-${_pack}
pkgver=0.6.1
pkgrel=1
pkgdesc="A mostly MATLAB-compatible fuzzy logic toolkit for Octave"
arch=(any)
url="https://github.com/lmarkowsky/${_pack}"
license=(GPL-3.0-or-later)
groups=('octave-forge')
depends=('octave>=3.2.4')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
source=("${_archive}::${url}/archive/refs/tags/${pkgver}.tar.gz")
noextract=("${_archive}")
sha512sums=('774d8387cb806bb442b4012def59e509ea5187c3cafbbc209a19e69d4188bdd6750527d13cb2906d878c411e763b8fd1b8b4624a84445da9fd64717b1c89bd3d')

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
