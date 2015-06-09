# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=apollo
pkgver=1.7.1
pkgrel=1
pkgdesc="A faster, more reliable, easier to maintain messaging broker built from ActiveMQ"
arch=(any)
url="http://activemq.apache.org/apollo/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('maven')
backup=(etc/conf.d/apollo)
install=apollo.install
source=("http://www.eu.apache.org/dist/activemq/activemq-$pkgname/$pkgver/$pkgname-project-$pkgver-source-release.tar.gz" apollo.service apollo-bin apollo-create-bin apollo-broker-bin)

build() {
	cd "$srcdir/$pkgname-project-$pkgver"

	cat << EOF > "$srcdir/maven.xml"
<settings>
	<localRepository>$srcdir/mvn-repo</localRepository>
</settings>
EOF

	MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m" mvn -s "$srcdir/maven.xml" -Dtest=false install
}

package() {
	cd "$pkgdir"

	tar --strip-components=1 -xzf "$srcdir/$pkgname-project-$pkgver/apollo-distro/target/apache-$pkgname-$pkgver-unix-distro.tar.gz"
	
	install -Dm0644 "$srcdir/apollo.service" usr/lib/systemd/system/apollo.service

	# etc
	install -dm0755 etc/$pkgname
	mv etc/jul.properties etc/$pkgname/

	# bin
	install -Dm0755 "$srcdir/apollo-bin" usr/bin/apollo
	install -Dm0755 "$srcdir/apollo-create-bin" usr/bin/apollo-create
	install -Dm0755 "$srcdir/apollo-broker-bin" usr/bin/apollo-broker
	rm -rf bin

	# lib
	install -dm0755 usr/lib
	mv lib usr/lib/$pkgname
	rm -f usr/lib/apollo/leveldbjni-{osx,win*}-*.jar

	# docs
	install -dm0755 usr/share/doc/$pkgname
	mv docs/site/* examples NOTICE readme.html usr/share/doc/$pkgname/
	rm -rf docs
	rm LICENSE

	# perms
	find . -type d -exec chmod 755 {} \;
	find usr/lib usr/share -type f -exec chmod 644 {} \;
}

sha256sums=('a5b297c5852eb49b9a2ef02996882e507486168cf52ea4eecddbcf94913a7162'
            '79dd8c0a654af5e61fb3c30df9967a48f82f59d3c45990696d5b69995f0f355e'
            '3ec1cabb3645bcb8c1554923b75a33fa3cb1bdbaf33b26b8e72240bd2d41212b'
            'd08926af50047b9861ba54e6c0805f4be249f6cff7c95bd2654082222bf28f42'
            '148420ec6abe65ffda1fddfaa3fbaa14996195cb3ac3dbb0d5c0a9440f898784')
