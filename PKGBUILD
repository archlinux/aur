# Maintainer: Franklin Yu <franklinyu@google.com>
pkgname=cloudprober
pkgver=0.12.6
pkgrel=1
pkgdesc='An active monitoring software to detect failures before your customers do.'
arch=(x86_64)
url="https://cloudprober.org"
license=(Apache)
makedepends=(go)
_commit='e441335ed11f4aec93becee7d8d290b1d80ef781'  # v0.12.6
source=("git+https://github.com/cloudprober/$pkgname#commit=$_commit" 'service')
sha256sums=(SKIP SKIP)

build() {
	cd "$pkgname"
	local ld_flags=(
		-X main.version=$pkgver
		-X main.buildTimestamp=$SOURCE_DATE_EPOCH
	)
	local go_flags=(
		--buildmode=pie
		--mod=readonly
		--modcacherw
		--trimpath

		# The values are used in the binary; see the upstream Makefile.
		--ldflags="${ld_flags[*]}"
	)
	CGO_ENABLED=0 go build "${go_flags[@]}" "./cmd/$pkgname.go"
}

check() {
	cd "$pkgname"
	# See https://github.com/cloudprober/cloudprober/issues/324
	# TODO: remove “TestK8STokenSource” in next release
	go test --skip='TestConnectFailures|TestK8STokenSource' ./...
}

package() {
	install -D --mode=755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -D --mode=644 ../service \
		"$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
