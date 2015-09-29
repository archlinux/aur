# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Great Contributor: Eduardo "kensai" Romero (previous maintainer)
# Contributor: aidanlinz
# Contributor: Rip-Rip
# Contributor: OvsInc
# Contributor: lano1106 (patch to fix support of intel's iommu and to remove dependency of kernel's CONFIG_AGP option)
# Contributor: lano1106 (patch to remove dependency of kernel's CONFIG_AGP option)
# Contributor: lano1106 (patch to improve jacob@amd patch)
# Contributor: zoopp
# Contributor: Cold (current_euid patch)
# Contributor: ubuntu (parts of 4.0, 4.1 and 4.2 kernel patches)
# Contributor: kolasa (part of 4.2 kernel patches)

_kernver=`uname -r`

pkgname=catalyst
pkgver=15.9
pkgrel=1
_amdver=15.201.1151
pkgdesc="AMD/ATI Catalyst drivers for linux-lts. fglrx kernel module only. Radeons HD 2 3 4 xxx ARE NOT SUPPORTED"
arch=('i686' 'x86_64')
url="http://www.amd.com"
license=('custom')
depends=('linux-lts>=3.0' 'linux-lts<4.2' 'catalyst-utils')
makedepends=('gcc-libs' 'gcc>4.0.0' 'make' 'linux-headers')
conflicts=('catalyst-test')
install=catalyst.install

url_ref="http://support.amd.com/en-us/download/desktop?os=Linux+x86"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

source=(
	http://www2.ati.com/drivers/linux/amd-catalyst-${pkgver}-linux-installer-${_amdver}-x86.x86_64.zip
        ati_make.sh
	makefile_compat.patch
    lano1106_fglrx_intel_iommu.patch
    lano1106_kcl_agp_13_4.patch
    lano1106_fglrx-13.8_proc.patch
    cold-fglrx-3.14-current_euid.patch
    fglrx_gpl_symbol.patch
    fglrx_3.17rc6-no_hotplug.patch
    ubuntu_buildfix_kernel_4.0.patch
    ubuntu_buildfix_kernel_4.1.patch
    ubuntu_buildfix_kernel_4.2.patch
    4.2-fglrx-has_fpu.patch
    4.2-kolasa-fpu_save_init.patch)

md5sums=('d2de2df6946b452c266a3c892e6e46ff'
	 'fd98b7e486d7fd4cad8de7b95b5b031e'
	 '3e1b82bd69774ea808da69c983d6a43b'
	 '5184b94a2a40216a67996999481dd9ee'
	 'c5156eddf81c8a1719b160d05a2e8d67'
	 '2ab4837233de42332753882445373d7b'
	 'ba33b6ef10896d3e1b5e4cd96390b771'
	 'ef97fc080ce7e5a275fe0c372bc2a418'
	 '67a22f624bae95a76638ce269392cb01'
	 '880d5e59554cda382f74206c202942be'
	 '982451bcc1fa1ee3da53ffa481d65581'
	 '88832af8d6769aa51fa9b266a74394e0'
	 'ed7748a593d6b894269f8c7856b7ae50'
	 'dd51495a1d8f2d1042f04a783bf01e08')


build() {
#       /bin/sh ./amd-catalyst-${pkgver}-linux-x86.x86_64.run --extract archive_files
#      /bin/sh ./amd-catalyst-omega-${pkgver}-linux-run-installers.run --extract archive_files
     /bin/sh ./AMD-Catalyst-${pkgver}-Linux-installer-${_amdver}-x86.x86_64.run --extract archive_files

  ## include ati_make.sh and use _ati_check function from it
      . ati_make.sh
      _ati_check

      if [ "${CARCH}" = "x86_64" ]; then
	BUILDARCH=x86_64
	_archdir=x86_64
      fi
      if [ "${CARCH}" = "i686" ]; then
	BUILDARCH=i386
	_archdir=x86
      fi
      cd ${srcdir}/archive_files
   ## makefile patch to choose arch_compat_alloc_user_space or older compat_alloc_user_space
   ## works only in combination with ati_make.sh script
      patch -Np1 -i ../makefile_compat.patch
      patch -Np1 -i ../lano1106_fglrx_intel_iommu.patch
      patch -Np1 -i ../lano1106_kcl_agp_13_4.patch
#       patch -Np1 -i ../lano1106_fglrx-13.8_proc.patch
#       patch -Np1 -i ../cold-fglrx-3.14-current_euid.patch
#       patch -Np1 -i ../fglrx_3.17rc6-no_hotplug.patch
#      test "${CARCH}" = "i686" && patch -Np1 -i ../fglrx_gpl_symbol.patch
#	since 3.19 not only i686 needs gpl symbol - V
      patch -Np1 -i ../fglrx_gpl_symbol.patch
      patch -Np1 -i ../ubuntu_buildfix_kernel_4.0.patch
      patch -Np1 -i ../ubuntu_buildfix_kernel_4.1.patch
      patch -Np1 -i ../ubuntu_buildfix_kernel_4.2.patch        #three 4.2 patches left for testing purposes, use  simultaneously - V
      patch -Np1 -i ../4.2-fglrx-has_fpu.patch
      patch -Np1 -i ../4.2-kolasa-fpu_save_init.patch

      cd ${srcdir}/archive_files/common/lib/modules/fglrx/build_mod
      cp ${srcdir}/archive_files/arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a .
      cp 2.6.x/Makefile .
   ## Compile module using _ati_check variables
      CFLAGS_MODULE="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=$PAGE_ATTR_FIX -DCOMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE $def_smp $def_modversions"
      make -C /usr/lib/modules/${_kernver}/build SUBDIRS="`pwd`" ARCH=${BUILDARCH} \
      MODFLAGS="$CFLAGS_MODULE" \
      CFLAGS_MODULE="$CFLAGS_MODULE" \
      PAGE_ATTR_FIX=$PAGE_ATTR_FIX COMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE modules
}

package() {
      for r in /usr/lib/modules/*; do
	if [[ ${r:17:3} = "ext" ]]; then
	  if [[ `cat ${r}/version | grep -c ${_kernver}` != 0 ]]; then
	    _destidir=${r}
	    sed -i -e "s/EXTRAMODULES=.*/EXTRAMODULES=${r:17}/" $startdir/catalyst.install
	  fi
	fi
      done

      cd ${srcdir}/archive_files/common/lib/modules/fglrx/build_mod
      install -m755 -d ${pkgdir}${_destidir}
      install -m644 fglrx.ko ${pkgdir}${_destidir}
      find ${pkgdir} -name '*.ko' -exec gzip -9 {} \;
      install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
      install -m644 ${srcdir}/archive_files/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}
      sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" $startdir/catalyst.install
}