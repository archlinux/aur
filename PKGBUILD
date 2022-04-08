# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ml <>

pkgname=alda
pkgver=2.2.0
pkgrel=1
pkgdesc='A music programming language for musicians'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL')
depends=('bash' 'java-runtime>=8')
makedepends=('go' 'gradle')
source=("$pkgname-$pkgver.tar.gz::$url/archive/release-$pkgver.tar.gz"
        alda-player)
sha256sums=('315875daf0df5540e31463bf2fd71d16804258e8a11985cfb8c3216acfbe2087'
            '4b47a09bc3d4b897b0549f223ba8fe41064f854e5f25bc092cafdee8cc80ef5e')

prepare() {
	cd "$pkgname-release-$pkgver/client"
	go mod download
}

build() {
	cd "$pkgname"-release-"$pkgver"
	(
		cd client
		export CGO_ENABLED=1
		export CGO_LDFLAGS="$LDFLAGS"
		export CGO_CFLAGS="$CFLAGS"
		export CGO_CPPFLAGS="$CPPFLAGS"
		export CGO_CXXFLAGS="$CXXFLAGS"
		export GOFLAGS='-buildmode=pie -modcacherw -trimpath -ldflags=-linkmode=external'
		go generate
		go build -o "$pkgname"
	)

	cd player
	gradle --no-daemon build
}

package() {
	install -D alda-player -t "$pkgdir/usr/bin"

	cd "$pkgname"-release-"$pkgver"
	install -D client/alda -t "$pkgdir/usr/bin"
	install -Dm644 player/build/libs/alda-player-fat.jar -T "$pkgdir/usr/share/java/alda-player.jar"

	install -d "$pkgdir/usr/share/doc"
	cp -aTf doc "$pkgdir/usr/share/doc/$pkgname/"
	cp -a examples -t "$pkgdir/usr/share/doc/$pkgname/"

	# EPL v2 is not part of core/licenses. Let's add it here
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
