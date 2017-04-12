# Maintainer: Joshua Hardy joshinsilico@gmail.com
pkgname=simple2
pkgver=2.1
pkgrel=1
pkgdesc="Single-particle IMage Processing Linux Engine for cryo-EM image processing, focusing on ab initio 3D reconstruction of low-symmetry single-particles"
arch=(x86_64)
url="http://simplecryoem.com"
license=('GPL')
depends=('lapack' 'python2' 'fftw' 'java-environment')
makedepends=('gcc49')
optdepends=()
source=("http://simplecryoem.com/binaries/simple2.1.tar.gz" "simple2.sh" "simple2.csh")
md5sums=('f01eee32ec5071bdd7e5a3c505418335' 'SKIP' 'SKIP')
build() {
	cd "${srcdir}"/simple${pkgver}
	cp scripts/Template_FEDORA_21x64_CPU_simple_user_input.pm simple_user_input.pm
	sed -i -e s:"our\$CC_COMPILER = \"gcc\";":"our\$CC_COMPILER = \"gcc-4.9.4\";":g simple_user_input.pm
	sed -i -e s:"our\$GCC_COMPILER = \"g++\";":"our\$GCC_COMPILER = \"g++-4.9.4\";":g simple_user_input.pm
	sed -i -e s:"our\$FCOMPILER = \"gfortran\";":"our\$FCOMPILER = \"gfortran-4.9.4\";":g simple_user_input.pm
        sed -i -e s:"our\$SIMPLE_PATH=\"/mysimplepath/\";":"our\$SIMPLE_PATH=\""$PWD"\";":g simple_user_input.pm
	./Makefile_genAll.pl
	sed -i -e s:"export SIMPLEPATH=/home/josh/packages/simple/src/simple2.1":"export SIMPLEPATH=/opt/simple2":g add2.bashrc	
	sed -i -e s:"python ./checks/simple_LibTests/report.py":"python2 ./checks/simple_LibTests/report.py":g Makefile
	echo "SIMPLE was developed by the Elmlund laboratory. Please register use at http://simplecryoem.com/download_form.html"
}	
package() {
	install -d "${pkgdir}"/opt "${pkgdir}"/etc/profile.d
	cp -r "${srcdir}"/simple${pkgver} "${pkgdir}"/opt/simple2
	install -D -m755 "${srcdir}"/simple2*sh "${pkgdir}"/etc/profile.d/.
}
