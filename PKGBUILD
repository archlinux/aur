# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: ml <>

pkgname=alda
pkgver=2.2.5
pkgrel=1
pkgdesc='A music programming language for musicians'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL')
depends=('bash' 'java-runtime>=8')
makedepends=('go' 'gradle')
source=("$pkgname-release-$pkgver.tar.gz::https://codeload.github.com/$pkgname-lang/$pkgname/tar.gz/refs/tags/release-$pkgver" 
	alda-player )
sha256sums=('5895896dcaea7678ae6aeefae5c49c548ff7bd23d2337985e8c1bb7fe431898d'
            '29550c5c69f95d6eba1155e3b45430e205e8a2502f597c8c36b7b5b5a126f900')

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
	gradle --no-daemon --parallel build
}

package() {
	install -Dv alda-player -t "$pkgdir/usr/bin"

	cd "$pkgname"-release-"$pkgver"
	install -Dv client/alda -t "$pkgdir/usr/bin"
	install -Dvm644 player/build/libs/alda-player-fat.jar -T "$pkgdir/usr/share/java/alda-player.jar"
	install -Dvm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"

	# EPL v2 is not part of core/licenses. Let's add it here
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
