# Maintainer: Koen Oostveen <koen at koenoostveen dot nl>
_name=jasm
pkgname=$_name-git
pkgver=0.7.0.r11.g0d41f21
pkgrel=1
pkgdesc='A JVM assembler for the modern age'
url='https://github.com/roscopeco/jasm'
license=('MIT')
arch=(any)
depends=(java-runtime=11 bash)
makedepends=(git jdk11-openjdk)
conflicts=(jasm-bin)
provides=(jasm-bin)

source=("git+https://github.com/roscopeco/jasm"
	"verification-metadata.xml"
	"verification-keyring.keys"
)

build() {
	export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

	install -Dm644 "verification-metadata.xml" -t "$_name/gradle"
	install -Dm644 "verification-keyring.keys" -t "$_name/gradle"
	cd "$_name"
	chmod +x gradlew
	./gradlew --no-daemon -q --dependency-verification strict -x check installDist
}

pkgver() {
	cd "$srcdir/$_name"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_name"
        install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
        install -d "$pkgdir/usr/lib/jasm"
        install -d "$pkgdir/usr/bin"

	dist="build/install/jasm"
        cp -r "$dist/bin" "$dist/lib" "$pkgdir/usr/lib/jasm"
        ln -s ../lib/jasm/bin/jasm "$pkgdir/usr/bin/jasm"
}

sha256sums=('SKIP'
            '9e8df5828002c92a1582d3975cd6897199d26a037aaa6629469a122d75782577'
            'b9cb634b3893a0351859dcc8222f8130c55468b07b51830e45907d921e93a8aa')
