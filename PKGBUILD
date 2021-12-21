# Maintainer: chrism <christoph.mertz at googlemail dot com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

# Name collision with https://aur.archlinux.org/packages.php?ID=7159
pkgname=gatling-stress-tool
_pkgname=gatling
pkgver=3.7.3
pkgrel=1
pkgdesc="Open-source load testing framework based on Scala, Akka and Netty"
arch=(any)
url="http://gatling.io"
license=('apache')
depends=('java-environment-common')
backup=(usr/share/java/${pkgname}/conf/{gatling,recorder}.conf
        usr/share/java/${pkgname}/conf/logback.xml)
source=("https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/${pkgver}/gatling-charts-highcharts-bundle-${pkgver}-bundle.zip"
        "https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/${pkgver}/gatling-charts-highcharts-bundle-${pkgver}-bundle.zip.sha1"
        "gatling"
        "gatling-recorder")

sha256sums=('2d6c8f00ad9c4c190e16447361b5aebde103454ca8efceccbda32f6574775643'
            '2fe0f518eaccdc398dd2fd5b8342787901e97ee39bf8affe2d6bd6c388764f06'
            'b537f7c31f0fe66b291f30e05498c7412e01bf4572abaea0a07823b2cf4f07d9'
            '6124d91ec20c2d495cf9b2867027251c12db478da4429982d7794a356d56aebf')

prepare() {
  local ar="${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}-bundle.zip"
  echo -n "$(cat $ar.sha1) ${ar}" | sha1sum --quiet -c -
}

package() {
  srcbase="${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}"

  install -Dm 755 "${srcbase}/bin/${_pkgname}.sh" "${pkgdir}/usr/share/java/${pkgname}/bin/${_pkgname}.sh"
  install -Dm 755 "${srcbase}/bin/recorder.sh" "${pkgdir}/usr/share/java/${pkgname}/bin/recorder.sh"

  confs=$(ls "${srcbase}/conf/")
  for conf in $confs; do
    install -Dm 644 "${srcbase}/conf/${conf}" "${pkgdir}/usr/share/java/${pkgname}/conf/${conf}"
  done

  jars=$(find "${srcbase}/lib/" -maxdepth 1 -type f -printf '%f\n')
  for jar in $jars; do
    install -Dm 644 "${srcbase}/lib/${jar}" "${pkgdir}/usr/share/java/${pkgname}/lib/${jar}"
  done

  install -dm 644 "${pkgdir}/usr/share/java/${pkgname}/results"

  install -Dm 644 "${srcbase}/user-files/resources/search.csv" "${pkgdir}/usr/share/java/${pkgname}/user-files/resources/search.csv"
  install -Dm 644 "${srcbase}/user-files/simulations/computerdatabase/BasicSimulation.java" "${pkgdir}/usr/share/java/${pkgname}/user-files/simulations/computerdatabase/BasicSimulation.java"
  scala_files=$(ls "${srcbase}/user-files/simulations/computerdatabase/advanced/")
  for scala_file in $scala_files; do
    install -Dm 644 "${srcbase}/user-files/simulations/computerdatabase/advanced/${scala_file}" "${pkgdir}/usr/share/java/${pkgname}/user-files/simulations/computerdatabase/advanced/${scala_file}"
  done

  install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 755 "${_pkgname}-recorder" "${pkgdir}/usr/bin/${_pkgname}-recorder"
}
