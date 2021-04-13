# Maintainer: Leonard Janis Robert König <ljrk at ljrk dot org>
pkgname=hide-client
_pkgname=hide.client.linux
pkgver=0.9.1
pkgrel=4
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
#XXX go.sum is created by `go mod tidy` as a workaround for repo not containing
#    a go.sum file, which is required for go 1.16 compatibility.
source=("https://github.com/eventure/$_pkgname/archive/$pkgver.zip"
        "go-sum.patch"
        "config_sysdirs.patch"
        "systemd-config.patch"
        "service_sysdirs.patch")
noextract=()
md5sums=('9346e79e8e1c98b5457a03e02febca9c'
         '3cca85f964053529bc7d6581ceb3abd7'
         '07d59ac194c4aa8ee0de284283796461'
         'cdd99adb78a8d0a5212e7f900fd53a6d'
         'ea50b6e6df86da7031cf72d8eaaf46a4')
validpgpkeys=()

prepare() {
	cd "$_pkgname-$pkgver"
	patch -p1 -i "$srcdir/systemd-config.patch"
	patch -p1 -i "$srcdir/config_sysdirs.patch"
	patch -p1 -i "$srcdir/service_sysdirs.patch"
	patch -p1 -i "$srcdir/go-sum.patch"
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
	install -Dm644 -t "$pkgdir"/etc/hide.me config
	install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ hide.me@.service
}
