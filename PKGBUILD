# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ml <>
# Contributor: 0x715C

pkgname=alda-git
pkgver=2.2.1.r0.g798e6df
pkgrel=2
pkgdesc='A music programming language for musicians'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL')
depends=('bash' 'java-runtime>=8')
makedepends=('git' 'go' 'gradle')
provides=('alda')
conflicts=('alda')
source=("$pkgname::git+$url"
        alda-player)
sha256sums=('SKIP'
            '29550c5c69f95d6eba1155e3b45430e205e8a2502f597c8c36b7b5b5a126f900')

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
	gradle --no-daemon build
}

package() {
	install -D alda-player -t "$pkgdir/usr/bin"

	cd "$pkgname"
	install -D client/alda -t "$pkgdir/usr/bin"
	install -Dm644 player/build/libs/alda-player-fat.jar -T "$pkgdir/usr/share/java/alda-player.jar"
	install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"

	# EPL v2 is not part of core/licenses. Let's add it here
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

