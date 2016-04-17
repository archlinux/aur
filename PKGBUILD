# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
# Sources available at https://github.com/galaux/arch_storm

# nimbus -> requires zookeeper to run
# supervisor -> requires zookeeper to run
# ui -> requires nimbus

# TODO change zoo ports
# TODO split packages? nimbus/supervisor/ui ?

pkgname=storm
pkgver=1.0.0
pkgrel=1
pkgdesc='Distributed and fault-tolerant realtime computation system'
arch=('any')
url='https://storm.apache.org/'
license=('Apache')
depends=('java-runtime' 'python2' 'zookeeper')
backup=(etc/storm/storm_env.ini
        etc/storm/storm.yaml
        etc/zookeeper/zookeeper-storm/zoo.cfg
        etc/zookeeper/zookeeper-storm/log4j.properties)
install=install_storm.sh

_apache_cgi="http://www.apache.org/dyn/closer.cgi"
_closest=$(curl "${_apache_cgi}?asjson=1" | tr -d '\n ' | sed -r 's/.*"preferred":"(.+)".*/\1/')
_app_path="/${pkgname}/apache-${pkgname}-${pkgver}/apache-${pkgname}-${pkgver}.tar.gz"
source=(${_closest}/${_app_path}
        zookeeper_zoo.cfg
        zookeeper_log4j.properties
        systemd_storm-nimbus.service
        systemd_storm-supervisor.service
        systemd_storm-ui.service
        systemd_sysusers.d_storm.conf
        systemd_tmpfiles.d_storm.conf
        arch_python2.patch)

sha256sums=('8233dab1a6898fc39bcf9fe68dfadbee38159a39c473ac2da9ce9da60db52066'
            'c94799f4b459f5218faf1da57936baeb4c32b9542a1ba0aacdd637bf2f3aaf05'
            '00780ee4cea3bb7a282a548f41b8964d5e392776f9d687ebea89cd49ed5742e3'
            '0d8958786538714da86ccf3f23cb668fa017530f8858aea2b7325ffe1af66cd1'
            '894b41bd473410271337585509fe9db431a74f3ae2114039229a5742214e097e'
            '41eade47c4e3b07c53c84351730b1f8752341eed095b6b6fc499ccc2213bead3'
            '66db40103bc75bae0817581ef1bbde35bb3b81c2494eda5a8c769813ddd000f1'
            '15c959356f32c9583fe6a328d2ec4c7addb983ac7a2529621d90c24b49a07df3'
            '94567fe94f4d27b1a82714231c0fa9a87827343f3838f9a962e3483f6c6d26a5')

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
  patch -d "${pkgdir}${_app_home}" \
        -p0 < "${srcdir}/arch_python2.patch"

  cp -r lib/* "${pkgdir}/usr/share/java/${pkgname}"
  ln -s ../java/${pkgname} "${pkgdir}${_app_home}/lib"

  cp -r examples external log4j2 public README.markdown SECURITY.md \
    "${pkgdir}${_app_home}"

  ln -s /var/log/${pkgname} "${pkgdir}${_app_home}/logs"

  install -m 644 "${pkgdir}/etc/${pkgname}/storm.yaml" \
    "${pkgdir}/etc/${pkgname}/storm.yaml.sample"
  echo "dev.zookeeper.path: \"/var/lib/zookeeper/zookeeper-${pkgname}\"" \
    >> "${pkgdir}/etc/${pkgname}/storm.yaml"
  echo "storm.local.dir: \"/var/lib/${pkgname}\"" \
    >> "${pkgdir}/etc/${pkgname}/storm.yaml"
  #TODO dev-storm-zookeeper (add this in conjunction with special storm-zookeeper.service file?)

  install -D -m 644 ${srcdir}/systemd_sysusers.d_storm.conf \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -D -m 644 ${srcdir}/systemd_tmpfiles.d_storm.conf \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  for s in nimbus supervisor ui; do
    install -D -m 644 "${srcdir}/systemd_${pkgname}-${s}.service" \
      "${pkgdir}/usr/lib/systemd/system/${pkgname}-${s}.service"
  done
}
