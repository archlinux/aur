# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=java-debug
pkgver=0.53.2 # renovate: datasource=github-tags depName=microsoft/java-debug
pkgrel=1
pkgdesc="The debug server implementation for Java."
arch=(any)
url="https://github.com/microsoft/java-debug"
license=('EPL-1.0')
depends=('java-runtime>=21')
makedepends=('java-environment-openjdk=21')

source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('09aa39292e892307270bb8f813bd9e9f1b969252fcb20ccfdfc074b596ddb30f')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	# fix build error
	sed -i -e "s#/4.36-I-builds/#/4.40/#" \
		"com.microsoft.java.debug.target/com.microsoft.java.debug.tp.target"
}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	JAVA_HOME="/usr/lib/jvm/java-21-openjdk" \
	MAVEN_OPTS="-Dmaven.repo.local=${startdir}/m2" \
		./mvnw clean install
}

package() {

	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-${pkgver}.jar" \
		"$pkgdir/usr/share/java-debug/com.microsoft.java.debug.plugin.jar"

	install -Dm755 "com.microsoft.java.debug.core/target/com.microsoft.java.debug.core-${pkgver}.jar" \
		"$pkgdir/usr/share/java-debug/com.microsoft.java.debug.core.jar"

	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
