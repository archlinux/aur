# Maintainer: Wei Hao <dolem dot hao at gmail dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ml <>
# Contributor: 0x715C

pkgname=alda-git
pkgver=2.3.1.r55.ge003968
pkgrel=1
pkgdesc='A music programming language for musicians'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('custom:EPL2')
depends=('bash' 'java-runtime>=8')
makedepends=('git' 'go>=1.19' 'gradle')
provides=('alda')
conflicts=('alda' 'alda-bin')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^release-//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname/client"
	go mod download
}

build() {
	cd "$pkgname"
	(
		cd client
		export CGO_ENABLED=1
		export CGO_LDFLAGS="$LDFLAGS"
		export CGO_CFLAGS="$CFLAGS"
		export CGO_CPPFLAGS="$CPPFLAGS"
		export CGO_CXXFLAGS="$CXXFLAGS"
		export GOFLAGS='-buildmode=pie -modcacherw -trimpath -ldflags=-linkmode=external'
		go generate
		go build -o alda
	)

	cd player
	./gradlew --no-daemon build fatJar
}

package() {
	cd "$pkgname"
	
	# Install client binary
	install -D client/alda -t "$pkgdir/usr/bin"
	
	# Install player jar
	install -Dm644 player/build/libs/alda-player-fat.jar -T "$pkgdir/usr/share/java/alda-player.jar"
	
	# Create and install alda-player script
	cat > "$srcdir/alda-player" << EOF
#!/bin/sh

exec java -jar /usr/share/java/alda-player.jar "\$@"
EOF
	install -Dm755 "$srcdir/alda-player" -t "$pkgdir/usr/bin"
	
	# Install documentation
	find doc -type f -not -path "*/doc_zh_cn/*" -exec install -Dm644 {} -t "$pkgdir/usr/share/doc/$pkgname/" \;
	install -Dm644 examples/* -t "$pkgdir/usr/share/doc/$pkgname/examples/"

	# EPL v2 is not part of core/licenses. Let's add it here
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

