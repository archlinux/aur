# Maintainer: Laurent Carlier <amfernusus@gmail.com>

pkgname=lm_sensors-it87-git
pkgver=3.6.0.r41.g31d1f125
_commit=31d1f125d8076f1c8c8f3224b31d240e6e6a1763
#_pkgver=${pkgver//./-}
pkgrel=4
epoch=1
pkgdesc="Expands list of supported devices not yet mainlined"
arch=('x86_64')
url="https://hwmon.wiki.kernel.org/lm_sensors"
license=('GPL' 'LGPL')
depends=('bash' 'glibc' 'it87-dkms-git')
makedepends=('rrdtool' 'perl' 'git')
optdepends=('rrdtool: for logging with sensord'
            'perl: for sensor detection and configuration convert')
provides=('libsensors.so' 'lm_sensors')
backup=('etc/sensors3.conf' 'etc/healthd.conf' 'etc/conf.d/sensord')
conflicts=('lm_sensors')
#source=(lm_sensors-${pkgver}.tar.gz::https://github.com/lm-sensors/lm-sensors/archive/V${_pkgver}.tar.gz
source=(
  "git+https://github.com/groeck/lm-sensors.git#commit=${_commit}"
  healthd
  healthd.conf
  healthd.service
  sensord.conf
  0001-Add-support-for-ITE-IT8625E-Super-IO-Sensors.patch
  0001-fix-incompatible-pointer-warnings.patch
)
sha256sums=('SKIP'
            '0ac9afb2a9155dd74ab393756ed552cd542dde1081149beb2ab4ec7ff55b8f4a'
            '5d17a366b175cf9cb4bb0115c030d4b8d91231546f713784a74935b6e533da9f'
            '2638cd363e60f8d36bcac468f414a6ba29a1b5599f40fc651ca953858c8429d7'
            '23bebef4c250f8c0aaba2c75fd3d2c8ee9473cc91a342161a9f5b3a34ddfa9e5'
            'c9c0b5739789d258b8f7244ea44fbe466661ef2e46dccad5f4b7fff7075c2a43'
            '17989802fdd0347dc50c7224fd4f59f058f4651f5ad1cb320dc72e6ceafa5673')
validpgpkeys=('7CA69F4460F1BDC41FD2C858A5526B9BB3CD4E6A')

pkgver() {
  cd "${srcdir}"/lm-sensors*

  git describe --long --tags | sed 's/V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"/lm-sensors*
  sed -i 's|/etc/sysconfig|/etc/conf.d|' prog/{detect/sensors-detect,init/{sensord,lm_sensors}.service}
  sed -i 's/EnvironmentFile=/EnvironmentFile=-/' prog/init/lm_sensors.service
  patch -Np1 -i ../0001-Add-support-for-ITE-IT8625E-Super-IO-Sensors.patch
  patch -Np1 -i ../0001-fix-incompatible-pointer-warnings.patch
}

build() {
  cd "${srcdir}"/lm-sensors*
  make PROG_EXTRA=sensord BUILD_STATIC_LIB=0 PREFIX=/usr
}

package() {
  cd "${srcdir}"/lm-sensors*
  make PROG_EXTRA=sensord BUILD_STATIC_LIB=0 \
    PREFIX=/usr SBINDIR=/usr/bin MANDIR=/usr/share/man DESTDIR="${pkgdir}" install

  install -D -m755 "${srcdir}/healthd" "${pkgdir}/usr/bin/healthd"

  install -D -m644 "${srcdir}/healthd.conf" "${pkgdir}/etc/healthd.conf"
  install -D -m644 "${srcdir}/sensord.conf" "${pkgdir}/etc/conf.d/sensord"
 
  install -D -m644 "${srcdir}/healthd.service" "${pkgdir}/usr/lib/systemd/system/healthd.service"
  install -D -m644 prog/init/*.service "${pkgdir}/usr/lib/systemd/system/"
}
