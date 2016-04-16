# Maintainer: Joshua Hardy joshinsilico
pkgname=molprobity-git
pkgver=r1013.ee5bdd4
pkgrel=2
pkgdesc="All-atom structure validation for macromolecular crystallography"
arch=('any')
url="http://molprobity.biochem.duke.edu/"
license=('BSD')
depends=('python' 'php' 'lib32-libxext' 'java-environment' 'ucsf-chimera' 'lib32-gcc-libs' 'boost-libs' 'tcsh' 'lib32-libxt')
makedepends=('python2' 'git' 'subversion' 'curl' 'tar' 'make' 'gawk')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
options=('!strip')
source=('molprobity-git::git+https://github.com/rlabduke/MolProbity#branch=molprobity_4.2' 
'molprobity.sh')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
	sed -i -e s:"python ../sources/cctbx_project/libtbx/configure.py mmtbx":"python2 ../sources/cctbx_project/libtbx/configure.py mmtbx":g configure.sh
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	./configure.sh
	./setup.sh
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	install -d "${pkgdir}"/opt/MolProbity "${pkgdir}"/usr/share/licenses/molprobity-git $pkgdir/etc/profile.d/
	cp -r * "${pkgdir}"/opt/MolProbity/.
	cp LICENSE.html "${pkgdir}"/usr/share/licenses/molprobity-git/.
	cp $srcdir/molprobity.sh $pkgdir/etc/profile.d/.
}
