# Maintainer: François Garillot ("huitseeker") <francois [at] garillot.net>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@gmail.com>
# Contributor: Emanuel Fontelles ("emanuelfontelles") <emanuelfontelles@hotmail.com>

pkgname=apache-spark
pkgver=2.4.3
pkgrel=1
pkgdesc="fast and general engine for large-scale data processing"
arch=('any')
url="http://spark.apache.org"
license=('APACHE')
depends=('java-environment>=6' 'java-environment<9')
optdepends=('python2: python2 support for pyspark'
            'ipython2: ipython2 support for pyspark'
            'python: python3 support for pyspark'
            'ipython: ipython3 support for pyspark'
            'r: support for sparkR'
            'rsync: support rsync hadoop binaries from master'
            'hadoop: support for running on YARN')

install=apache-spark.install
source=("https://archive.apache.org/dist/spark/spark-${pkgver}/spark-${pkgver}-bin-hadoop2.7.tgz"
        'apache-spark-master.service'
        'apache-spark-slave@.service'
        'spark-env.sh'
        'spark-daemon-run.sh'
        'run-master.sh'
        'run-slave.sh')
sha1sums=('7b2f1be5c4ccec86c6d2b1e54c379b7af7a5752a'
          'ac71d12070a9a10323e8ec5aed4346b1dd7f21c6'
          'a191e4f8f7f8bbc596f4fadfb3c592c3efbc4fc0'
          '3fa39d55075d4728bd447692d648053c9f6b07ec'
          '08557d2d5328d5c99e533e16366fd893fffaad78'
          '323445b8d64aea0534a2213d2600d438f406855b'
          '65b1bc5fce63d1fa7a1b90f2d54a09acf62012a4')
backup=('etc/apache-spark/spark-env.sh')

PKGEXT=${PKGEXT:-'.pkg.tar.xz'}

prepare() {
  cd "$srcdir/spark-${pkgver}-bin-hadoop2.7"
}

package() {
        cd "$srcdir/spark-${pkgver}-bin-hadoop2.7"

        install -d "$pkgdir/usr/bin" "$pkgdir/opt" "$pkgdir/var/log/apache-spark" "$pkgdir/var/lib/apache-spark/work"
        chmod 2775 "$pkgdir/var/log/apache-spark" "$pkgdir/var/lib/apache-spark/work"

        cp -r "$srcdir/spark-${pkgver}-bin-hadoop2.7" "$pkgdir/opt/apache-spark/"

        cd "$pkgdir/usr/bin"
        for binary in beeline pyspark sparkR spark-class spark-shell find-spark-home spark-sql spark-submit load-spark-env.sh; do
                binpath="/opt/apache-spark/bin/$binary"
                ln -s "$binpath" $binary
                sed -i 's|^export SPARK_HOME=.*$|export SPARK_HOME=/opt/apache-spark|' "$pkgdir/$binpath"
                sed -i -Ee 's/\$\(dirname "\$0"\)/$(dirname "$(readlink -f "$0")")/g' "$pkgdir/$binpath"
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
        install -Dm644 "$srcdir/spark-${pkgver}-bin-hadoop2.7/conf"/* "$pkgdir/etc/apache-spark"

        cd "$pkgdir/opt/apache-spark"
        mv conf conf-templates
        ln -sf "/etc/apache-spark" conf
        ln -sf "/var/lib/apache-spark/work" .
}
