# Maintainer: Mylux <luxpirocaboa@gmail.com>
pkgname=debezium-server
pkgver=3.6.0
pkgrel=1

_pkgver="${pkgver}.Final"

pkgdesc="Standalone change data capture server based on Debezium"
arch=('any')
url="https://debezium.io/"
license=('Apache-2.0')

depends=(
  'bash'
  'java-runtime>=21'
)

source=(
  "debezium-server-dist-${_pkgver}.tar.gz::https://repo1.maven.org/maven2/io/debezium/debezium-server-dist/${_pkgver}/debezium-server-dist-${_pkgver}.tar.gz"
  'debezium-server.sh'
  'debezium-server.service'
  'debezium-server.sysusers'
)

sha256sums=('901ce7b0b75b4dafaac4aa57dac6dfcad5937f96fb7159e25d22759bbf5192e4'
            '73bf36565ac31c7a0a455560342a4e13c6d5bab3aac117ed7365ee62410fef8c'
            '1dd9a8da7d41f9fb01f3b1bd5e9e26c2ee61f6c0d266925b548d77117170e2d1'
            '0101d349fbb466e5556f8afab9aa703ec13124f23759c97a7b783a282cd5db84')

backup=(
  'etc/debezium-server/debezium-jmx-config-legacy.yaml'
  'etc/debezium-server/debezium-jmx-config.yaml'
  'etc/debezium-server/metrics.yml'
  'etc/debezium-server/lib/cassandra/driver.conf'
)

package() {
  local _appdir="${pkgdir}/usr/lib/debezium-server"
  local _confdir="${pkgdir}/etc/debezium-server"

  # Runtime directory
  install -d "${_appdir}"

  # System configuration directory
  install -d "${_confdir}"

  # Preserve the upstream runtime layout.
  cp -a \
    "${srcdir}/debezium-server/connectors" \
    "${srcdir}/debezium-server/jmx" \
    "${srcdir}/debezium-server/lib" \
    "${srcdir}/debezium-server/lib_metrics" \
    "${srcdir}/debezium-server/lib_opt" \
    "${_appdir}/"

  # Upstream launcher
  install -m755 \
    "${srcdir}/debezium-server/run.sh" \
    "${_appdir}/run.sh"

  # Quarkus runner
  install -m644 \
    "${srcdir}/debezium-server/debezium-server-dist-${_pkgver}-runner.jar" \
    "${_appdir}/debezium-server-dist-${_pkgver}-runner.jar"

  # Move the upstream config tree to /etc.
  cp -a \
    "${srcdir}/debezium-server/config/." \
    "${_confdir}/"

  # run.sh expects ./config relative to its working directory.
  # Keep that upstream layout while storing configuration under /etc.
  ln -s /etc/debezium-server \
    "${_appdir}/config"

  # User-facing wrapper
  install -Dm755 \
    "${srcdir}/debezium-server.sh" \
    "${pkgdir}/usr/bin/debezium-server"

  # systemd service
  install -Dm644 \
    "${srcdir}/debezium-server.service" \
    "${pkgdir}/usr/lib/systemd/system/debezium-server.service"

  install -Dm644 \
    "${srcdir}/debezium-server.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/debezium-server.conf"
}
