# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgbase=commafeed
pkgver=7.3.2
pkgrel=2
pkgdesc="Google Reader inspired self-hosted personal RSS reader (native standalone version)"
url="https://github.com/Athou/commafeed"
arch=('x86_64')
license=('APACHE-2.0')
makedepends=('mandrel-bin')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Athou/${pkgbase}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgbase}.service"
        "sysusers.conf"
        "tmpfiles.conf")
sha256sums=('41845cf1dbc99c929edf1363df346003bcf39f6ce47daa9407800a520ad6b9dd'
            '641bab749ec500066cb4a5ba6166d7c54f7b8ced3793642ab9def9fb0761e4ea'
            'eaa6119233a119392d492d5a3fa279ac713cf6e05d77ac05642443cdfa9d9eba'
            'dd193164f0b50f9f83f39b8644a62d56bff3aecf45f74d927b2034a49c2dbcf2')

build() {
  cd "${srcdir}"/${pkgbase}-${pkgver}
  export JAVA_HOME=/usr/lib/jvm/java-25-mandrel/
  export GRAALVM_HOME=/usr/lib/jvm/java-25-mandrel/
  for db in h2 postgresql mysql mariadb; do
     ./mvnw package -P${db} -Pnative -DskipTests
  done
}

_package() {
  db=$1
  _db=${db,,}

  pkgdesc="Google Reader inspired self-hosted personal RSS reader (${db} database)"
  backup=("etc/${pkgname}/application.properties")
  install="${pkgbase}.install"

  # The config lives in /etc so that etckeeper and friends can track it, and is
  # pulled in via QUARKUS_CONFIG_LOCATIONS in the service unit. Sources loaded
  # that way inherit the ordinal of whatever set the property (300, for an
  # environment variable), so pin it to 270 instead: above the built-in defaults
  # (250) and $PWD/config (260), below environment variables and -D properties.
  install -dm755 "${pkgdir}"/etc/${pkgname}
  {
    printf '# Do not remove, this keeps the settings below at a higher priority\n'
    printf '# than the built-in defaults, but below environment variables.\n'
    printf 'config_ordinal=270\n\n'
    cat "${srcdir}"/${pkgbase}-${pkgver}/commafeed-server/target/quarkus-generated-doc/application.properties
  } > "${pkgdir}"/etc/${pkgname}/application.properties
  # tmpfiles.d hands this to the commafeed-${_db} group; never world-readable
  chmod 640 "${pkgdir}"/etc/${pkgname}/application.properties

  install -Dm755 "${srcdir}"/${pkgbase}-${pkgver}/commafeed-server/target/${pkgbase}-${pkgver}-${_db}-linux-x86_64-runner \
    "${pkgdir}"/usr/bin/${pkgname}

  install -dm755 "${pkgdir}"/usr/lib/sysusers.d
  install -dm755 "${pkgdir}"/usr/lib/tmpfiles.d
  install -dm755 "${pkgdir}"/usr/lib/systemd/system
  cat "${srcdir}"/sysusers.conf \
    | sed -e "s|@DB|${_db}|g" \
    > "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  cat "${srcdir}"/tmpfiles.conf \
    | sed -e "s|@DB|${_db}|g" \
    > "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
  cat "${srcdir}"/${pkgbase}.service \
    | sed -e "s|@DB|${_db}|g" \
    > "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
}

for _db in H2 postgresql mysql mariadb; do
    _pkgname=commafeed-${_db,,}
    pkgname+=(${_pkgname})
    
    eval "package_${_pkgname}() {
      _package ${_db}
    }"
done
