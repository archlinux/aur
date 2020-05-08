# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Shengyu Zhang <la@archlinuxcn.org>
# Contributor: Tao Meng ("mtunique") <oatgnem [at] gmail.com>

pkgname=apache-flink
_appver=1.10.0
_scalaver=2.11
pkgver=${_appver}_${_scalaver}
pkgrel=1
pkgdesc="A framework and distributed processing engine for stateful computations over unbounded and bounded data streams (with Scala)"
arch=('i686' 'x86_64')
url='http://flink.apache.org'
license=('Apache')
depends=('java-environment>=7' 'bash')
optdepends=('python2: Python2 support for python API'
            'python: Python3 support for python API'
            'hadoop: Support for running on YARN')
install=apache-flink.install
_download_portal="https://www.apache.org/dyn/closer.lua/flink/flink-1.10.0/flink-${_appver}-bin-scala_${_scalaver}.tgz"
_closest_mirror=$(curl "${_download_portal}?asjson=1" | jq '(.preferred + .path_info)' | tr -d '"",' )
source=("${pkgname}-${pkgver}.tgz::$_closest_mirror"
        'apache-flink-jobmanager.service'
        'apache-flink-taskmanager@.service')
sha256sums=('4d9e8e1a2de3cd7f221b73a9d266f0d260550272afd82041134b9032c84cceb3'
            'SKIP'
            'SKIP')
backup=("etc/${pkgname}/flink-conf.yaml"
        "etc/${pkgname}/log4j-cli.properties"
        "etc/${pkgname}/log4j-yarn-session.properties"
        "etc/${pkgname}/log4j.properties"
        "etc/${pkgname}/logback-yarn.xml"
        "etc/${pkgname}/logback.xml"
        "etc/${pkgname}/masters"
        "etc/${pkgname}/slaves"
        "etc/${pkgname}/zoo.cfg")
PKGEXT=${PKGEXT:-".pkg.tar.xz"}

package() {
  cd "${srcdir}/flink-${_appver}"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/opt" "${pkgdir}/var/log/apache-flink" "${pkgdir}/run/apache-flink"
  cp -r "${srcdir}/flink-${_appver}" "${pkgdir}/opt/apache-flink/"
  cd "${pkgdir}/usr/bin"
  binpath='/opt/apache-flink/bin/flink'
  ln -s "${binpath}" $binary
  install -Dm644 "${srcdir}/apache-flink-jobmanager.service" "${pkgdir}/usr/lib/systemd/system/apache-flink-jobmanager.service"
  install -Dm644 "${srcdir}/apache-flink-taskmanager@.service" "${pkgdir}/usr/lib/systemd/system/apache-flink-taskmanager@.service"
  mkdir -p "${pkgdir}/etc/apache-flink"
  install -Dm644 "${srcdir}/flink-${_appver}/conf"/* "${pkgdir}/etc/apache-flink"
  cd "${pkgdir}/opt/apache-flink"
  mv conf conf-templates
  ln -sf '/etc/apache-flink' conf
}