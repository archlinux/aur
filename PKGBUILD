# Maintainer: Dan Fuhry <dan@fuhry.com>

pkgname='mosquitto-auth-plug'
pkgver=0.1.4
_fork='fuhry'
pkgrel=1
pkgdesc="Mosquitto plugin for custom authentication methods"
arch=('x86_64')
url="https://github.com/${_fork}/mosquitto-auth-plug"
license=('MIT')
depends=('mosquitto' 'postgresql-libs' 'hiredis' 'mariadb-libs' 'sqlite' 'libmemcached-awesome')
source=("git+https://github.com/${_fork}/mosquitto-auth-plug.git#tag=v${pkgver}")
sha256sums=('SKIP')
validpgpkeys=(0x2DE80047268BFA285D3108676E715AF940FD6D2E)

prepare() {
  cd ${pkgname}
  for f in "${source[@]}"; do
    if [[ "$f" =~ \.patch$ ]]; then
      msg "Applying patch: $f"
      patch -Np1 -i "${srcdir}/$f"
    fi
  done
}

build() {
  cd ${pkgname}
  cp config.mk.in config.mk
  export MAKEFLAGS=-j1
  make \
    BACKEND_MYSQL=yes \
    BACKEND_SQLITE=yes \
    BACKEND_REDIS=yes \
    BACKEND_POSTGRES=yes \
    BACKEND_LDAP=yes \
    BACKEND_HTTP=yes \
    BACKEND_JWT=yes \
    BACKEND_FILES=yes \
    BACKEND_MEMCACHED=yes \
    CFG_CFLAGS=-fPIC \
    clean all
}

package_mosquitto-auth-plug() {
  cd ${pkgname}

  install -d -oroot -groot -m0755 ${pkgdir}/usr/lib/mosquitto
  install -oroot -groot ./auth-plug.so ${pkgdir}/usr/lib/mosquitto/auth-plug.so

  install -d -oroot -groot -m0755 ${pkgdir}/usr/bin
  install -oroot -groot ./np ${pkgdir}/usr/bin/mosquitto-authplug-passwd
}

# vim:set ts=2 sw=2 et:
