# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jens Staal <staal1978@gmail.com>

pkgbase=llvmlinux-git
pkgname=${pkgbase}
pkgver=4.0.r7209.g7d69cff
pkgrel=1
pkgdesc="The Linux Kernel built with (native) LLVM/Clang"
arch=('i686' 'x86_64')
url="http://llvm.linuxfoundation.org/index.php/Main_Page"
license=('GPL2')
depends=('coreutils' 'linux-firmware' 'mkinitcpio')
makedepends=('git' 'quilt' 'llvm' 'clang')
optdepends=('crda: to set the correct wireless channels of your country')
backup=("etc/mkinitcpio.d/${pkgbase}.preset")
install=llvmlinux-git.install
options=(!strip)
#add the source checkouts in sources to avoid having to repeat them.
source=('llvmlinux'::'git://git.linuxfoundation.org/llvmlinux.git'
	'kernel'::'git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git'
	'https://projects.archlinux.org/svntogit/packages.git/snapshot/packages-packages/linux.tar.gz'
	'llvmlinux-git.preset'
	'0001_clang_arch.patch')
md5sums=('SKIP'
         'SKIP'
         'fad7f266e3fee904117eb59970d246cf'
         '951a65b16527d6f9058bcde1ec2ec158'
         'ccd57fa4236cfb7ed622aab11ab71a59')


export CC=clang
export CXX=clang++
export KARCH=x86
export USE_ARCH_PATCH="yes"

#32-bit build assume i586, so we need a variable for that
if [ ${CARCH} == i686 ]; then
	_lll_target=i586
else
	_lll_target=x86_64
fi

pkgver() {
	cd "${srcdir}/kernel"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
	# ok some hacking needed to get this working...
	ln -s ${srcdir}/kernel ${srcdir}/llvmlinux/arch/all/kernel.git

	_config=${srcdir}/llvmlinux/targets/${_lll_target}/config_${_lll_target}

	#Add stuff to the default llvmlinux config
	sed -i 's|# CONFIG_BTRFS_FS is not set|CONFIG_BTRFS_FS=m \n CONFIG_BTRFS_FS_POSIX_ACL=y|g' ${_config}


	_archstuff="${srcdir}/packages-packages/linux/trunk"

############################## Config ####################################
	# Using Arch Linux Kernel Config (32-bit or 64-bit. Depending on $CARCH)
	#if [ ${CARCH} == i686 ]; then
	#	cp ${_archstuff}/config ${srcdir}/llvmlinux/targets/${_lll_target}/config_${_lll_target}
	#else
	#	cp ${_archstuff}/config.x86_64 ${srcdir}/llvmlinux/targets/${_lll_target}/config_${_lll_target}
	#fi

	# Alternative methods to configure the kernel. Replace the line below with one of your choice.
	cd $srcdir/kernel
	#make menuconfig # CLI menu for configuration
	#make nconfig # new CLI menu for configuration
	#make xconfig # X-based configuration
	#make oldconfig # using old config from previous kernel version
	# ... or manually edit .config

	make localmodconfig

	#Copy generated config to llvm target directory
	cp .config ${srcdir}/llvmlinux/targets/${_lll_target}/config_${_lll_target}

	# fixing some configuration options
	sed -i 's|CONFIG_LOCALVERSION="-ARCH"|CONFIG_LOCALVERSION="-llvmlinux"|g' ${_config}
	sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ${_config}

################################################################################

############################## ARCH patch ######################################
	if [ ${USE_ARCH_PATCH} == yes ]; then

	#patch kernel sources with Arch linux kernel patches
	mkdir ${srcdir}/llvmlinux/targets/${_lll_target}/patches/
	cp ${_archstuff}/*.patch ${srcdir}/llvmlinux/targets/${_lll_target}/patches/

	fi

	# i686 llvm from Arch has target i386 and llvmlinux will check for i586 [WIP]
	#cd $srcdir/
	#patch -Np0 -i 0001_clang_arch.patch
}

build() {
	cd ${srcdir}/llvmlinux/targets/${_lll_target}/
	# "native" means distro-installed clang (over 3.3 needed).
	make CLANG_TOOLCHAIN=native kernel-build
}

package() {
	cd ${srcdir}/llvmlinux/targets/${_lll_target}/src/linux

	# don't run depmod on 'make install'. We'll do this ourselves in packaging
  	sed -i '2iexit 0' scripts/depmod.sh

	# get kernel version
	_kernver="$(make LOCALVERSION= kernelrelease)"
	_basekernel=${_kernver%%-*}
	_basekernel=${_basekernel%.*}

	mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
	make LOCALVERSION= INSTALL_MOD_PATH="$pkgdir" modules_install
	cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

	# add vmlinux
  	install -D -m644 vmlinux "${pkgdir}/usr/src/linux-${_kernver}/vmlinux"

  	# set correct depmod command for install
  	cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  	true && install=${install}.pkg
  	sed \
    	 -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    	 -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    	 -i "${startdir}/${install}"

  	# install mkinitcpio preset file for kernel
  	install -D -m644 "${srcdir}/llvmlinux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  	sed \
    	 -e "1s|'linux.*'|'${pkgbase}'|" \
    	 -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    	 -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    	 -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    	 -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  	# remove build and source links
  	rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  	# remove the firmware
  	rm -rf "${pkgdir}/lib/firmware"
  	# gzip -9 all modules to save 100MB of space
  	find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;

  	# Now we call depmod...
  	depmod -b "$pkgdir" -F System.map "$_kernver"

  	# move module tree /lib -> /usr/lib
  	mv "$pkgdir/lib" "$pkgdir/usr"

	#ensure that up-to-date Arch linux patches + config are downloaded next time
	rm ${startdir}/linux.tar.gz
	rm -rf ${srcdir}/packages-packages
}
