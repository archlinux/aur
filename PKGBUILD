# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Useful: https://gitlab.com/gitlab-org/gitlab-ce/issues/29963
pkgname=gitlab-pages
pkgver=0.7.1
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
sha256sums=('c9ab39dcadc4b82fd86957afb3d9fc12e795d18a2f10c8391b51553932f48773'
            '9c69b96b33e194cccbcb0e0412f422be8f9fea45c95a9df5353cb752463e99d6'
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
