# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=cula
pkgver=18
pkgrel=1
pkgdesc="Provides GPU-accelerated implementations of the LAPACK and BLAS libraries for dense linear algebra using CUDA. Contains routines for systems solvers, singular value decompositions, and eigenproblems."
arch=("i686" "x86_64")
url="http://www.culatools.com/downloads/"
license=(custom)
depends=("cuda>=5.0.0" "bash" "gcc-libs-multilib" "acml-ifort")
makedepends=("wget")
sha1sums=('f88ff0599dd7d91969d48d75ec689c88bb186bfa'
          '4f5a70c68b569acd27cf1cc9e3f8a59a2e922173')
_mainfile=("cula_dense_free_R${pkgver}-linux.run")
noextract=($_mainfile)
source=("login.sh" "http://www.culatools.com/files/cula/R${pkgver}/${_mainfile}")

if [ ! -e ${_mainfile} ]; then
chmod +x ./login.sh
./login.sh files/cula/R${pkgver} ${_mainfile}
fi

build() {
	rm ${srcdir}/login.sh
	sh ./${_mainfile} --noexec --target ${srcdir}
	sed -i "s^install\_prefix\=\"\/usr\/local\/\$inst\_dir^install\_prefix\=\"${pkgdir}\/usr^g" ${srcdir}/installcula.sh	
	sh ${srcdir}/installcula.sh silent-accept-eula

	# Remove installer files
	rm ${pkgdir}/usr/installcula.sh
	rm ${pkgdir}/usr/$_mainfile
	rm ${pkgdir}/usr/.cula_install_log
	
	# Remove libraries that conflict with installed cuda libraries
	if [[ $CARCH == x86_64 ]]; then
		mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32
		mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
	else
		rm ${pkgdir}/usr/lib64
	fi
	rm -f ${pkgdir}/usr/examples/benchmark/benchmark_

	# Copy license to correct directory
	mkdir -p ${pkgdir}/usr/share/licenses/cula
	cp ${pkgdir}/usr/doc/license.txt ${pkgdir}/usr/share/licenses/cula/LICENSE

	# Put nonstandard directories in /opt/cula
	mkdir -p ${pkgdir}/opt/cula
	mv ${pkgdir}/usr/doc	${pkgdir}/opt/cula/
	mv ${pkgdir}/usr/examples ${pkgdir}/opt/cula/
}
