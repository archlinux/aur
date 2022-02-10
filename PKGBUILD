#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=mechanics
pkgname=octave-${_pack}
pkgver=1.3.1
pkgrel=6
pkgdesc="Library with functions useful for numerical computation in classical mechanics and structural analysis"
arch=(any)
url="https://octave.sourceforge.io/${_pack}"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=3.4.0' 'octave-linear-algebra>=2.0.0' 'octave-general>=1.2.2' 'octave-geometry>=1.2.1')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
_archive_patched=${_pack}-${pkgver}-patched.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('e70d0e6e0918c052c7339e8979cebd2fcda63333c1ab2a05e45bf174b60dd7601e02e255dc97dbc359d59114b52f2654f2b7be6046a9f6885ac5f0a29f740e87')

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
  # https://github.com/DragonFlyBSD/DPorts/blob/master/math/octave-forge-mechanics/files/patch-verletstep__boxed.cc
  sed -i 's/feval/octave::feval/g' ${_pack}/inst/molecularDynamics/src/verletstep_boxed.cc
  sed -i 's/feval/octave::feval/g' ${_pack}/inst/molecularDynamics/src/verletstep.cc
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
