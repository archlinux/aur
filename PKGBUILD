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
# Contributor: kolasa (3.19, 4.0 & 4.1 kernel patch)

_kernver=`uname -r`

pkgname=catalyst
pkgver=15.5
pkgrel=1
#_amdver=15.101.1001
pkgdesc="AMD/ATI Catalyst drivers for linux. fglrx kernel module only. Radeons HD 2 3 4 xxx ARE NOT SUPPORTED"
arch=('i686' 'x86_64')
url="http://www.amd.com"
license=('custom')
depends=('linux>=3.0' 'linux<4.2' 'catalyst-utils')
makedepends=('gcc-libs' 'gcc>4.0.0' 'make' 'linux-headers')
conflicts=('catalyst-test')
install=catalyst.install

url_ref="http://support.amd.com/en-us/download/desktop?os=Linux+x86"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

source=(
	http://www2.ati.com/drivers/linux/amd-catalyst-omega-${pkgver}-linux-run-installers.zip
        ati_make.sh
	makefile_compat.patch
	lano1106_fglrx_intel_iommu.patch
	lano1106_kcl_agp_13_4.patch
	lano1106_fglrx-13.8_proc.patch
	cold-fglrx-3.14-current_euid.patch
	fglrx_gpl_symbol.patch
	fglrx_3.17rc6-no_hotplug.patch
        kolasa-3.19-get_cpu_var.patch
        kolasa_4.0-cr4-strn.patch
        kolasa_4.1_remove-IRQF_DISABLED.patch)

md5sums=('979f9f2e0948fa6e92ff0125f5c6b575'
	 'fd98b7e486d7fd4cad8de7b95b5b031e'
	 '3e1b82bd69774ea808da69c983d6a43b'
	 '5184b94a2a40216a67996999481dd9ee'
	 'c5156eddf81c8a1719b160d05a2e8d67'
	 '2ab4837233de42332753882445373d7b'
	 'ba33b6ef10896d3e1b5e4cd96390b771'
	 'ef97fc080ce7e5a275fe0c372bc2a418'
	 '67a22f624bae95a76638ce269392cb01'
	 '3aa45013515b724a71bbd8e01f98ad99'
	 'dee3df1c5d3ed87363f4304da917fc00'
	 '81a9e38dee025151cccb7e5db2362cfb')


build() {
#       /bin/sh ./amd-catalyst-${pkgver}-linux-x86.x86_64.run --extract archive_files
     /bin/sh ./amd-catalyst-omega-${pkgver}-linux-run-installers.run --extract archive_files

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
      patch -Np1 -i ../lano1106_fglrx-13.8_proc.patch
      patch -Np1 -i ../cold-fglrx-3.14-current_euid.patch
      patch -Np1 -i ../fglrx_3.17rc6-no_hotplug.patch
      patch -Np1 -i ../kolasa-3.19-get_cpu_var.patch
#      test "${CARCH}" = "i686" && patch -Np1 -i ../fglrx_gpl_symbol.patch
#	since 3.19 not only i686 needs gpl symbol - V
      patch -Np1 -i ../fglrx_gpl_symbol.patch
      patch -Np1 -i ../kolasa_4.0-cr4-strn.patch
      patch -Np1 -i ../kolasa_4.1_remove-IRQF_DISABLED.patch

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