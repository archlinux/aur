# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=bazel-remote
pkgver=2.5.0
pkgrel=1
pkgdesc='A remote cache server for Bazel (and other build systems)'
url=https://github.com/buchgr/bazel-remote
license=(Apache-2.0)
arch=(x86_64)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        bazel-remote.service
		bazel-remote.conf
		sysusers.conf
		tmpfiles.conf)
b2sums=('453014bfa0c0640ffe1a3843f09f6141c050170bad469db6c7a3470aa4dac151a846061cdd8c03e41f435b3b3dd91a108a7e43a589e17bff197241086740efd6'
        '99940252528b14b66d1f64b6da918d126ec5d7cb480567f7941a527761970754cfa20e3928fd6041196e51d34facc48652a0ff1021926609df8715ea63be6ac4'
        '7ac4524785343a45e649806fb19e648cbc3128cb658528b20503a71cd5cf3e0e77dd6d2811f5caa467e9254dc446b9c8cbaa98f12d3139c77718d0d057d4b137'
        'f3899570f3cbe5c36344cadd3b23be36cc0e87e18c66758f64f9ae6152126c08b695311239c9833dcf6c8512eb384537805e5b9a22c1a4076073ecd1d2268184'
        '57be109368362e1d9d1203aff1c0b6851bee2172ef5a1d1a3360062cd1432cbd7d30a584551588344bb41d252efdc488e9705b7eed46ed6d0493381f7c94ba65')

_commit=54d1782d72b291937988edad32c9752abe269d8e

build () {
	cd "$pkgname-$pkgver"

	mkdir -p _build

	CGO_ENABLED=1 \
	CGO_CPPFLAGS="$CPPFLAGS" \
	CGO_CXXFLAGS="$CXXFLAGS" \
	CGO_CFLAGS="$CFLAGS" \
	CGO_LDFLAGS="$LDFLAGS" \
	GOPATH="$srcdir" \
	GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw' \
		go build -o _build -a -ldflags "-X main.gitCommit=$_commit" .
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin" _build/*
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/examples" examples/*.yml
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/bazel-remote.service"
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "$srcdir/bazel-remote.conf" "$pkgdir/etc/bazel-remote.conf"
}
