# Maintainer: Shengyu Zhang <la@archlinuxcn.org>
# Contributor: Tao Meng ("mtunique") <oatgnem [at] gmail.com>

pkgname=apache-flink
_scalaver=2.11
_appver=1.9.0
pkgver=${_scalaver}_${_appver}
pkgrel=1
pkgdesc="Apache Flink is an open source platform for distributed stream and batch data processing"
arch=("i686" "x86_64")
url="http://flink.apache.org"
license=("APACHE")
depends=('java-environment>=7' 'openssh')
optdepends=("python2: python2 support for python API"
            "python: python3 support for python API"
            "hadoop: support for running on YARN")
install=apache-flink.install
source=("http://www-us.apache.org/dist/flink/flink-${_appver}/flink-${_appver}-bin-scala_${_scalaver}.tgz"
        "apache-flink-jobmanager.service"
        "apache-flink-taskmanager@.service")
md5sums=('c7c9c64ce71d85295c1a4e4d325ea521'
         'd44f0d5c4af36313b405115168bc48c3'
         '76146d287e355b8fae843858e8233608')
backup=(
    "etc/${pkgname}/flink-conf.yaml"
    "etc/${pkgname}/log4j-cli.properties"
    "etc/${pkgname}/log4j-yarn-session.properties"
    "etc/${pkgname}/log4j.properties"
    "etc/${pkgname}/logback-yarn.xml"
    "etc/${pkgname}/logback.xml"
    "etc/${pkgname}/masters"
    "etc/${pkgname}/slaves"
    "etc/${pkgname}/zoo.cfg"
)

PKGEXT=${PKGEXT:-".pkg.tar.xz"}

prepare() {
  cd "$srcdir/flink-${_appver}"
}

package() {
        cd "$srcdir/flink-${_appver}"

        install -d "$pkgdir/usr/bin" "$pkgdir/opt" "$pkgdir/var/log/apache-flink" "$pkgdir/run/apache-flink"

        cp -r "$srcdir/flink-${_appver}" "$pkgdir/opt/apache-flink/"

        cd "$pkgdir/usr/bin"
        binpath="/opt/apache-flink/bin/flink"
        ln -s "$binpath" $binary

        install -Dm644 "$srcdir/apache-flink-jobmanager.service" "$pkgdir/usr/lib/systemd/system/apache-flink-jobmanager.service"
        install -Dm644 "$srcdir/apache-flink-taskmanager@.service" "$pkgdir/usr/lib/systemd/system/apache-flink-taskmanager@.service"


        mkdir -p "$pkgdir/etc/apache-flink"
        install -Dm644 "$srcdir/flink-${_appver}/conf"/* "$pkgdir/etc/apache-flink"

        cd "$pkgdir/opt/apache-flink"
        mv conf conf-templates
        ln -sf "/etc/apache-flink" conf
}
