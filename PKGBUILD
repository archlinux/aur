# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Useful: https://gitlab.com/gitlab-org/gitlab/issues/17584

pkgname=gitlab-pages
pkgver=1.38.0
pkgrel=4
pkgdesc='GitLab Pages daemon used to serve static websites for GitLab users'
url="https://gitlab.com/gitlab-org/$pkgname"
license=('MIT')
arch=('x86_64' 'i686')
makedepends=('go')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2"
        "$pkgname.service"
        'service.env')
backup=("etc/$pkgname/config.cfg"
		"etc/$pkgname/service.env")
sha256sums=('02b6d5329d62282e5caa31751c855af54456f363284dd467550a31ee864dd7bf'
            'ae62235f0fd66eaed7ad74048daf21b92058aba90e40fc2d3e7a684e9883c32e'
            'fd8f9b60e2247077ad00765904237b6b1c36b11a952cd3b1ad88e74417b82a96')

build() {
	cd "$pkgname-v$pkgver"
    export GOPATH="$srcdir"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags \"$LDFLAGS\" -X main.VERSION=$pkgver" \
        .
	./$pkgname -help 2>&1 |
		sed -ne '/=/{s/^  -//;s/\([^:]*\): \(.*\)/# \2\n#\1\n/;/config=/d;p}' |
		sed -e '/daemon-.id=/{s/^#//;s/=0/=105/}' \
		> config.cfg
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm644 -t "$pkgdir/etc/$pkgname/" config.cfg "$srcdir/service.env"
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$srcdir/$pkgname.service"
}
