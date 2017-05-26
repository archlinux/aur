# Maintainer: Evan Goldenberg <evangoldenberg@gmail.com>

pkgname='hbase'
pkgver=1.3.1
pkgrel=1
pkgdesc='HBase - the Hadoop database'
arch=('i686' 'x86_64')
url='https://hbase.apache.org'
license=('apache')
depends=('java-environment>=7')
backup=(
  "etc/${pkgname}/hadoop-metrics2-hbase.properties"
  "etc/${pkgname}/hbase-env.cmd"
  "etc/${pkgname}/hbase-env.sh"
  "etc/${pkgname}/hbase-policy.xml"
  "etc/${pkgname}/hbase-site.xml"
  "etc/${pkgname}/log4j.properties"
  "etc/${pkgname}/regionservers"
)
install="${pkgname}.install"
source=(
  "http://www-us.apache.org/dist/hbase/${pkgver}/hbase-${pkgver}-bin.tar.gz"
  'hbase.install'
  'hbase.profile'
  'hbase.service'
  'hbase-site.xml'
)
sha256sums=('926ef3c576c44e3a37295d286aa9acabea4eb6f77c420a4d9034b6aac86902e0'
            '07ea851195baf0f9a82686872077bbfd9ea4726b2fc618639bf0cdcb5e278c25'
            '8cab4654859bcc830dd0127bf8ea1c9200c46377a8885c4b726335502e3a079f'
            '0d99566ffac2b1b9ebb3d6e6867ecd4dcfaba2bdb348c29b293fb9673e001a7d'
            'c3d3710f7b681a2d629df9af68c502b65bdf81c5b25c3a711bd53e20c4b16cb3')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/bin" "$pkgdir/opt" "$pkgdir/etc/hbase" "$pkgdir/usr/lib/systemd/system"
  install -d "$pkgdir/var/log/hbase" "$pkgdir/var/lib/hbase"
  cp -r "$srcdir/${pkgname}-${pkgver}" "$pkgdir/opt/hbase"

  cd "$pkgdir/usr/bin"
  for binary in hbase hbase-config.sh start-hbase.sh stop-hbase.sh; do
    ln -s "/opt/hbase/bin/$binary" $binary
  done

  install -Dm755 "$srcdir/hbase.profile" "$pkgdir/etc/profile.d/hbase.sh"
  install -Dm644 "$srcdir/hbase.service" "$pkgdir/usr/lib/systemd/system/hbase.service"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/conf"/* "$pkgdir/etc/hbase"
  install -Dm644 "$srcdir/hbase-site.xml" "$pkgdir/etc/hbase/hbase-site.xml"

  cd "$pkgdir/opt/hbase"
  mv conf conf-templates
  ln -sf "/etc/hbase" conf
}
