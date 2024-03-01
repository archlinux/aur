# Maintainer: fossdd <fossdd@pwned.life>

pkgname=justlog-git
_pkgname=${pkgname%-git}
pkgver=r573.dd7fc40
pkgrel=1
pkgdesc="twitch logging platform"
url='https://github.com/gempir/justlog'
license=(MIT)
arch=(x86_64)
depends=()
makedepends=(yarn go go-swagger)
provides=($_pkgname)
conflicts=($_pkgname)
backup=("etc/$_pkgname/config.json")
options=('!lto')
source=("$pkgname::git+$url.git"
	"$_pkgname.service")
sha256sums=('SKIP'
            '4bdcc19068406fcdb855ae617fd8070474ba87a32fc5a069dbe8c57d498105fe')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $pkgname
	yarn --cwd web install --ignore-optional
}

build() {
	cd $pkgname

	swagger generate spec -m -o ./web/public/swagger.json -w api
	yarn --cwd web build

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		.
}

package() {
	cd "$pkgname"

	# backend
	install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin/"

	# config
	# TODO: move file to /etc/$_pkgname.json
	mv "config.json.dist" "config.json"
	install -Dm644 "config.json" -t "$pkgdir/etc/$_pkgname/"

	# docs
	install -Dm644 'README.MD' -t "$pkgdir/usr/share/doc/$pkgname/"

	# systemd integration
	install -Dm644 "$srcdir/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	mkdir "$pkgdir/usr/lib/sysusers.d/" "$pkgdir/usr/lib/tmpfiles.d/"
	echo "u $_pkgname - '$_pkgname user' / /usr/bin/nologin" > "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	echo "Z /etc/$_pkgname 0755 $_pkgname $_pkgname" > "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
