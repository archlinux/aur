# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgbase=commafeed
pkgver=5.11.1
pkgrel=2
pkgdesc="Google Reader inspired self-hosted personal RSS reader (native standalone version)"
url="https://github.com/Athou/commafeed"
arch=('x86_64')
license=('APACHE-2.0')
makedepends=('jdk25-graalvm-bin')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Athou/${pkgbase}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgbase}.service"
        "sysusers.conf"
        "tmpfiles.conf")
sha256sums=('726a5f42c86d22f8f44f38e891871137eccc8cf68c557c2db47ff0aa0655be7c'
            'c529ea4c76383e10f8e6609af3e9765f42d4ba5fce761fc045cdbcfb5e5ce9e8'
            'eaa6119233a119392d492d5a3fa279ac713cf6e05d77ac05642443cdfa9d9eba'
            'c670c7e524e6b4fa7c9ffd2f5b3b4f8ae370188522b94ab4d0fa3a5d6f58642f')

build() {
  cd "${srcdir}"/${pkgbase}-${pkgver}
  export JAVA_HOME=/usr/lib/jvm/java-25-graalvm/
  export GRAALVM_HOME=/usr/lib/jvm/java-25-graalvm/
  for db in h2 postgresql mysql mariadb; do
     ./mvnw package -P${db} -Pnative -DskipTests
  done
}

_package() {
  db=$1
  _db=${db,,}

  pkgdesc="Google Reader inspired self-hosted personal RSS reader (${db} database)"
  backup=("var/lib/commafeed-${_db}/config/application.properties")

  install -Dm644 "${srcdir}"/${pkgbase}-${pkgver}/commafeed-server/target/quarkus-generated-doc/application.properties \
    "${pkgdir}"/var/lib/${pkgname}/config/application.properties
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
