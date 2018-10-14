# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=cuda-9.2
pkgver=9.2.148.1
_basever=9.2.148
_driverver=396.37
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit. Version 9.2"
arch=('x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom:NVIDIA')
depends=('gcc7-libs' 'opencl-nvidia' 'nvidia-utils' 'gcc7')
#replaces=('cuda-toolkit' 'cuda-sdk')
provides=('cuda-toolkit' 'cuda-sdk')
optdepends=('gdb: for cuda-gdb'
	'java-runtime: for nsight and nvvp'
	)
options=(!strip staticlibs)
install=cuda-9.2.install
source=(https://developer.nvidia.com/compute/cuda/9.2/Prod2/local_installers/cuda_${_basever}_${_driverver}_linux
	https://developer.nvidia.com/compute/cuda/9.2/Prod2/patches/1/cuda_${pkgver}_linux
	cuda-9.2.sh
	cuda-9.2.conf
	cuda-findgllib_mk.diff)
sha512sums=('103c59151727b2c14b403799dbde01bbb95e48b95a55050edb4f6786b209876c65a96f8cf5ca7d6b3ac7cd886413b9bf273a7d5afecd8317dcfa49bb63162983'
	'891d1b98c574297702e79f2a73e6315ec7fc193a722622b8455fdc1da48f5132fa762accde5f04a47ad00a833a655fb794f75f1ff691858c8ca8f48c3c87f50a'
	'e240ad3b562f07b6eeade135233d9dc2d956bf3648bc07db5f4bd8541d9d01183b945e34aea8463a730a1f021bf61d33859e7fd924e705dcb2a091159d92cd34'
	'ff3fbd94e9055aae8d4044ad891c34006c265c704d418125a2abe4427f6c9c2db4995bb87afd1a64ee7e7e1b697981124ed90e26778473e8da2ce67ef1fc12b2'
	'6e9a15c73849e6400b0289ed9d6e9d3b7f100712713efcb7bbf4921f39fe671cd9fd3958e735c0da3a44f9afdd2aca94dbc63b564970a0dcacba599b570aca0f')

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
	    -e 's|=\\"$prefix\\\"|=/opt/cuda-9.2|g' -e 's|Terminal=No|Terminal=false|g' -e 's|ParallelComputing|ParallelComputing;|g' \
	    -i pkg/install-linux.pl

	# set right path in Samples Makefiles
	sed 's|\$cudaprefix\\|\\/opt\\/cuda\\-9\\.2\\|g' -i pkg/install-sdk-linux.pl

	# use python2
	find pkg -name '*.py' | xargs sed -i -e 's|env python|env python2|g' -e 's|bin/python|bin/python2|g'

	# Fix up samples tht use findgllib_mk
	for f in pkg/samples/*/*/findgllib.mk; do
		patch $f cuda-findgllib_mk.diff
	done
}

package() {
	cd pkg
	export PERL5LIB=.
	perl install-linux.pl -prefix="${pkgdir}/opt/cuda-9.2" -noprompt
	perl install-sdk-linux.pl -cudaprefix="${pkgdir}/opt/cuda-9.2" -prefix="${pkgdir}/opt/cuda-9.2/samples" -noprompt
	sh "${srcdir}"/cuda_${pkgver}_linux --silent --accept-eula --installdir="${pkgdir}/opt/cuda-9.2"

	# Hack we need because of glibc 2.26 (https://bugs.archlinux.org/task/55580)
	# without which we couldn't compile anything at all.
	# Super dirty hack. I really hope it doesn't break other stuff!
	# Probably we can remove this for cuda 9.
	sed -i "1 i#define _BITS_FLOATN_H" "${pkgdir}/opt/cuda-9.2/include/host_defines.h"

	# Needs gcc7
	ln -s /usr/bin/gcc-7 "${pkgdir}/opt/cuda-9.2/bin/gcc"
	ln -s /usr/bin/g++-7 "${pkgdir}/opt/cuda-9.2/bin/g++"

	# Install profile and ld.so.config files
	install -Dm755 "${srcdir}/cuda-9.2.sh" "${pkgdir}/etc/profile.d/cuda-9.2.sh"
	install -Dm644 "${srcdir}/cuda-9.2.conf" "${pkgdir}/etc/ld.so.conf.d/cuda-9.2.conf"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/cuda-9.2/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

	# Remove redundant man and samples
#	rm -fr "${pkgdir}/opt/cuda-9.2/doc/man"
	rm -fr "${pkgdir}/opt/cuda-9.2/cuda-samples"
#	rm -fr "${pkgdir}/usr/share/man/man3/deprecated.3"*
	rm -fr "${pkgdir}/usr/share/"{applications,man}

	# Remove included copy of java and link to system java
	rm -fr  "${pkgdir}/opt/cuda-9.2/jre"
	sed 's|../jre/bin/java|/usr/bin/java|g' \
	    -i "${pkgdir}/opt/cuda-9.2/libnsight/nsight.ini" \
	    -i "${pkgdir}/opt/cuda-9.2/libnvvp/nvvp.ini"

	# Remove unused files
	rm -fr "${pkgdir}/opt/cuda-9.2/"{bin,samples}'/.'*uninstall_manifest_do_not_delete.txt
	rm -fr "${pkgdir}/opt/cuda-9.2/samples/uninstall_cuda_samples_9.2.pl"
	rm -fr "${pkgdir}/opt/cuda-9.2/bin/cuda-install-samples-9.2.sh"
	rm -fr "${pkgdir}/opt/cuda-9.2/bin/uninstall_cuda_toolkit_9.2.pl"
}
