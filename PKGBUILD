# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=fedi-fetcher
pkgver=7.1.16
pkgrel=1
pkgdesc="FediFetcher is a tool for Mastodon that automatically fetches missing replies and posts from other fediverse instances, and adds them to your own Mastodon instance"
arch=(any)
url="https://github.com/nanos/FediFetcher"
license=(MIT)
checkdepends=(python-pytest)
depends=(
	python
	python-certifi
	python-charset-normalizer
	python-defusedxml
	python-docutils
	python-idna
	python-iniconfig
	python-pluggy
	python-dateutil
	python-requests
	python-six
	python-smmap
	python-urllib3
	python-xxhash
)

backup=(etc/fedi-fetcher/config.json)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	fedi-fetcher.service
	fedi-fetcher.timer
	sysusers-fedi-fetcher.conf
	tmpfiles-fedi-fetcher.conf
	example-config.json)
sha256sums=('43976fa6171297a312246e7f4317923764cb1985ca4e05a070b7666033ba960f'
            'cac866add6470ea7781366fdaf1f1e57cdbc0d7965e2b8e36c42a2dd88a1acd7'
            '4f3d8a37de2a11a794afd6e1d10df9abfe8cb8a42297fa8451e3e86228523265'
            'eca9986a6e86b3208c2f786125f8a513037cd5a59dab2670e9439d57a2f7f595'
            'b97bfea3b64a666f199f46c979711c0d469cc2d34a35e61443ee42ff8096538b'
            'f6f93eb189cdcc11343adab783eb3aa5dab0785baa9a2868ec8fe0fc0c2949b5')

check() {
	cd "$srcdir"
	pytest
}

package() {
	cd "$srcdir"
	install -Dm 644 $pkgname.{service,timer} -t "$pkgdir/usr/lib/systemd/system"
	install -Dm 644 "sysusers-$pkgname.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm 644 "tmpfiles-$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm 640 example-config.json "$pkgdir/etc/$pkgname/config.json"

	cd "$srcdir/FediFetcher-$pkgver"
	install -Dm 755 find_posts.py "$pkgdir/usr/bin/$pkgname"

	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
