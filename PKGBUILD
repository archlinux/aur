pkgname=lm_sensors-git
pkgdesc="Collection of user space tools for general SMBus access and hardware monitoring"
pkgver=r5216.84f773b3
pkgrel=1
arch=('x86_64')
url="https://github.com/lm-sensors/lm-sensors"
license=('GPL' 'LGPL')
conflicts=('lm_sensors')
provides=('lm_sensors')
depends=('perl' 'sysfsutils')
makedepends=('git' 'rrdtool')
optdepends=('rrdtool: for logging with sensord')
backup=('etc/sensors3.conf' 'etc/conf.d/sensord')
source=(git+https://github.com/lm-sensors/lm-sensors.git
    sensord.conf)
sha1sums=('SKIP'
          'f4b5f21fdb3b2a55aa353afa1603f953b207b73b')
_pkgname1=${pkgname%-git}

pkgver() {
  cd "${_pkgname1/_/-}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/${_pkgname1/_/-}"
  sed -i 's|/etc/sysconfig|/etc/conf.d|' prog/{detect/sensors-detect,init/{sensord,lm_sensors}.service}
  sed -i 's/EnvironmentFile=/EnvironmentFile=-/' prog/init/lm_sensors.service
}

build() {
  cd "$srcdir/${_pkgname1/_/-}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${_pkgname1/_/-}"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/" # TODO: find out why install doesn't do that...
  
  make PROG_EXTRA=sensord BUILD_STATIC_LIB=0 \
    PREFIX=/usr SBINDIR=/usr/bin MANDIR=/usr/share/man DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/sensord.conf" "${pkgdir}/etc/conf.d/sensord"
  install -D -m644 prog/init/*.service "${pkgdir}/usr/lib/systemd/system/"
}
