# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>

pkgname=wrs-vxworks-headers
pkgver=6.3
pkgrel=11
pkgdesc="The VxWorks 6.3 Headers"
arch=(any)
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('GPL' 'custom=Wind River')
makedepends=('unzip' 'dos2unix')
options=('!strip' 'libtool' '!zipman')
source=(ftp://ftp.ni.com/pub/devzone/tut/updated_vxworks63gccdist.zip
        LICENSE)
noextract=("updated_vxworks63gccdist.zip")
sha512sums=('91e7d1705a5adc1d2b49802af3bd71535572b712e6b31fc1438fbdf6ad0553b1d8deadd93580b59e6e82d229fb3f337f1e48304a3ea126e884947bbf9cae9ff9'
            '02a0d5b7ac7c812977138d29da5db95aa6bce72d2a87fbc6ea0a01f839b764b94127091f46d89069b981c5e86caa3e0a0a4813455ee7928d17e7fbcc66a7c9f2')
install='wrs-vxworks-headers.install'

package() {
  cd "${srcdir}"

  mkdir -p ${pkgdir}/usr/powerpc-wrs-vxworks/include

  # Unpack headers
  unzip updated_vxworks63gccdist.zip
  mkdir -p ${pkgdir}/usr/powerpc-wrs-vxworks/{wind_base/target,share/ldscripts}
  cp -dpr --no-preserve=ownership gccdist/WindRiver/vxworks-6.3/host ${pkgdir}/usr/powerpc-wrs-vxworks/wind_base
  cp -dpr --no-preserve=ownership gccdist/WindRiver/vxworks-6.3/target/h/. ${pkgdir}/usr/powerpc-wrs-vxworks/sys-include
  cp -dpr --no-preserve=ownership gccdist/WindRiver/vxworks-6.3/target/h/wrn/coreip/. ${pkgdir}/usr/powerpc-wrs-vxworks/include
  cp -dpr --no-preserve=ownership gccdist/WindRiver/vxworks-6.3/target/h/wrn/coreip/. ${pkgdir}/usr/powerpc-wrs-vxworks/wind_base/target/h

  mkdir -p ${pkgdir}/usr/powerpc-wrs-vxworks/usr
  ln -s ${pkgdir}/usr/powerpc-wrs-vxworks/sys-include ${pkgdir}/usr/powerpc-wrs-vxworks/usr/include

  # Clean up headers
  sed '/ENTRY(_start)/d' < gccdist/WindRiver/vxworks-6.3/target/h/tool/gnu/ldscripts/link.OUT > ${pkgdir}/usr/powerpc-wrs-vxworks/share/ldscripts/dkm.ld
  find . -type f -exec chmod 644 {} \;
  find ${pkgdir} -type f -exec dos2unix {} +

  # Install license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install script for WIND_BASE environment variable
  mkdir -p ${pkgdir}/etc/profile.d
  touch ${pkgdir}/etc/profile.d/wind_base.sh
  echo 'export WIND_BASE=/usr/powerpc-wrs-vxworks/wind_base' >> ${pkgdir}/etc/profile.d/wind_base.sh
  chmod 755 ${pkgdir}/etc/profile.d/wind_base.sh
}
