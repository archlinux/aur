# Maintainer: Jens Staal <staal1978@gmail.com>
# Adopted from linux-git:
# From: Boohbah <boohbah at gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=linux-ltofast-git
pkgbase=${pkgname} #we only have one package
_srcname=linux-misc
pkgver=4.0rc7.r93.g6842019
pkgrel=1
pkgdesc="A non-portable Linux kernel with experimental compilation optimizations: LTO, -Ofast, -march=native, localyesconfig (git version)"
arch=('x86_64')
url="http://www.kernel.org"
# LTO-enabled kernel:
#http://halobates.de/
# march=native support:
#https://github.com/graysky2/kernel_gcc_patch
# one of the earliest signs of successful -Ofast compilation:
#http://duopetalflower.blogspot.be/2011/06/custom-kernel-26391-ubuntu-amd64_23.html
license=('GPL2')
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
optdepends=('crda: to set the correct wireless channels of your country')
provides=("kernel26${_kernelname}=${pkgver}")
conflicts=("kernel26${_kernelname}")
replaces=("kernel26${_kernelname}")
backup=("etc/mkinitcpio.d/${pkgbase}.preset")
install=linux.install
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'binutils-hjl-git')
options=('!strip')
source=('git+https://github.com/andikleen/linux-misc.git#branch=lto-4.0'
        # patch to enable gcc architecture support
        'git+https://github.com/graysky2/kernel_gcc_patch.git'
        # the main kernel config files
        'config.x86_64' 'makelto.patch'
        # standard config files for mkinitcpio ramdisk
        "${pkgbase}.preset")
sha256sums=('SKIP'
            'SKIP'
            'db4d602900f21772a06fd55d8210cb743d8180a7a82728c06a46759172c20d33'
            'e72c31e2ea3ac0a14d30d673872b32053bba719eb0523f22f54f09d17165b2f1'
            'de452ef564907a96bdccf9b1f68dddee152f2fe8c7095e017ddec131bedef9a1')

_kernelname="${pkgbase#linux}"
export LC_ALL=C

pkgver() {
  cd "${srcdir}/${_srcname}"

  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}

prepare() {
  cd "${srcdir}/${_srcname}"

  msg "Apply gcc architecture support"
  patch -l -p1 < "${srcdir}"/kernel_gcc_patch/enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v3.15+.patch
  #we need the gcc-ld wrapper but this fails the Makefile.lto tests
  patch -p1 < "${srcdir}"/makelto.patch
  
  cat "${srcdir}/config.x86_64" > ./.config

  # set localversion to git commit
  sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"-${pkgver##*.}\"|g" ./.config
  sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  
  msg "enable LTO stuff"
  # xen disabled for now, seems to fail.
  # enable mnative by default
  ./scripts/config  --enable mnative \
                    --disable function_tracer \
                    --disable function_graph_tracer \
                    --disable stack_tracer --enable lto_menu \
                    --disable lto_disable \
                    --disable gcov \
		    --disable xen \
                    --disable kallsyms_all \
                    --disable modversions

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  make prepare
    
  #fix Makefile for optimizing CFLAGS
  sed -i "s|-O2|-Ofast -march=native -funroll-loops|g" ./Makefile
  #fix Makefile to ensure use of gcc-ar and gcc-nm
  sed -i "s|)ar|)gcc-ar|g" ./Makefile
  sed -i "s|)nm|)gcc-nm|g" ./Makefile
  
  
  #Activate all new options, they will be trimmed in the localconfig below
  yes "" | make oldconfig
  #select option "20" march=native

  # Use optimized configuration for your hadware
  # make localconfig # only enable stuff in old config for your hardware, with modules
  make localyesconfig # only enable stuff in old config for your hardware, no modules (default)
}

build() {
  cd "${srcdir}/${_srcname}"
  export CFLAGS="-flto -Ofast -march=native -funroll-loops"
  export AR=gcc-ar
  export NM=gcc-nm
  export PATH="${srcdir}/${_srcname}"/scripts:$PATH
  
  make ${MAKEFLAGS} AR=gcc-ar NM=gcc-nm LD=gcc-ld LDFLAGS="-z muldefs -Ofast -flto" CONFIG_LTO=y LOCALVERSION= bzImage modules
}

package() {
  cd "${srcdir}/${_srcname}"

  mkdir -p "${pkgdir}"/{lib/{modules,firmware},boot}

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/${pkgbase}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
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
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux" 
}


# vim:set ts=8 sts=2 sw=2 et:
