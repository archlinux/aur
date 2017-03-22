# Maintainer: Tao Meng ("mtunique") <oatgnem [at] gmail.com>

pkgname=apache-flink
pkgver=1.2.0
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
source=("http://www-us.apache.org/dist/flink/flink-1.2.0/flink-${pkgver}-bin-hadoop2-scala_2.10.tgz"
        "apache-flink-jobmanager.service"
        "apache-flink-taskmanager@.service")
md5sums=("792225bf4256b8ae2b2d9582a505c41c"
         "d44f0d5c4af36313b405115168bc48c3"
         "76146d287e355b8fae843858e8233608")
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
  cd "$srcdir/flink-${pkgver}"
}

package() {
        cd "$srcdir/flink-${pkgver}"

        install -d "$pkgdir/usr/bin" "$pkgdir/opt" "$pkgdir/var/log/apache-flink" "$pkgdir/run/apache-flink"

        cp -r "$srcdir/flink-${pkgver}" "$pkgdir/opt/apache-flink/"

        cd "$pkgdir/usr/bin"
        binpath="/opt/apache-flink/bin/flink"
        ln -s "$binpath" $binary

        install -Dm644 "$srcdir/apache-flink-jobmanager.service" "$pkgdir/usr/lib/systemd/system/apache-flink-jobmanager.service"
        install -Dm644 "$srcdir/apache-flink-taskmanager@.service" "$pkgdir/usr/lib/systemd/system/apache-flink-taskmanager@.service"


        mkdir -p "$pkgdir/etc/apache-flink"
        install -Dm644 "$srcdir/flink-${pkgver}/conf"/* "$pkgdir/etc/apache-flink"

        cd "$pkgdir/opt/apache-flink"
        mv conf conf-templates
        ln -sf "/etc/apache-flink" conf
}
