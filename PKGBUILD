# Maintainer: Lukas Zimmermann ("lukaszimmermann") <luk [dot] zim91 [at] gmail.com>
# Contributor: François Garillot ("huitseeker") <francois [at] garillot.net>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@gmail.com>
# Contributor: Emanuel Fontelles ("emanuelfontelles") <emanuelfontelles@hotmail.com>

pkgname=apache-spark
pkgver=3.0.0
pkgrel=1
pkgdesc="fast and general engine for large-scale data processing"
arch=('any')
url="http://spark.apache.org"
license=('APACHE')
depends=('java-environment>=6' 'java-environment<=11')
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

sha256sums=('98f6b92e5c476d7abb93cc179c2616aa5dc897da25753bd197e20ef54a28d945'
            'e4333e4a484543786e82d1f7af144ad99d9cc666d2e2742f30b5120996f32183'
            'e656ef5599d095472641e6fd58e9046d7db3f983b334e9a695e278ba799afc5b'
            '0e9c3721cfac02e3b67248e1dfe2def49a9fc6408092b291b1c67e89a9c130cb'
            '6ded9f6b31b8be5fa782fc18ec0991eb7cb18fbea65b8e7560587c3fbe7f20f7'
            '1134342330c7680e7d9847cc4de2c0f97ecd55ee7db1c6068bc45219b5838e98'
            '4e1159b25d0f6f3dcdf72d1a5f186e5693a5e9d8690ad1600a9e44aa43022e29')

backup=('etc/apache-spark/spark-env.sh')

package() {
        cd "$srcdir/spark-${pkgver}-bin-hadoop2.7"

        install -d "${pkgdir}/usr/bin" "${pkgdir}/opt" "${pkgdir}/var/log/apache-spark" "${pkgdir}/var/lib/apache-spark/work"
        chmod 2775 "${pkgdir}/var/log/apache-spark" "${pkgdir}/var/lib/apache-spark/work"

        cp -r "${srcdir}/spark-${pkgver}-bin-hadoop2.7" "${pkgdir}/opt/apache-spark/"

        cd "${pkgdir}/usr/bin"
        for binary in beeline pyspark sparkR spark-class spark-shell find-spark-home spark-sql spark-submit load-spark-env.sh; do
                local binpath="/opt/apache-spark/bin/${binary}"
                ln -s "${binpath}" ${binary}
                sed -i 's|^export SPARK_HOME=.*$|export SPARK_HOME=/opt/apache-spark|' "${pkgdir}/${binpath}"
                sed -i -Ee 's/\$\(dirname "\$0"\)/$(dirname "$(readlink -f "$0")")/g' "${pkgdir}/${binpath}"
        done

        mkdir -p ${pkgdir}/etc/profile.d
        echo '#!/bin/sh' > ${pkgdir}/etc/profile.d/apache-spark.sh
        echo 'export SPARK_HOME=/opt/apache-spark' >> ${pkgdir}/etc/profile.d/apache-spark.sh
        chmod 755 ${pkgdir}/etc/profile.d/apache-spark.sh

        install -Dm644 "${srcdir}/apache-spark-master.service" "${pkgdir}/usr/lib/systemd/system/apache-spark-master.service"
        install -Dm644 "${srcdir}/apache-spark-slave@.service" "${pkgdir}/usr/lib/systemd/system/apache-spark-slave@.service"
        install -Dm644 "${srcdir}/spark-env.sh" "${pkgdir}/etc/apache-spark/spark-env.sh"
        for script in run-master.sh run-slave.sh spark-daemon-run.sh; do
            install -Dm755 "${srcdir}/${script}" "${pkgdir}/opt/apache-spark/sbin/${script}"
        done
        install -Dm644 "${srcdir}/spark-${pkgver}-bin-hadoop2.7/conf"/* "${pkgdir}/etc/apache-spark"

        cd "${pkgdir}/opt/apache-spark"
        mv conf conf-templates
        ln -sf "/etc/apache-spark" conf
        ln -sf "/var/lib/apache-spark/work" .
}
