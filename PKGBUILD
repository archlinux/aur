# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Useful: https://gitlab.com/gitlab-org/gitlab/issues/17584

pkgname=gitlab-pages
pkgver=1.17.0
pkgrel=1
pkgdesc='GitLab Pages daemon used to serve static websites for GitLab users'
url="https://gitlab.com/gitlab-org/$pkgname"
license=('MIT')
arch=('x86_64' 'i686')
makedepends=('go-pie')
source=("$pkgname-v$pkgver.tar.gz::https://gitlab.com/gitlab-org/$pkgname/repository/v$pkgver/archive.tar.gz"
	'config.cfg'
	"$pkgname.service"
	'service.env')
backup=("etc/$pkgname/config.cfg")
sha256sums=('09051ce3c4fc85c45c3bea05e77e13933f1221ed84b3181feda4915dfa8b9c54'
            '5e2135793d43ec2f3343b49cf45b00f44ef74e813c7d152d2e0ed46af5c25122'
            'ae62235f0fd66eaed7ad74048daf21b92058aba90e40fc2d3e7a684e9883c32e'
            'fd8f9b60e2247077ad00765904237b6b1c36b11a952cd3b1ad88e74417b82a96')

build() {
	cd "$pkgname-v$pkgver-"*
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath"
	make
}

package() {
	cd "$pkgname-v$pkgver-"*
	install -Dm 755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm 644 -t "$pkgdir/etc/$pkgname/" "$srcdir/"{config.cfg,service.env}
	install -Dm 644 -t "$pkgdir/usr/lib/systemd/system/" "$srcdir/$pkgname.service"
}
