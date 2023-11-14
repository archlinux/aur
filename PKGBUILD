# Contributor: Joshua Hardy joshinsilico

pkgname='molprobity-git'
pkgver=r1013.ee5bdd4
pkgrel=2
pkgdesc="All-atom structure validation for macromolecular crystallography"
arch=('any')
url="http://molprobity.biochem.duke.edu/"
license=('BSD')
depends=(
  'boost-libs'
  'java-environment'
  'lib32-gcc-libs'
  'lib32-libxext'
  'lib32-libxt'
  'php'
  'python'
  'tcsh'
  'ucsf-chimera'
)
makedepends=(
  'curl'
  'gawk'
  'git'
  'make'
  'python2'
  'subversion'
  'tar'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=(
  "${pkgname%-git}::git+https://github.com/rlabduke/MolProbity#branch=molprobity_4.2"
  'molprobity.sh'
)
md5sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -i -e s:"python ../sources/cctbx_project/libtbx/configure.py mmtbx":"python2 ../sources/cctbx_project/libtbx/configure.py mmtbx":g configure.sh
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./configure.sh
  ./setup.sh
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "${pkgdir}"/opt/MolProbity "${pkgdir}"/usr/share/licenses/molprobity-git $pkgdir/etc/profile.d/
  cp -r * "${pkgdir}"/opt/MolProbity/.
  cp LICENSE.html "${pkgdir}"/usr/share/licenses/molprobity-git/.
  cp $srcdir/molprobity.sh $pkgdir/etc/profile.d/.
}
