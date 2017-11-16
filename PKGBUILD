# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Useful: https://gitlab.com/gitlab-org/gitlab-ce/issues/29963
pkgname=gitlab-pages
pkgver=0.6.0
pkgrel=1
pkgdesc='GitLab Pages daemon used to serve static websites for GitLab users'
url='https://gitlab.com/gitlab-org/gitlab-pages'
license=('MIT')
arch=('i686' 'x86_64')
depends=()
makedepends=('go')
source=("https://gitlab.com/gitlab-org/gitlab-pages/repository/v$pkgver/archive.tar.gz"
	'config.cfg'
	'gitlab-pages.service')
backup=('etc/gitlab-pages/config.cfg')
sha256sums=('dfe97a2c7a28788c1d2158244599caacec6ea47d584945e5ce3ef993ca2808f6'
            '4395ad32d8de8032704ef43ac61427e78ffe24064c13d1c0f06634d0e4b78f90'
            '56568f9959efef8a1f40587dcd21942a9938aaa97e7bd0b5a628905147c7b4ed')

build() {
	cd "$srcdir/$pkgname-v$pkgver-"*
	# static build does not work with Arch's Go, you get:
	# go install net: open /usr/lib/go/pkg/linux_amd64/net.a: permission denied
	# this means the chroot function will not work
	sed -i 's/\(export CGO_ENABLED := \)0/\11/' Makefile
	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver-"*
	install -Dm 755 gitlab-pages "$pkgdir/usr/bin/gitlab-pages"
	install -Dm 644 "$srcdir/config.cfg" "$pkgdir/etc/gitlab-pages/config.cfg"
	install -Dm 644 "$srcdir/gitlab-pages.service" "$pkgdir/usr/lib/systemd/system/gitlab-pages.service"
}
