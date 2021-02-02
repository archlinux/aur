# Maintainer: Leonard Janis Robert König <ljrk at ljrk dot org>
pkgname=hide-client
_pkgname=hide.client.linux
pkgver=0.9.1
pkgrel=1
epoch=
pkgdesc="Hide.me CLI VPN client for Linux"
arch=('any')
url="hide.me"
license=('GPL2')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/eventure/$_pkgname/archive/$pkgver.zip"
        "config_sysdirs.patch"
        "service_sysdirs.patch")
noextract=()
md5sums=('9346e79e8e1c98b5457a03e02febca9c'
         '07d59ac194c4aa8ee0de284283796461'
         'b2cee66ea77a0d76460131144d0a16b0')
validpgpkeys=()

prepare() {
	cd "$_pkgname-$pkgver"
	patch -p1 -i "$srcdir/config_sysdirs.patch"
	patch -p1 -i "$srcdir/service_sysdirs.patch"
}

build() {
	cd "$_pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	# readonly breaks build
#	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
	go build -o hide.me .
}

#check() {
#	cd "$_pkgname-$pkgver"
#	go test .
#}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 -t "$pkgdir"/usr/bin/ hide.me
	install -Dm644 -t "$pkgdir"/usr/share/hide.me/ CA.pem
	# For (system-wide) accessToken.txt
	install -dm750 "$pkgdir"/etc/hide.me/
	install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ hide.me@.service
}
