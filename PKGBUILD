# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Useful: https://gitlab.com/gitlab-org/gitlab/issues/17584

pkgname=gitlab-pages
pkgver=1.41.0
pkgrel=1
pkgdesc='GitLab Pages daemon used to serve static websites for GitLab users'
url="https://gitlab.com/gitlab-org/$pkgname"
license=(MIT)
arch=(x86_64 i686)
makedepends=(go)
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2"
        "$pkgname.service"
        'service.env')
backup=("etc/$pkgname/config.cfg"
        "etc/$pkgname/service.env")
sha256sums=('77d68532ed024d42ddcdb7ce74156b347927cb7dbcd47d3cda3459313a44a681'
            'df2bb3607f500daf95ac7c3ddf2470c794a72c66ba0770029753f859f1c53082'
            'fd8f9b60e2247077ad00765904237b6b1c36b11a952cd3b1ad88e74417b82a96')

build() {
	cd "$pkgname-v$pkgver"
	export GOPATH="$srcdir"
	export CGO_ENABLED=0
	go build \
		-trimpath \
		-buildmode=exe \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags \"$LDFLAGS\" -X main.VERSION=$pkgver" \
		.
	./$pkgname -help 2>&1 |
		sed -ne '/=/{s/^  -//;s/\([^:]*\): \(.*\)/# \2\n#\1\n/;/config=/d;s/=""/=string/;p}' |
		sed -e '/daemon-.id=/{s/^#//;s/=0/=105/}' \
		> config.cfg
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm644 -t "$pkgdir/etc/$pkgname/" config.cfg ../service.env
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "../$pkgname.service"
}
