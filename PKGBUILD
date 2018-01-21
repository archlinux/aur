# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Great Contributor: Eduardo "kensai" Romero (previous maintainer)
# Contributor: aidanlinz
# Contributor: Rip-Rip
# Contributor: OvsInc
# Contributor: lano1106 (patch to fix support of intel's iommu and to remove dependency of kernel's CONFIG_AGP option)
# Contributor: lano1106 (patch to remove dependency of kernel's CONFIG_AGP option)
# Contributor: lano1106 (patch to improve jacob@amd patch)
# Contributor: zoopp
# Contributor: kolasa (part of 4.3 kernel patches)
# Contributor: gentoo (part of 4.3 kernel patches)
# Contributor: Philip Muller @ Manjaro (4.4 kernel patch)
# Contributor: sling00 (4.10 kernel patch)
# Contributor: npfeiler (4.11, 4.12, 4.13 and 4.14 kernel patch)


_kernver=`uname -r`

pkgname=catalyst
pkgver=15.9
pkgrel=18
_amdver=15.201.1151
pkgdesc="AMD/ATI Catalyst drivers for linux. fglrx kernel module only. Radeons HD 2 3 4 xxx ARE NOT SUPPORTED"
arch=('i686' 'x86_64')
url="http://www.amd.com"
license=('custom')
depends=('linux>=3.0' 'linux<4.15' 'catalyst-utils')
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
    fglrx_gpl_symbol.patch
    4.3-kolasa-seq_printf.patch
    4.3-gentoo-mtrr.patch
    4.2-amd-from_crimson_15.11.patch
    crimson_i686_xg.patch
    4.4-manjaro-xstate.patch
    grsec_arch.patch
    4.6-arch-get_user_pages-page_cache_release.patch
    4.7-arch-cpu_has_pge-v2.patch
    4.9_over_4.6-arch-get_user_pages_remote.patch
    4.10-arch-sling00-virtual_address-acpi_get_table_with_size.patch
    4.11-npfeiler-signal_vmf.patch
    4.12-npfeiler-PUD_OFFSET.patch
    4.12-arch-remove_clts.patch
    4.12-npfeiler-movsl_mask.patch
    4.13-npfeiler-wait_queue_t.patch
    4.14-npfeiler-task_struct-mm_segment_t.patch)

md5sums=('d2de2df6946b452c266a3c892e6e46ff'
	 'fd98b7e486d7fd4cad8de7b95b5b031e'
	 '3e1b82bd69774ea808da69c983d6a43b'
	 '5184b94a2a40216a67996999481dd9ee'
	 'c5156eddf81c8a1719b160d05a2e8d67'
	 'ef97fc080ce7e5a275fe0c372bc2a418'
	 '0e0666e95d1d590a7a83192805679485'
	 '98828e3eeaec2b3795e584883cc1b746'
	 'fd2851026228ca72124972d1ea0335ea'
	 '6cdbaf5f71d867d225721a0369413616'
	 'd9bea135ae3e1b3ca87c5bbe6dcf8e72'
	 '8941e91fc58cb44ce21ab9bda135754e'
	 '11b7c2e0dc4794801005d66b0e7608a3'
	 '37eef5103a11d8136979463e7bc31091'
	 '194cb44e9e2ab0e65b6267aca66d0400'
	 '05f6364db877d9c4bdf1592deda905b7'
	 '8e53ba65a0aad42eb2ff771c1ace6609'
	 'f090e47160403e4ba65d1e0de69973c9'
	 '782769206ed12ded10c347be3e476729'
	 'cb25bc7fbb7d5cb1c07d2f3fa5fda826'
	 '0a725f40bc980d578cbed3e57a05b765'
	 '5ba3bf9f58aa63c1849b056cf23022c9')


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
      patch -Np1 -i ../4.2-amd-from_crimson_15.11.patch
      patch -Np1 -i ../4.3-kolasa-seq_printf.patch
      patch -Np1 -i ../4.3-gentoo-mtrr.patch
      patch -Np1 -i ../fglrx_gpl_symbol.patch
      test "${CARCH}" = "i686" && patch -Np1 -i ../crimson_i686_xg.patch
      patch -Np1 -i ../4.4-manjaro-xstate.patch
      patch -Np1 -i ../grsec_arch.patch
      patch -Np1 -i ../4.6-arch-get_user_pages-page_cache_release.patch
      patch -Np1 -i ../4.7-arch-cpu_has_pge-v2.patch
      patch -Np1 -i ../4.9_over_4.6-arch-get_user_pages_remote.patch
      patch -Np1 -i ../4.10-arch-sling00-virtual_address-acpi_get_table_with_size.patch
      patch -Np1 -i ../4.11-npfeiler-signal_vmf.patch
      patch -Np1 -i ../4.12-npfeiler-PUD_OFFSET.patch
      patch -Np1 -i ../4.12-arch-remove_clts.patch
      patch -Np1 -i ../4.12-npfeiler-movsl_mask.patch
      patch -Np1 -i ../4.13-npfeiler-wait_queue_t.patch
      patch -Np1 -i ../4.14-npfeiler-task_struct-mm_segment_t.patch

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
