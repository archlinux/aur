# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Bram Vereertbrugghen <bramvereertbrugghen at live dot be>
# Contributor: Guillaume ALAUX <guillaume at alaux dot net>

# nimbus -> requires zookeeper to run
# supervisor -> requires zookeeper to run
# ui -> requires nimbus

# TODO change zoo ports
# TODO split packages? nimbus/supervisor/ui ?

pkgname=storm
pkgver=2.8.2
pkgrel=1
pkgdesc='Apache Storm is a free and open source distributed realtime computation system'
arch=('any')
url='https://storm.apache.org/'
license=('Apache')
depends=('java-runtime' 'python' 'zookeeper')
makedepends=('jq')
provides=('apache-storm')
backup=('etc/storm/storm_env.ini'
        'etc/storm/storm.yaml'
        'etc/zookeeper/zookeeper-storm/zoo.cfg'
        'etc/zookeeper/zookeeper-storm/log4j.properties')
install=storm.install
_download_portal="https://www.apache.org/dyn/closer.lua/storm/apache-storm-${pkgver}/apache-storm-${pkgver}.tar.gz"
_closest_mirror=$(curl "${_download_portal}?asjson=1" | jq '(.preferred + .path_info)' | tr -d '"",' )
source=("${pkgname}-${pkgver}.tar.gz::$_closest_mirror"
        'zookeeper_zoo.cfg'
        'zookeeper_log4j.properties'
        'systemd_storm-nimbus.service'
        'systemd_storm-supervisor.service'
        'systemd_storm-ui.service'
        'systemd_sysusers.d_storm.conf'
        'systemd_tmpfiles.d_storm.conf')
sha256sums=('806d99aee53651ae449956d760ff438afb4f08dc22b23864d528195c27223c5b'
            'c94799f4b459f5218faf1da57936baeb4c32b9542a1ba0aacdd637bf2f3aaf05'
            '00780ee4cea3bb7a282a548f41b8964d5e392776f9d687ebea89cd49ed5742e3'
            '2dafe9352ed01fbe0c74ec6e29e0233a842c4fead7af38cd3540bf69c93a895c'
            '5decdfb42d6f1b50c21df1c36072bf1c97d0553a23c29536ea020a31210535ce'
            'a27a90bae3d948a6cf65732c43b92c735f8dbaa707ab7dfd9f7c74e4fe42f3ba'
            '66db40103bc75bae0817581ef1bbde35bb3b81c2494eda5a8c769813ddd000f1'
            '15c959356f32c9583fe6a328d2ec4c7addb983ac7a2529621d90c24b49a07df3')

package() {
  cd "${srcdir}/apache-${pkgname}-${pkgver}"

  _app_home=/usr/share/${pkgname}

  install -d "${pkgdir}"{${_app_home}/bin,/etc,/usr/bin,/usr/share/java/${pkgname}}
  install -d "${pkgdir}"/etc/zookeeper/zookeeper-${pkgname}

  cp -r conf "${pkgdir}/etc/${pkgname}/"
  ln -s /etc/${pkgname} "${pkgdir}${_app_home}/conf"
  install -D -m 644 ${srcdir}/zookeeper_log4j.properties \
    "${pkgdir}/etc/zookeeper/zookeeper-${pkgname}/log4j.properties"
  install -D -m 644 ${srcdir}/zookeeper_zoo.cfg \
    "${pkgdir}/etc/zookeeper/zookeeper-${pkgname}/zoo.cfg"

  cp -r bin/storm bin/storm.py "${pkgdir}${_app_home}/bin/"
  sed -i "1s|^#!/usr/bin/python$|#!/usr/bin/python2|" \
    "${pkgdir}${_app_home}/bin/storm.py"
  ln -s ${_app_home}/bin/storm "${pkgdir}/usr/bin/storm"

  cp -r lib/* "${pkgdir}/usr/share/java/${pkgname}"
  ln -s ../java/${pkgname} "${pkgdir}${_app_home}/lib"

  cp -r examples external extlib extlib-daemon log4j2 public README.markdown SECURITY.md  \
    "${pkgdir}${_app_home}"

  ln -s /var/log/${pkgname} "${pkgdir}${_app_home}/logs"

  install -m 644 "${pkgdir}/etc/${pkgname}/storm.yaml" \
    "${pkgdir}/etc/${pkgname}/storm.yaml.sample"
  echo "dev.zookeeper.path: \"/var/lib/zookeeper/zookeeper-${pkgname}\"" \
    >> "${pkgdir}/etc/${pkgname}/storm.yaml"
  echo "storm.local.dir: \"/var/lib/${pkgname}\"" \
    >> "${pkgdir}/etc/${pkgname}/storm.yaml"

  install -D -m 644 ${srcdir}/systemd_sysusers.d_storm.conf \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -D -m 644 ${srcdir}/systemd_tmpfiles.d_storm.conf \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  for s in nimbus supervisor ui; do
    install -D -m 644 "${srcdir}/systemd_${pkgname}-${s}.service" \
      "${pkgdir}/usr/lib/systemd/system/${pkgname}-${s}.service"
  done
}
