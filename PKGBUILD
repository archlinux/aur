# Maintainer: Maxqia <contrib@maxqia.com>
# Great contributor: Vi0L0 <vi0l093@gmail.com>
#                    (maintainer of main "catalyst" package(s), which this is
#                     largely based upon)
# Old maintainer: Gerad Munsch <gmunsch@unforgivendevelopment.com>
# Old maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: wonder, Eduardo "kensai" Romero
# Contributor: aidanlinz, Rip-Rip, OvsInc, Sebastian Siebert
# Other contributors: Any contributors mentioned in the main "catalyst" package
#                     as provided by Vi0L0 at http://goo.gl/fAKzx)

# grab kernel version
_kernver=`uname -r`

pkgname=catalyst-dkms
pkgver=15.9
pkgrel=2
_amdver=15.201.1151
pkgdesc="AMD Catalyst (proprietary GPU driver) kernel driver (DKMS version) [NOTE: Radeon HD 5xxx+ ONLY]"
arch=('i686' 'x86_64')
url="http://support.amd.com/en-us/download/desktop?os=Linux+x86"
license=('custom')
options=('staticlibs' 'libtool' '!upx' '!strip')
depends=('dkms')
makedepends=('gcc-libs' 'gcc>4.0.0')
optdepends=('linux-headers<4.7: build the module against Arch kernel (requires at least one set of kernel headers)'
            'linux-lts-headers<4.7: build the module against LTS Arch kernel (requires at least one set of kernel headers)')

# try to ensure that this package cannot be installed concurrently with any of
# the other 'catalyst'-series packages
conflicts=('catalyst'
           'catalyst-daemon'
           'catalyst-hook'
           'catalyst-test'
           'catalyst-total'
           'catalyst-total-pxp')
provides=('catalyst')

source=(
    http://www2.ati.com/drivers/linux/amd-catalyst-${pkgver}-linux-installer-${_amdver}-x86.x86_64.zip
    dkms.conf
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
    4.6-arch-get_user_pages-page_cache_release.patch)

sha384sums=('a5de57abfe23dd4210e220ee1f7b2b5dc2862272632b8fccfbcbf1f30285de580546910015a4918e8d80866ad8757bd4'
            'f1ff04347eb04b56a4e0bd6a33200c5d4d72135557867634c20447d07a8aeb1da417340e7d086809fdda644ae7cd4da7'
            'b131483a05e5d610f8cf4a1c769f9afc73e38e21388f7d3bb26b4b2b78796c6f2b62419e2e7c8878534fd5ebf4c53f3f'
            'f3b754f5d2edb5f0950ce49dcdcf19b1d7db6618c267623d7c4b7c365f14de8726dbd780e00599cd656d431af4f7fc78'
            '0dbd2f121237e4246434770e5f53a249a2e1a05ee5dd43e3757e0d3192eb0f89a9c3ed097f67962f5e0a6bb96554710c'
            '8d9406874bc67dc282d0e4e61f3bcdc9c43623940f4955a62e8f82917fc50277e776d2eaa4af9bebe1666b071989e7d9'
            '5dd9b4ee33f1a4aa1cc9bb04a9d8c27f0d61dd2c50040d68a161605a3fd7d31348910917e3dc67509b4bd1873ed3e309'
            '462dd1a6acde15f2f0ab4b04de793efaabc6741eedee31372c12e7511cac142353336eeec27697f8a648b474f57c86bd'
            'f8b6c8fb36611755dcbe8cd8aa5b628eb536bc6900a34f88d06fbb988370a1bec48e63e95f94a7c7ed9fdd54fcd7c711'
            '6d344cf6aefacb5737376f50dbdfc438a299089532052f8acee6878282261f329ffab72d897d11e9e6eefc5d3fd03067'
            'f33b4c27a45de8e5bf3c0c6cd88b8a1daafe75639e969c0137039bf4a017104b9259692e1436374ddf3524a344c228b8'
            '7f747586a8a87388f6a969846363956c159eaa583a054b59cfa55b8ff73c33c7751c1b6e30aeff3a056ce150d0593ea2'
            'b78d8192012778fe8afe6af65c19c1cf8ee2eae161bd4302b04589fb2c532edf151461eff228abea99d6ff59676509ed')

install=catalyst.install

# AMD changed the way we need to download our package, we now have to pass a referer.
url_ref="http://support.amd.com/en-us/download/desktop?os=Linux+x86"
DLAGENTS="http::/usr/bin/curl --referer ${url_ref} -o %o %u"

package() {
  depends=(${depends[@]} "catalyst-utils=${pkgver}")

  cd ${srcdir}

  # determine architecture
  if [ "${CARCH}" = "x86_64" ]; then
    _archdir=x86_64
  else
    _archdir=x86
  fi

  # extract files from installer
  /bin/sh ./AMD-Catalyst-${pkgver}-Linux-installer-${_amdver}-x86.x86_64.run --extract archive_files
  cd archive_files

  # patch sources
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

  cd ${srcdir}/archive_files/common/lib/modules/fglrx/build_mod
  cp ${srcdir}/archive_files/arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a .
  cp 2.6.x/Makefile .
  cd ${srcdir}/archive_files

  # install some directories
  install -dm755 "${pkgdir}/usr/lib/modprobe.d"
  install -dm755 "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}"

  # copy sources
  cp -r common/lib/modules/fglrx/build_mod/* "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"
  cp "arch/${_archdir}/lib/modules/fglrx/build_mod/libfglrx_ip.a" "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"

  # copy dkms.conf and set version
  cp ${srcdir}/dkms.conf "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"
  sed -i -e "s/@VERSION@/${pkgver}-${pkgrel}/" "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/dkms.conf"

  # blacklist open-source radeon module from loading
  echo "blacklist radeon" >> "${pkgdir}/usr/lib/modprobe.d/catalyst.conf"

  # install license
  install -Dm644 "common/usr/share/doc/fglrx/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"
}
