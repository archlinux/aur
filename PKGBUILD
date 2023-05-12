# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

# GitLab Pages without DNS wildcard
# https://gitlab.com/gitlab-org/gitlab/issues/17584

pkgname=gitlab-pages
pkgver=15.11.3
pkgrel=1
pkgdesc='GitLab Pages daemon used to serve static websites for GitLab users'
url="https://gitlab.com/gitlab-org/$pkgname"
license=(MIT)
arch=(x86_64 i686)
makedepends=(go)
_archive="$pkgname-v$pkgver"
source=("$url/-/archive/v$pkgver/$_archive.tar.bz2"
        "$pkgname.service"
        'service.env')
backup=("etc/$pkgname/config.cfg"
        "etc/$pkgname/service.env")
sha256sums=('a949bc4912ea7e4a98dcc3cacc556205c86b2c1f66045f7796d202da4f6db669'
            'df2bb3607f500daf95ac7c3ddf2470c794a72c66ba0770029753f859f1c53082'
            'fd8f9b60e2247077ad00765904237b6b1c36b11a952cd3b1ad88e74417b82a96')

build() {
	cd "$_archive"
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
	cd "$_archive"
	install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm644 -t "$pkgdir/etc/$pkgname/" config.cfg ../service.env
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "../$pkgname.service"
}
