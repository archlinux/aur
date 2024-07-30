# Maintainer: Damien GASPARINA <dgasparina at gmail dot com>
pkgname=confluent-platform
pkgver=7.7.0
pkgrel=0
pkgdesc='Confluent, founded by the creators of Apache Kafka, delivers a complete execution of Kafka for the Enterprise, to help you run your business in real time.'
arch=('any')
url='https://www.confluent.io/'
license=('Commercial')
depends=('java-runtime')
backup=(etc/confluent-control-center/log4j.properties
        etc/confluent-control-center/control-center-dev.properties
        etc/confluent-control-center/propertyfile.conf
        etc/confluent-control-center/log4j-rolling.properties
        etc/confluent-control-center/control-center-production.properties
        etc/confluent-control-center/ldap.conf
        etc/confluent-control-center/log4j-silent.properties
        etc/confluent-control-center/control-center.properties
        etc/schema-registry/schema-registry.properties
        etc/schema-registry/log4j.properties
        etc/schema-registry/connect-avro-distributed.properties
        etc/schema-registry/connect-avro-standalone.properties
        etc/kafka/log4j.properties
        etc/kafka/connect-log4j.properties
        etc/kafka/connect-distributed.properties
        etc/kafka/connect-console-source.properties
        etc/kafka/connect-standalone.properties
        etc/kafka/producer.properties
        etc/kafka/tools-log4j.properties
        etc/kafka/consumer.properties
        etc/kafka/server.properties
        etc/kafka/zookeeper.properties
        etc/kafka-rest/log4j.properties
        etc/kafka-rest/kafka-rest.properties
        etc/ksql/log4j.properties
        etc/ksql/log4j-rolling.properties
        etc/ksql/log4j-file.properties
        etc/ksql/datagen.properties
        etc/ksql/ksql-server.properties
        etc/ksql/log4j-silent.properties
        etc/confluent-rebalancer/log4j.properties
        )
install=install_confluent.sh

source=(https://packages.confluent.io/archive/7.7/confluent-7.7.0.tar.gz
        systemd_sysusers.d_confluent.conf
        https://s3-us-west-2.amazonaws.com/confluent.cloud/confluent-cli/archives/latest/confluent_latest_linux_amd64.tar.gz
       )

sha256sums=('c3975ace34994efff3a8d70e726c9452ef33e707edb09b41794ddb3b55a143a9'
            '6f5dfdbaf6ef405117482413b376e55148f75423bc6b8681cd8f91cdb7d96a99'
            'SKIP')


package() {
	cd "${srcdir}/confluent-${pkgver}"

	# Installing and copying all required files
	install -d "${pkgdir}"{/usr/,/usr/bin,/etc/,/usr/lib/,/usr/share/,/usr/src/,/var/log/kafka}

	cp -rf  ${srcdir}/confluent-${pkgver}/bin/* ${pkgdir}/usr/bin/
	cp -rf  ${srcdir}/confluent-${pkgver}/src/* ${pkgdir}/usr/src/
	cp -rf  ${srcdir}/confluent-${pkgver}/lib/* ${pkgdir}/usr/lib
	cp -rf  ${srcdir}/confluent-${pkgver}/share/* ${pkgdir}/usr/share/
	cp -rf  ${srcdir}/confluent-${pkgver}/etc/* ${pkgdir}/etc/

	cp ${srcdir}/systemd_sysusers.d_confluent.conf ${pkgdir}/confluent.conf

	# Additional configuration to systemm.d 
	# TO CONSIDER Should tmpfile be used for the default values? 
	install -D -m 644 ${srcdir}/systemd_sysusers.d_confluent.conf "${pkgdir}/usr/lib/sysusers.d/confluent.conf"

	# We probably don't need binaries for Windows
	rm -rf ${pkgdir}/usr/bin/windows/

	# Configure a development environment 
	# Ensure that localhost is use as default value
	_c3_etc=${pkgdir}/etc/confluent-control-center/control-center.properties
	_c3_system=${pkgdir}/usr/lib/systemd/system/confluent-control-center.service  
	_kafka_etc=${pkgdir}/etc/kafka/server.properties
	_zookeeper_etc=${pkgdir}/etc/kafka/zookeeper.properties

	# Configure Apache kafka 
	sed -i 's#log.dirs=/tmp/kafka-logs#log.dirs=/var/lib/confluent/kafka#g' $_kafka_etc
	sed -i 's#dataDir=/tmp/zookeeper#dataDir=/var/lib/confluent/zookeeper#g' $_zookeeper_etc 

	# Configure Confluent Control Center
	# Required directories for Confluent Control Center 
	sed -i 's/#bootstrap.servers=kafka1:9092/bootstrap.servers=localhost:9092/g' $_c3_etc
	sed -i 's/#zookeeper.connect=zookeeper1:2181/zookeeper.connect=localhost:2181/g' $_c3_etc 
	sed -i 's/#confluent.controlcenter.connect.cluster=connect1:8083/confluent.controlcenter.connect.cluster=localhost:8083/g' $_c3_etc 

	# Configure replication factor to 1 for internal topics 
	sed -i 's/#confluent.controlcenter.internal.topics.replication=3/confluent.controlcenter.internal.topics.replication=1/g' $_c3_etc
	sed -i 's/#confluent.monitoring.interceptor.topic.replication=3/confluent.monitoring.interceptor.topic.replication=1/g' $_c3_etc 
	sed -i 's/#confluent.controlcenter.command.topic.replication=3/confluent.controlcenter.command.topic.replication=1/g' $_c3_etc
	sed -i 's/#confluent.metrics.topic.replication=3/confluent.metrics.topic.replication=1/g' $_c3_etc

	# Use a persistent folder for control center data directory
	sed -i 's#confluent.controlcenter.data.dir=/tmp/confluent/control-center#confluent.controlcenter.data.dir=/var/lib/confluent/control-center#g' $_c3_etc

	# Configure local kafka for monitoring
	echo '' >> $_kafka_etc 
	echo 'metric.reporters=io.confluent.metrics.reporter.ConfluentMetricsReporter' >> $_kafka_etc
	echo 'confluent.metrics.reporter.bootstrap.servers=localhost:9092' >> $_kafka_etc 

	# Configure systemd to use control-center.properties instead of default production one
	sed -i 's#ExecStart=/usr/bin/control-center-start /etc/confluent-control-center/control-center-production.properties#ExecStart=/usr/bin/control-center-start /etc/confluent-control-center/control-center.properties#g' $_c3_system

	# Configure logging to /var/log
	ln -s /var/log/confluent/kafka ${pkgdir}/usr/logs

	# Removing unneeded file
	rm ${pkgdir}/confluent.conf

	# Installing Confluent CLI
	install -D -m 755 ${srcdir}/confluent/confluent "${pkgdir}/usr/bin/confluent"
}
