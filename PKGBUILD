# Maintainer: Sinan Tan <i@tinytangent.com>
# Contributor: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=cuda-9.0
pkgver=9.0.176.4
_basever=9.0.176
_driverver=384.81
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit. Version 9.0"
arch=('x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom:NVIDIA')
depends=('gcc6-libs' 'opencl-nvidia' 'nvidia-utils' 'gcc6')
provides=('cuda-toolkit' 'cuda-sdk')
optdepends=('gdb: for cuda-gdb'
	'java-runtime: for nsight and nvvp'
	)
options=(!strip staticlibs)
install=cuda-9.0.install

source=(https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_${_basever}_${_driverver}_linux-run
	https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda_${_basever}.1_linux-run
	https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/2/cuda_${_basever}.2_linux-run
	https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/3/cuda_${_basever}.3_linux-run
	https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/4/cuda_${_basever}.4_linux-run
	cuda-9.0.sh
	cuda-9.0.conf
	cuda-findgllib_mk.diff)
sha512sums=(
	'00e24638c02d049c575732dee5237db21f7c451b606f37cf95e44e89d47d0cb055255e9f70dc013298c9e0d224147f239488558904556b68572e3f31935489a9'
	'd65be85a14d782ecfbf43f51e5bc38a5777762e4a8e5f3f5fe915cd4ff98e8616e5630ba45e9cadfd6f30d9495548da5ad73dc519c062a075f16f35b72685e46'
	'ab626de9c856dd8888dc78f5ea88997672aa4e4a09931a09323e98f1189a15ab20b732b71709b09df8198c8c92ac202cf505cf687a509814ca174ac66ea6b3bb'
	'af5843abe208bfcc5fa19b03c017b55e600502308b366a3e49781b1303904d136e25686f208fbc9b313e8a2519d2e6d99b30119f75edd4aca9af7fc6f3ed7218'
	'3f80a79e0f1f426499d77bc32f345ccfe762cf01308d8bc86de24040323ca84e7b08a0bf4f17cceb515d13c459900ad4246f9d224b4d2490e6cd52d32bda6694'
	'3115c602ee8e1b24597d55f715b4614ad688ddd6a701da876729d11b74c1d4debc234905d2a3932c285bae450a1b02693354a4c6a6c3feb44719c7cd0b869dd2'
	'5374b8f545245885a5732f28aa77324f53ab88740972b8c60b312fc310a603552e1c028cf71f2e2d9852041304f2c307a1fcc5ec2c7afc01d431e5f607a5f4fb'
	'6e9a15c73849e6400b0289ed9d6e9d3b7f100712713efcb7bbf4921f39fe671cd9fd3958e735c0da3a44f9afdd2aca94dbc63b564970a0dcacba599b570aca0f')

prepare() {
	sh cuda_${_basever}_${_driverver}_linux-run --extract=${srcdir}
	./cuda-*.run --noexec --keep
	./cuda-samples*.run --noexec --keep

	# path hacks

	# 1rd sed line: sets right path to install man files
	# 2rd sed line: hack to lie installer, now detect launch script by root
	# 3rd sed line: sets right path in .desktop files and other .desktop stuff (warnings by desktop-file-validate)
	sed -e "s|/usr/share|${srcdir}/../pkg/${pkgname}/usr/share|g" \
	    -e 's|can_add_for_all_users;|1;|g' \
	    -e 's|=\\"$prefix\\\"|=/opt/cuda-9.0|g' -e 's|Terminal=No|Terminal=false|g' -e 's|ParallelComputing|ParallelComputing;|g' \
	    -i pkg/install-linux.pl

	# set right path in Samples Makefiles
	sed 's|\$cudaprefix\\|\\/opt\\/cuda\\-9\\.0\\|g' -i pkg/install-sdk-linux.pl

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
	perl install-linux.pl -prefix="${pkgdir}/opt/cuda-9.0" -noprompt
	perl install-sdk-linux.pl -cudaprefix="${pkgdir}/opt/cuda-9.0" -prefix="${pkgdir}/opt/cuda-9.0/samples" -noprompt
	sh "${srcdir}"/cuda_${_basever}.1_linux-run --silent --accept-eula --installdir="${pkgdir}/opt/cuda-9.0"
	sh "${srcdir}"/cuda_${_basever}.2_linux-run --silent --accept-eula --installdir="${pkgdir}/opt/cuda-9.0"
	sh "${srcdir}"/cuda_${_basever}.3_linux-run --silent --accept-eula --installdir="${pkgdir}/opt/cuda-9.0"
	sh "${srcdir}"/cuda_${_basever}.4_linux-run --silent --accept-eula --installdir="${pkgdir}/opt/cuda-9.0"

	# Hack we need because of glibc 2.26 (https://bugs.archlinux.org/task/55580)
	# without which we couldn't compile anything at all.
	# Super dirty hack. I really hope it doesn't break other stuff!
	# Probably we can remove this for cuda 9.
	sed -i "1 i#define _BITS_FLOATN_H" "${pkgdir}/opt/cuda-9.0/include/host_defines.h"

	# Needs gcc7
	ln -s /usr/bin/gcc-6 "${pkgdir}/opt/cuda-9.0/bin/gcc"
	ln -s /usr/bin/g++-6 "${pkgdir}/opt/cuda-9.0/bin/g++"

	# Install profile and ld.so.config files
	install -Dm755 "${srcdir}/cuda-9.0.sh" "${pkgdir}/etc/profile.d/cuda-9.0.sh"
	install -Dm644 "${srcdir}/cuda-9.0.conf" "${pkgdir}/etc/ld.so.conf.d/cuda-9.0.conf"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/cuda-9.0/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

	# Remove redundant man and samples
#	rm -fr "${pkgdir}/opt/cuda-9.0/doc/man"
	rm -fr "${pkgdir}/opt/cuda-9.0/cuda-samples"
#	rm -fr "${pkgdir}/usr/share/man/man3/deprecated.3"*
	rm -fr "${pkgdir}/usr/share/"{applications,man}

	# Remove included copy of java and link to system java
	rm -fr  "${pkgdir}/opt/cuda-9.0/jre"
	sed 's|../jre/bin/java|/usr/bin/java|g' \
	    -i "${pkgdir}/opt/cuda-9.0/libnsight/nsight.ini" \
	    -i "${pkgdir}/opt/cuda-9.0/libnvvp/nvvp.ini"

	# Remove unused files
	rm -fr "${pkgdir}/opt/cuda-9.0/"{bin,samples}'/.'*uninstall_manifest_do_not_delete.txt
	rm -fr "${pkgdir}/opt/cuda-9.0/samples/uninstall_cuda_samples_9.0.pl"
	rm -fr "${pkgdir}/opt/cuda-9.0/bin/cuda-install-samples-9.0.sh"
	rm -fr "${pkgdir}/opt/cuda-9.0/bin/uninstall_cuda_toolkit_9.0.pl"
}
