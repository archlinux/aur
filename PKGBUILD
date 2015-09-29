# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Great Contributor: Shen Miren <dickeny@gmail.com> (build_module/hook idea and code)
# Contributor: aidanlinz
# Contributor: cyberpatrol
# Contributor: Rip-Rip
# Contributor: nob
# Contributor: lano1106 (patch to fix support of intel's iommu and to remove dependency of kernel's CONFIG_AGP option)
# Contributor: lano1106 (patch to remove dependency of kernel's CONFIG_AGP option)
# Contributor: lano1106 (patch to improve jacob's patch)
# Contributor: zoopp
# Contributor: Cold (current_euid patch)
# Contributor: ubuntu (parts of 4.0, 4.1 and 4.2 kernel patches)
# Contributor: kolasa (part of 4.2 kernel patches)


pkgname=catalyst-hook
pkgver=15.9
pkgrel=2
_amdver=15.201.1151
pkgdesc="AMD/ATI drivers. Auto re-compile fglrx module while shutdown/reboot."
arch=('i686' 'x86_64')
url="http://www.amd.com"
license=('custom')
options=('staticlibs' 'libtool' '!strip' '!upx')
depends=('catalyst-utils' 'gcc-libs' 'gcc>4.0.0' 'make' 'patch' 'linux-lts>=3.0' 'linux-lts<4.2' 'linux-lts-headers')
# optdepends=('linux-lts-headers: to build the fglrx module for the linux-lts kernel')
conflicts=('catalyst-test' 'catalyst-daemon' 'catalyst' 'catalyst-generator' 'catalyst-dkms')
provides=("catalyst=${pkgver}")
replaces=('catalyst')
install=${pkgname}.install

url_ref="http://support.amd.com/en-us/download/desktop?os=Linux+x86"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

source=(
    http://www2.ati.com/drivers/linux/amd-catalyst-${pkgver}-linux-installer-${_amdver}-x86.x86_64.zip
    hook-fglrx
    catalyst_build_module
    ati_make.sh
    makefile_compat.patch
    catalyst-hook.service
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
         '9126e1ef0c724f8b57d3ac0fe77efe2f'
         '601d9c756571dd79d26944e54827631e'
	 '62239156a9656c6f41e89a879578925c'
	 '3e1b82bd69774ea808da69c983d6a43b'
	 'a64e2eae5addc6d670911ccf94b8cda4'
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
     /bin/sh ./AMD-Catalyst-${pkgver}-Linux-installer-${_amdver}-x86.x86_64.run --extract archive_files
}

package() {
    # License
      install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
      install -m644 ${srcdir}/archive_files/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}

      cd ${srcdir}/archive_files

    # Patching
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

    # Prepare modules source files
      _archdir=x86_64
      test "${CARCH}" = "i686" && _archdir=x86
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

    # modified ati's make.sh script
      install -m755 ${srcdir}/ati_make.sh ${pkgdir}/usr/share/ati/build_mod

    # hook fglrx
      install -m755 -d ${pkgdir}/usr/lib/initcpio/install
      install -m644 ${srcdir}/hook-fglrx ${pkgdir}/usr/lib/initcpio/install/fglrx

    # systemd service to perform fglrx module build at shutdown
      install -m755 -d ${pkgdir}/usr/lib/systemd/system
      install -m644 ${srcdir}/catalyst-hook.service ${pkgdir}/usr/lib/systemd/system
}