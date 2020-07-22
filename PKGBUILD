# Maintainer: YuutaW <i@yuuta.moe>
pkgname='rsshub-git'
pkgver=cf97ab46
pkgrel=1
epoch=
pkgdesc="Everything is RSSible"
arch=('any')
url="https://rsshub.app/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
checkdepends=()
optdepends=()
backup=('etc/rsshub/rsshub.conf')
source=("$pkgname::git+https://github.com/DIYgod/RSSHub.git"
	"rsshub.conf"
	"rsshub.service")
noextract=()
md5sums=('SKIP'
         '6621493e94958b1d3ac8d031bff36eb4'
         '54c5973da069e43632e62ebeef50329b')
pkgver() {
    cd "$srcdir/$pkgname"
    git describe --always | sed 's|-|.|g'
}

prepare() {
	cd "$srcdir/$pkgname"
	# Remove unnecessary directory
	rm -rf .github
	rm -rf docs
	rm -rf test
}

build() {
	cd "$srcdir/$pkgname"
	npm install --production --cache "${srcdir}/npm-cache"

	# Cleanup node modules, as Dockerfile does.
	chmod +x ./tools/clean-nm.sh
	./tools/clean-nm.sh
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p $pkgdir/opt/rsshub
	cp -R ./* $pkgdir/opt/rsshub/
 	chown -R root:root "${pkgdir}/opt/"
 	find "${pkgdir}/opt" -type d -exec chmod 755 {} +

	mkdir -p $pkgdir/etc/rsshub
	install -Dm644 $srcdir/rsshub.conf $pkgdir/etc/rsshub/rsshub.conf

	mkdir -p $pkgdir/usr/share/licenses/rsshub/
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/rsshub/LICENSE

    # TODO: We still have several JS which contains the $srcdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	mkdir -p $pkgdir/usr/lib/systemd/system
	install -Dm644 $srcdir/rsshub.service $pkgdir/usr/lib/systemd/system/rsshub.service
}
