# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
# Contributor: Peter Vasil <mail at petervasil dot net>
pkgname=h2
pkgver=2.0.204
_releasever=2021-12-21
pkgrel=1
pkgdesc="Java SQL database engine."
arch=('any')
url="http://www.h2database.com"
license=(MPL EPL)
depends=('java-runtime>=7' 'bash')
source=("https://github.com/h2database/h2database/releases/download/version-${pkgver}/h2-${_releasever}.zip")
sha256sums=('db56ce651133856ff471bae8d1eeb93937d50b4b8d78d70dc4a4eb8c8fcf5e04')

build() {
	cd "$srcdir"

	msg2 "Generate executable script..."
	cat > ${pkgname}-console.sh << EOF
#!/bin/sh
/usr/bin/java -cp "/usr/share/java/$pkgname/$pkgname.jar:\$H2DRIVERS:\$CLASSPATH" org.h2.tools.Console "\$@"
EOF
}

package() {
	cd "$srcdir"

	msg2 "Install Java libraries in /usr/share/java/${pkgname}..."
	install -d "$pkgdir"/usr/share/java/${pkgname}
	install -m644 ${pkgname}/bin/${pkgname}-${pkgver}.jar "$pkgdir"/usr/share/java/${pkgname}/${pkgname}.jar

	msg2 "Install an executable at /usr/bin/..."
	install -Dm755 ${pkgname}-console.sh "$pkgdir"/usr/bin/${pkgname}-console

	msg2 "Install documentation resources in /usr/share/doc/${pkgname}..."
	install -dm755 "$pkgdir"/usr/share/doc/${pkgname}
	cp -a ${pkgname}/docs/* "$pkgdir"/usr/share/doc/${pkgname}
}
