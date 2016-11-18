# Maintainer: François Garillot ("huitseeker") <francois [at] garillot.net>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@gmail.com>

pkgname=apache-spark
pkgver=2.0.2
pkgrel=1
pkgdesc="fast and general engine for large-scale data processing"
arch=('any')
url="http://spark.apache.org"
license=('APACHE')
depends=('java-environment>=6' 'hadoop')
optdepends=('python2: python2 support for pyspark'
            'ipython2: ipython2 support for pyspark'
            'python: python3 support for pyspark'
            'ipython: ipython3 support for pyspark'
            'r: support for sparkR'
            'rsync: support rsync hadoop binaries from master')
install=apache-spark.install
source=("http://d3kbcqa49mib13.cloudfront.net/spark-${pkgver}-bin-without-hadoop.tgz"
        'apache-spark-master.service'
        'apache-spark-slave@.service'
        'spark-env.sh'
        'spark-daemon-run.sh'
        'run-master.sh'
        'run-slave.sh')
md5sums=('32110c1bb8f081359738742bd26bced1'
         '9ffe1f9c4bb2ea4e5a75ab6469fe76d4'
         '8d34bd4cc946f46625597ca606da8ab6'
         'f8cc449543df418b8adfcc36a3afb384'
         '8ff953f0436209b6190add59703a34f0'
         '028472b82e9def7d5d409f008d064fe2'
         '99115eedc453c9b8ca04cca2e32e4537')
backup=('etc/apache-spark/spark-env.sh')

PKGEXT=${PKGEXT:-'.pkg.tar.xz'}

prepare() {
  cd "$srcdir/spark-${pkgver}-bin-without-hadoop"
}

package() {
        cd "$srcdir/spark-${pkgver}-bin-without-hadoop"

        install -d "$pkgdir/usr/bin" "$pkgdir/opt" "$pkgdir/var/log/apache-spark"

        cp -r "$srcdir/spark-${pkgver}-bin-without-hadoop" "$pkgdir/opt/apache-spark/"

        cd "$pkgdir/usr/bin"
        for binary in beeline pyspark sparkR spark-class spark-shell spark-sql spark-submit load-spark-env.sh; do
                binpath="/opt/apache-spark/bin/$binary"
                ln -s "$binpath" $binary
                sed -i 's|^export SPARK_HOME=.*$|export SPARK_HOME=/opt/apache-spark|' "$pkgdir/$binpath"
        done

        mkdir -p $pkgdir/etc/profile.d
        echo '#!/bin/sh' > $pkgdir/etc/profile.d/apache-spark.sh
        echo 'SPARK_HOME=/opt/apache-spark' >> $pkgdir/etc/profile.d/apache-spark.sh
        echo 'export SPARK_HOME' >> $pkgdir/etc/profile.d/apache-spark.sh
        chmod 755 $pkgdir/etc/profile.d/apache-spark.sh

        install -Dm644 "$srcdir/apache-spark-master.service" "$pkgdir/usr/lib/systemd/system/apache-spark-master.service"
        install -Dm644 "$srcdir/apache-spark-slave@.service" "$pkgdir/usr/lib/systemd/system/apache-spark-slave@.service"
        install -Dm644 "$srcdir/spark-env.sh" "$pkgdir/etc/apache-spark/spark-env.sh"
        for script in run-master.sh run-slave.sh spark-daemon-run.sh; do
            install -Dm755 "$srcdir/$script" "$pkgdir/opt/apache-spark/sbin/$script"
        done
        install -Dm644 "$srcdir/spark-${pkgver}-bin-without-hadoop/conf"/* "$pkgdir/etc/apache-spark"

        cd "$pkgdir/opt/apache-spark"
        mv conf conf-templates
        ln -sf "/etc/apache-spark" conf
        ln -sf "/var/lib/apache-spark/work" .
}
