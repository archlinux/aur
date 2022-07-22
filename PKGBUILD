# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
# Contributor: Peter Vasil <mail at petervasil dot net>
pkgname=h2
pkgver=2.1.214
_releasever=2022-06-13
pkgrel=1
pkgdesc="Java SQL database engine."
arch=('any')
url="http://www.h2database.com"
license=(MPL EPL)
depends=('java-runtime>=7' 'bash')
source=("https://github.com/h2database/h2database/releases/download/version-${pkgver}/h2-${_releasever}.zip")
md5sums=('06e77a0f1250e9d2158dc76a7e795b3f')
sha256sums=('34c5ffe2d27ceeff217e5b71aefe964fb3fb6c0e6891551bec4e599df5e78c9b')

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
