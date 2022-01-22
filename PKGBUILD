#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=msh
pkgname=octave-${_pack}
pkgver=1.0.10
pkgrel=5
pkgdesc="Create and manage triangular and tetrahedral meshes for Finite Element or Finite Volume PDE solvers. Use a mesh data structure compatible with PDEtool. Rely on gmsh for unstructured mesh generation."
arch=(any)
url="https://octave.sourceforge.io/${_pack}"
license=('GPL2')
groups=('octave-forge')
depends=('octave>=3.0' 'octave-splines')
makedepends=()
optdepends=('gmsh>=1.6.5' 'awk' 'dolfin')
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('6fd1983d19feb5130725be6157d3316d15268487677312391f7c3d067af7c9868408f42e38f2550fc62715c926cd36290cdea0fde81e96f3820f3336109d4094')

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
