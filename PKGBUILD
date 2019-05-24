# Maintainer: Karel van de Plassche <karelvandeplassche@gmail.com>
# Contributor: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=cuda-10.0
pkgver=10.0.130.1
_basever=10.0.130
_driverver=410.48
_cudaver=10.0
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit. Version ${_cudaver}"
arch=('x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom:NVIDIA')
depends=('gcc7-libs' 'opencl-nvidia' 'nvidia-utils' 'gcc7')
#replaces=('cuda-toolkit' 'cuda-sdk')
provides=('cuda-toolkit' 'cuda-sdk')
optdepends=('gdb: for cuda-gdb'
	'java-runtime: for nsight and nvvp')
options=(!strip staticlibs)
#install=cuda-10.0.install
source=(https://developer.nvidia.com/compute/cuda/${_cudaver}/Prod/local_installers/cuda_${_basever}_${_driverver}_linux
	cuda-${_cudaver}.sh
	cuda-${_cudaver}.conf
	cuda-findgllib_mk.diff
)
sha512sums=('409ea4cc6aa0fe7063450e77c3b67b9b41aab1bbe556db673fb1a80610b20bd52e2020bf94034a92ab68c721d3d5739500bae4bd7a3558b2d8e73730a3b4ea25'
	'ac102d0e36a67d22e4bb37ba1632a9aa3e1b0fafb8f997f65a92e1128ee96c5f37206636f7cfd4e198820eae35d9ef197f87b279b4e501abf613960d72df2d10'
    '1f3a204ed42fa051fcf401462f2e529d0e11f85c5332f9c8aa5f4a7ead6c09dfecb7eb370a7bd63cf10cb3bdc6528a0f4fc450147e63dd1dad22c2ec6798f24c'
    '99407937f079066829fc18b39b2ddfd2edb621cc7040a0db82dd3f3553272f487f3f183f4638295249b69461112ac1759888c928b404d2b62461c87d2760533c')

prepare() {
	sh cuda_${_basever}_${_driverver}_linux --extract=${srcdir}
	./cuda-*.run --noexec --keep
	./cuda-samples*.run --noexec --keep

	# path hacks

	# 1rd sed line: sets right path to install man files
	# 2rd sed line: hack to lie installer, now detect launch script by root
	# 3rd sed line: sets right path in .desktop files and other .desktop stuff (warnings by desktop-file-validate)
	sed -e "s|/usr/share|${srcdir}/../pkg/${pkgname}/usr/share|g" \
	    -e 's|can_add_for_all_users;|1;|g' \
	    -e 's|=\\"$prefix\\\"|=/opt/cuda-${_cudaver}|g' -e 's|Terminal=No|Terminal=false|g' -e 's|ParallelComputing|ParallelComputing;|g' \
	    -i pkg/install-linux.pl

	# set right path in Samples Makefiles
	sed 's|\$cudaprefix\\|\\/opt\\/cuda\\-10\\.0\\|g' -i pkg/install-sdk-linux.pl

	# use python2
	find pkg -name '*.py' | xargs sed -i -e 's|env python|env python2|g' -e 's|bin/python|bin/python2|g'

	# Fix up samples tht use findgllib_mk
	for f in pkg/samples/*/*/findgllib.mk; do
	    echo $f
	    ls
		patch $f cuda-findgllib_mk.diff
	done
}

package() {
	cd pkg
	export PERL5LIB=.
	perl install-linux.pl -prefix="${pkgdir}/opt/cuda-${_cudaver}" -noprompt
	perl install-sdk-linux.pl -cudaprefix="${pkgdir}/opt/cuda-${_cudaver}" -prefix="${pkgdir}/opt/cuda-${_cudaver}/samples" -noprompt
	sh "${srcdir}"/cuda_${_basever}_${_driverver}_linux --silent --toolkit --toolkitpath="${pkgdir}/opt/cuda-${_cudaver}" --samples --samplespath="${pkgdir}/opt/cuda-${_cudaver}"/samples --driver

	# Hack we need because of glibc 2.26 (https://bugs.archlinux.org/task/55580)
	# without which we couldn't compile anything at all.
	# Super dirty hack. I really hope it doesn't break other stuff!
	# Probably we can remove this for cuda 9.
	#sed -i "1 i#define _BITS_FLOATN_H" "${pkgdir}/opt/cuda-${_cudaver}/include/host_defines.h"

	# Needs gcc7
	ln -s /usr/bin/gcc-7 "${pkgdir}/opt/cuda-${_cudaver}/bin/gcc"
	ln -s /usr/bin/g++-7 "${pkgdir}/opt/cuda-${_cudaver}/bin/g++"

	# Install profile and ld.so.config files
	install -Dm755 "${srcdir}/cuda-${_cudaver}.sh" "${pkgdir}/etc/profile.d/cuda-${_cudaver}.sh"
	install -Dm644 "${srcdir}/cuda-${_cudaver}.conf" "${pkgdir}/etc/ld.so.conf.d/cuda-${_cudaver}.conf"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/cuda-9.2/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

	# Remove redundant man and samples
#	rm -fr "${pkgdir}/opt/cuda-9.2/doc/man"
	rm -fr "${pkgdir}/opt/cuda-${_cudaver}/cuda-samples"
#	rm -fr "${pkgdir}/usr/share/man/man3/deprecated.3"*
	rm -fr "${pkgdir}/usr/share/"{applications,man}

	# Remove included copy of java and link to system java
	rm -fr  "${pkgdir}/opt/cuda-${_cudaver}/jre"
	sed 's|../jre/bin/java|/usr/bin/java|g' \
	    -i "${pkgdir}/opt/cuda-${_cudaver}/libnsight/nsight.ini" \
	    -i "${pkgdir}/opt/cuda-${_cudaver}/libnvvp/nvvp.ini"

	# Remove unused files
	rm -fr "${pkgdir}/opt/cuda-${_cudaver}/"{bin,samples}'/.'*uninstall_manifest_do_not_delete.txt
	rm -fr "${pkgdir}/opt/cuda-${_cudaver}/samples/uninstall_cuda_samples_${_cudaver}.pl"
	rm -fr "${pkgdir}/opt/cuda-${_cudaver}/bin/cuda-install-samples-${_cudaver}.sh"
	rm -fr "${pkgdir}/opt/cuda-${_cudaver}/bin/uninstall_cuda_toolkit_${_cudaver}.pl"
}
