# Maintainer: Lucas H. Gabrielli <heitzmann at gmail dot com>

pkgname=slepc-git
pkgver=20190113
pkgrel=1
pkgdesc="Scalable library for Eigenvalue problem computations"
provides=(slepc)
conflicts=(slepc)
arch=('i686' 'x86_64')
url="http://www.grycap.upv.es/slepc"
license=('BSD')
depends=('petsc')
install=slepc.install
source=(slepc::git+https://bitbucket.org/slepc/slepc#branch=maint)
sha256sums=('SKIP')


pkgver() {
  cd slepc
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}


prepare() {
  # force using python2
  MATCH='\(/usr/bin/env\|/usr/bin/\)python[[:digit:].]*'
  while IFS= read file; do
    sed -i "s#$MATCH#\\1python2#" "$file"
  done < <( find ${srcdir} -name "*" -type f -exec grep -le "$MATCH" \{\} + )
}


build() {
	source /etc/profile.d/petsc.sh
	_install_dir=/opt/slepc/`basename ${PETSC_DIR}`

	cd slepc

	export SLEPC_DIR="${srcdir}/slepc"

	python2 ./configure --prefix=${_install_dir}

	make all
}


package() {
	cd slepc

	source /etc/profile.d/petsc.sh

	_build_dir="${srcdir}/slepc"
  _petsc_arch=`basename ${PETSC_DIR}`
	_install_dir=/opt/slepc/${_petsc_arch}

	export SLEPC_DIR="${_build_dir}"

	make DESTDIR="${pkgdir}" install

	#_dest_dir=${pkgdir}${_install_dir}
	#sed -i "s#${pkgdir}##g" "${_dest_dir}/include/slepcconf.h"
	#sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/pkgconfig/SLEPc.pc"
	#sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/modules/${pkgname}/${pkgver}"
	#sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepc_rules"
	#sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepc_variables"
	#sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepcrules"
	#sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepcvariables"
	#sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/uninstall.py"
	#sed -i "s#${_build_dir}#${_install_dir}#g" "${_dest_dir}/lib/slepc/conf/uninstall.py"

	# remove logs containing references to the build dir
	#rm -f "${_dest_dir}/lib/slepc/conf/configure.log"
	#rm -f "${_dest_dir}/lib/slepc/conf/make.log"

	# install licence (even though there is no such word as licenses)
  install -Dm 644 ${_build_dir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	mkdir -p "${pkgdir}/etc/profile.d"
	echo "export SLEPC_DIR=${_install_dir}" > "${pkgdir}/etc/profile.d/slepc.sh"
	chmod +x "${pkgdir}/etc/profile.d/slepc.sh"

	# show where the shared libraries are
	install -d -m755 "${pkgdir}/etc/ld.so.conf.d/"
	echo "${_install_dir}/lib" > "${pkgdir}/etc/ld.so.conf.d/slepc.conf"
}
