# Maintainer: Pawel Dzieciolowski <dzieciolowski dot pawel at gmail dot com>

pkgname=apache-nifi
pkgver=1.8.0
pkgrel=1
pkgdesc='An easy to use, powerful, and reliable system to process and distribute data'
arch=('any')
url="http://nifi.apache.org"
license=('Apache')
depends=('java-environment')
source=("https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=nifi/$pkgver/nifi-$pkgver-bin.tar.gz"
    "apache-nifi.service"
    "apache-nifi.sysusers"
    "apache-nifi.tmpfiles")
sha512sums=('c1ff65955e12f0a8792bc1709e95d3ba6d1a852037468075e42e851c324708e3185dcf4457af011f617648b7df277b0f6d3a151936cd0df83f852ff6609de5f6'
            '9b2f02ae477e47330c9c3c07e6942c49cf7722b40c09b94a347656de46e9ed497cfb30d8581764ccdb6046e3672676faead32fbb8a5dae46f0d01103c6410a48'
            '97bfcc0e3accd513bcb519776a175d0174a36a2593f536dd0430c9819e809886b966669f3f7e44e4f73ce83a78ab27ab94edbbefc62c39e4f93fdbdd97bbac71'
            '0559c4751624e0b39bf013ee26191622ee015a9065b513cffac2adc4d871eb47c73b52474a41c4d7337d8d4728cc87048f32fba98c8a663586626563da0d8a6d')
install=apache-nifi.install

PKGEXT='.pkg.tar' # disable package compression

package() {
    install -d "$pkgdir/opt"

    cp -r "$srcdir/nifi-$pkgver" "$pkgdir/opt/apache-nifi"
    install -Dm644 "$srcdir/apache-nifi.service" "$pkgdir/usr/lib/systemd/system/apache-nifi.service"

    sed -i 's|^#export JAVA_HOME=.*$|export JAVA_HOME=/usr/lib/jvm/default-runtime|' "$pkgdir/opt/apache-nifi/bin/nifi-env.sh"
    sed -i 's|^export NIFI_HOME=.*$|export NIFI_HOME=/opt/apache-nifi|' "$pkgdir/opt/apache-nifi/bin/nifi-env.sh"
    sed -i 's|^export NIFI_LOG_DIR=.*$|export NIFI_LOG_DIR=/var/log/apache-nifi|' "$pkgdir/opt/apache-nifi/bin/nifi-env.sh"
    sed -i 's|^export NIFI_PID_DIR=.*$|export NIFI_PID_DIR=/var/run/apache-nifi|' "$pkgdir/opt/apache-nifi/bin/nifi-env.sh"

    sed -i 's|^nifi.flow.configuration.file=.*$|nifi.flow.configuration.file=/var/lib/apache-nifi/conf/flow.xml.gz|' "$pkgdir/opt/apache-nifi/conf/nifi.properties"
    sed -i 's|^nifi.flow.configuration.archive.dir=.*$|nifi.flow.configuration.archive.dir=/var/lib/apache-nifi/conf/archive/|' "$pkgdir/opt/apache-nifi/conf/nifi.properties"
    sed -i 's|^nifi.templates.directory=.*$|nifi.templates.directory=/var/lib/apache-nifi/conf/templates|' "$pkgdir/opt/apache-nifi/conf/nifi.properties"
    sed -i 's|^nifi.nar.working.directory=.*$|nifi.nar.working.directory=/var/lib/apache-nifi/work/nar/|' "$pkgdir/opt/apache-nifi/conf/nifi.properties"
    sed -i 's|^nifi.documentation.working.directory=.*$|nifi.documentation.working.directory=/var/lib/apache-nifi/work/docs/components|' "$pkgdir/opt/apache-nifi/conf/nifi.properties"
    sed -i 's|^nifi.database.directory=.*$|nifi.database.directory=/var/lib/apache-nifi/database_repository|' "$pkgdir/opt/apache-nifi/conf/nifi.properties"
    sed -i 's|^nifi.flowfile.repository.directory=.*$|nifi.flowfile.repository.directory=/var/lib/apache-nifi/flowfile_repository|' "$pkgdir/opt/apache-nifi/conf/nifi.properties"
    sed -i 's|^nifi.content.repository.directory.default=.*$|nifi.content.repository.directory.default=/var/lib/apache-nifi/content_repository|' "$pkgdir/opt/apache-nifi/conf/nifi.properties"
    sed -i 's|^nifi.provenance.repository.directory.default=.*$|nifi.provenance.repository.directory.default=/var/lib/apache-nifi/provenance_repository|' "$pkgdir/opt/apache-nifi/conf/nifi.properties"
    sed -i 's|^nifi.web.jetty.working.directory=.*$|nifi.web.jetty.working.directory=/var/lib/apache-nifi/work/jetty|' "$pkgdir/opt/apache-nifi/conf/nifi.properties"

    sed -i 's|^.*<property name="Directory">./state/local</property>*$|        <property name="Directory">/var/lib/apache-nifi/state/local</property>|' "$pkgdir/opt/apache-nifi/conf/state-management.xml"

    for script in nifi.sh nifi-env.sh; do
        chmod 755 "$pkgdir/opt/apache-nifi/bin/$script"
    done

    install -D -m 644 "${srcdir}/apache-nifi.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m 644 "${srcdir}/apache-nifi.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
