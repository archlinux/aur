# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Shengyu Zhang <la@archlinuxcn.org>
# Contributor: Tao Meng ("mtunique") <oatgnem [at] gmail.com>

pkgname=apache-flink
_appver=1.13.1
_scalaver=2.12
pkgver=${_appver}_${_scalaver}
pkgrel=1
pkgdesc="A framework and distributed processing engine for stateful computations over unbounded and bounded data streams (with Scala)"
arch=('any')
url='http://flink.apache.org'
license=('Apache')
depends=('java-environment>=7' 'bash')
optdepends=('python2: Python2 support for python API'
            'python: Python3 support for python API'
            'hadoop: Support for running on YARN')
install=apache-flink.install
source=("${pkgname}-${pkgver}.tgz::https://archive.apache.org/dist/flink/flink-${_appver}/flink-${_appver}-bin-scala_${_scalaver}.tgz"
        'apache-flink-jobmanager.service'
        'apache-flink-taskmanager@.service')
sha256sums=('e644c2479afd94a7460d541f727849a2bef844e97a6133c614c3cb9a68a29438'
            '59fe1cfe8f2de6437e20a98af68125f1bdab9d04c81a583d359c56b7ca3a2c5e'
            '11eba4a7203805d758779a8e6d18c0e6b1de0bf3e9a6ecf509fe093a4e8f975b')
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
  install -d "${pkgdir}/usr/bin" \
             "${pkgdir}/opt" \
             "${pkgdir}/var/log/apache-flink" \
             "${pkgdir}/run/apache-flink"
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
