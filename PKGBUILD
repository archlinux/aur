# Maintainer: François Garillot ("huitseeker") <francois [at] garillot.net>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@gmail.com>

pkgname=apache-spark
pkgver=1.6.0
pkgrel=3
pkgdesc="fast and general engine for large-scale data processing"
arch=('any')
url="http://spark.apache.org"
license=('APACHE')
depends=('maven>=3.3.3' 'java-environment>=6' 'scala' 'python2>=2.7' 'hadoop>=2.6')
optdepends=('python: PYSPARK_PYTHON=python3 pyspark'
            'ipython: PYSPARK_DRIVER_PYTHON=ipython pyspark; IPYTHON=1 pyspark')
install=apache-spark.install
source=("http://d3kbcqa49mib13.cloudfront.net/spark-$pkgver.tgz"
        'apache-spark-standalone.service'
        'spark-env.sh')
 md5sums=('311883f4e50c4f6d1fe0b0147f660cc2'
         'bb7d8b85366e6f9cc0b2777eaea161a8'
         '0913001583e607849270090555dbd309')
backup=('etc/apache-spark/spark-env.sh')

PKGEXT=${PKGEXT:-'.pkg.tar.xz'}

prepare() {
  cd "$srcdir/spark-$pkgver"

  sed -i 's|pid=$SPARK_PID_DIR/spark-$SPARK_IDENT_STRING-$command-$instance.pid|pid=/var/lib/apache-spark/spark-daemon.pid|' sbin/spark-daemon.sh
}

build() {
        cd "$srcdir/spark-$pkgver"

        export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512m"

        dev/change-scala-version.sh 2.11

        JAVA_HOME=/usr/lib/jvm/default-runtime ./make-distribution.sh -Pscala-2.11  -DskipTests -Dmaven.repo.local=/tmp -DautoVersionSubmodules=true -U -Djline.version=2.13 -Djline.groupid=jline -Pyarn -Phadoop-2.6
}

package() {
        cd "$srcdir/spark-$pkgver"

        install -d "$pkgdir/usr/bin" "$pkgdir/usr/share"

        cp -r "$srcdir/spark-$pkgver/dist" "$pkgdir/usr/share/apache-spark/"

        cd "$pkgdir/usr/bin"
        for binary in beeline pyspark sparkR spark-class spark-shell spark-sql spark-submit load-spark-env.sh; do
                binpath="/usr/share/apache-spark/bin/$binary"
                ln -s "$binpath" $binary
                sed -i 's|^export SPARK_HOME=.*$|export SPARK_HOME=/usr/share/apache-spark|' "$pkgdir/$binpath"
        done

        install -Dm644 "$srcdir/apache-spark-standalone.service" "$pkgdir/usr/lib/systemd/system/apache-spark-standalone.service"
        install -Dm644 "$srcdir/spark-env.sh" "$pkgdir/etc/apache-spark/spark-env.sh"

        cd "$pkgdir/usr/share/apache-spark/conf"
        ln -sf "/etc/apache-spark/spark-env.sh" .
}
