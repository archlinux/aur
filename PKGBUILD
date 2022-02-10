#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=specfun
pkgname=octave-${_pack}
pkgver=1.1.0
pkgrel=7
pkgdesc="Special functions including ellipitic functions, etc"
arch=(any)
url="https://octave.sourceforge.io/${_pack}"
license=('custom')
groups=('octave-forge')
depends=('octave>=3.4.0')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
_archive_patched=${_pack}-${pkgver}-patched.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('106fb7fd4504704cf30c27f2d900dea2468dccd3b48fbefa9e7509e33c3f74d93ae1e3fcc857142e4d4f99b546b0bcc81c13c095abab83b7844385606497c2c5')

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
  # https://github.com/macports/macports-ports/blob/master/math/octave-specfun/files/patch-src-ellipj.cc.diff
  sed -i 's/           if (u_arg.is_real_type ()) {/           if (u_arg.isreal ()) {/g' ${_pack}/src/ellipj.cc
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
