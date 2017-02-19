# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Great Contributor: Shen Miren <dickeny@gmail.com> (catalyst_build_module idea and important code)
# Great Contributor: B. M. Kwapinski <lord.xml@web.de> (makepkg idea)
# Big Contributor: Mikkel Oscar Lyderik <mikkeloscar@gmail.com> (autocompletion for bash and zsh)
# Contributor: aidanlinz
# Contributor: Rip-Rip
# Contributor: nob
# Contributor: lano1106 (patch to fix support of intel's iommu and to remove dependency of kernel's CONFIG_AGP option)
# Contributor: lano1106 (patch to remove dependency of kernel's CONFIG_AGP option)
# Contributor: lano1106 (patch to improve jacob's patch)
# Contributor: zoopp
# Contributor: kolasa (part of 4.3 kernel patches)
# Contributor: gentoo (part of 4.3 kernel patches)
# Contributor: Philip Muller @ Manjaro (4.4 kernel patch)
# Contributor: sling00 (4.10 kernel patch)


pkgname=catalyst-generator
pkgver=15.9
pkgrel=15
_amdver=15.201.1151
pkgdesc="AMD/ATI drivers. Generator of catalyst-{kernver} packages with fglrx module inside."
arch=('i686' 'x86_64')
url="http://www.amd.com"
license=('custom')
options=('staticlibs' 'libtool' '!strip' '!upx')
depends=('catalyst-utils' 'gcc-libs' 'gcc>4.0.0' 'make' 'patch' 'linux>=3.0' 'linux<4.11' 'linux-headers')
optdepends=('linux-headers: to build the fglrx module for the linux kernel'
	  'linux-lts-headers: to build the fglrx module for the linux-lts kernel')
conflicts=('catalyst-test' 'catalyst-hook' 'catalyst' 'catalyst-daemon' 'catalyst-dkms')
provides=("catalyst=${pkgver}")
install=${pkgname}.install

url_ref="http://support.amd.com/en-us/download/desktop?os=Linux+x86"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

source=(
    http://www2.ati.com/drivers/linux/amd-catalyst-${pkgver}-linux-installer-${_amdver}-x86.x86_64.zip
    catalyst_build_module
    catalyst-PKGBUILD
    catalyst.install
    ati_make.sh
    makefile_compat.patch
    completion-bash
    completion-zsh
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
    4.10-arch-sling00-virtual_address-acpi_get_table_with_size.patch)

md5sums=('d2de2df6946b452c266a3c892e6e46ff'
         '543e818f543f2897beca49101226e460'
	 'a555dc9a3eb062d7ca4efbf7e0713a3a'
	 'd16871c840b749dcf6d6f5ab85940f6a'
	 'fd98b7e486d7fd4cad8de7b95b5b031e'
	 '3e1b82bd69774ea808da69c983d6a43b'
	 '314fd4092e7718b7e3a99d1a98a0c5cb'
	 '12a8452f4de07a96115a398b6931743d'
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
	 '05f6364db877d9c4bdf1592deda905b7')


build() {
     /bin/sh ./AMD-Catalyst-${pkgver}-Linux-installer-${_amdver}-x86.x86_64.run --extract archive_files
}

package() {
    # License
      install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
      install -m644 ${srcdir}/archive_files/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}

      cd ${srcdir}/archive_files
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

    # Prepare modules source files
      _archdir=x86_64
      test "${CARCH}" = "i686" && _archdir=x86
      cd ${srcdir}/archive_files
      install -m755 -d ${pkgdir}/usr/share/ati/build_mod
      install -m644 common/lib/modules/fglrx/build_mod/*.c \
                ${pkgdir}/usr/share/ati/build_mod
      install -m644 common/lib/modules/fglrx/build_mod/*.h \
                ${pkgdir}/usr/share/ati/build_mod
      install -m644 common/lib/modules/fglrx/build_mod/2.6.x/Makefile \
                ${pkgdir}/usr/share/ati/build_mod
      install -m644 arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a \
                ${pkgdir}/usr/share/ati/build_mod

      install -m755 -d ${pkgdir}/usr/bin
      install -m755 ${srcdir}/catalyst_build_module ${pkgdir}/usr/bin
      sed -i -e "s/catver=.*/catver=${pkgver}-${pkgrel}/" ${pkgdir}/usr/bin/catalyst_build_module

      install -m644 ${srcdir}/catalyst-PKGBUILD ${pkgdir}/usr/share/ati/build_mod/PKGBUILD
      sed -i -e "s/pkgver=.*/pkgver=${pkgver}/" ${pkgdir}/usr/share/ati/build_mod/PKGBUILD
      sed -i -e "s/pkgrel=.*/pkgrel=${pkgrel}/" ${pkgdir}/usr/share/ati/build_mod/PKGBUILD
      install -m644 ${srcdir}/catalyst.install ${pkgdir}/usr/share/ati/build_mod

    # modified ati's make.sh script
      install -m755 ${srcdir}/ati_make.sh ${pkgdir}/usr/share/ati/build_mod

    # autocompletion for bash and zsh
      install -m755 -d ${pkgdir}/usr/share/bash-completion/completions
      install -m644 ${srcdir}/completion-bash ${pkgdir}/usr/share/bash-completion/completions/catalyst_build_module
      install -m755 -d ${pkgdir}/usr/share/zsh/site-functions
      install -m644 ${srcdir}/completion-zsh ${pkgdir}//usr/share/zsh/site-functions/_catalyst_build_module
}
