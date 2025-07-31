# Maintainer: Kirill Tikhomirov <kirill2980440@gmail.com>
pkgname=openxeen-git
pkgver=r74.33c645b
pkgrel=1
pkgdesc="Open source engine reimplementation of Might & Magic 3, 4, 5 and World of Xeen"
arch=('x86_64')
url="https://github.com/busyDuckman/OpenXeen"
license=('GPL-2.0')
depends=('jdk8-openjdk' 'java8-openjfx')
makedepends=('git' 'maven')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/somereatardedwood/OpenXeen')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/OpenXeen"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/OpenXeen"
	mvn clean package -DskipTests
}

package() {
	cd "$srcdir/OpenXeen"
	install -Dm0664 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -D -m 755 "$srcdir/OpenXeen/target/OpenXeen-0.3-jar-with-dependencies.jar" \
		"$pkgdir/usr/share/java/openxeen/openxeen.jar"
	_startfile="$pkgdir/usr/bin/openxeen"
	install -Dm0644 /dev/stdin "$_startfile"<<END
#!/bin/sh
cd "/usr/share/java/openxeen"
exec /usr/bin/java -Xmx1024m -jar '/usr/share/java/openxeen/openxeen.jar' "$@"
END
	chmod +x "$_startfile"
}
